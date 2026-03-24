import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../add_todo/add_todo_dialog.dart';
import 'todo_list_view_model.dart';

/// TodoList画面のView
/// - HookConsumerWidget: flutter_hooks と Riverpod を両方使えるウィジェット
/// - Viewはpassiveに徹し、ロジックはすべてViewModelに委譲する
class TodoListPage extends HookConsumerWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // AsyncValue<TodoListState>をwatchして、Loading/Error/Dataを宣言的にハンドリング
    final asyncState = ref.watch(todoListViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo リスト'),
        actions: [
          asyncState.whenOrNull(
            data: (state) => state.isLoading
                ? const Padding(
                    padding: EdgeInsets.all(16),
                    child: SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  )
                : null,
          ) ?? const SizedBox.shrink(),
        ],
      ),
      body: asyncState.when(
        // ローディング中はスピナー表示
        loading: () => const Center(child: CircularProgressIndicator()),
        // エラー時はエラーメッセージとリトライボタンを表示
        error: (error, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text('エラーが発生しました\n$error'),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () => ref.invalidate(todoListViewModelProvider),
                child: const Text('再読み込み'),
              ),
            ],
          ),
        ),
        // データ取得完了
        data: (state) {
          if (state.todos.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.checklist, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'Todoがありません\n右下のボタンから追加してください',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (context, index) {
              final todo = state.todos[index];
              return Dismissible(
                key: ValueKey(todo.id),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 16),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (_) {
                  ref
                      .read(todoListViewModelProvider.notifier)
                      .deleteTodo(todo.id);
                },
                child: ListTile(
                  leading: Checkbox(
                    value: todo.isCompleted,
                    onChanged: (_) => ref
                        .read(todoListViewModelProvider.notifier)
                        .toggleTodo(todo.id),
                  ),
                  title: Text(
                    todo.title,
                    style: todo.isCompleted
                        ? const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          )
                        : null,
                  ),
                  subtitle: Text(
                    _formatDate(todo.createdAt),
                    style: const TextStyle(fontSize: 12),
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => context.go('/todos/${todo.id}'),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddTodoDialog(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }

  String _formatDate(DateTime dt) {
    return '${dt.year}/${dt.month.toString().padLeft(2, '0')}/${dt.day.toString().padLeft(2, '0')}';
  }
}
