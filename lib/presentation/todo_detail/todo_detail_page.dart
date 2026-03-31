import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/entity/todo.dart';
import '../todo_list/todo_list_view_model.dart';

/// Todo詳細画面
class TodoDetailPage extends ConsumerWidget {
  const TodoDetailPage({
    super.key,
    required this.todoId,
    required this.viewModelKey,
  });

  final String todoId;
  final String viewModelKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(todoListViewModelProvider(viewModelKey));

    return asyncState.when(
      loading: () => Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Scaffold(
        appBar: AppBar(),
        body: Center(child: Text('エラー: $e')),
      ),
      data: (state) {
        final todo = state.todos.cast<Todo?>().firstWhere(
              (t) => t?.id == todoId,
              orElse: () => null,
            );

        if (todo == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Todo詳細')),
            body: const Center(child: Text('Todoが見つかりません')),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Todo詳細'),
            actions: [
              IconButton(
                icon: const Icon(Icons.delete_outline),
                tooltip: '削除',
                onPressed: () async {
                  final confirmed = await showDialog<bool>(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('削除の確認'),
                      content: const Text('このTodoを削除しますか？'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(ctx).pop(false),
                          child: const Text('キャンセル'),
                        ),
                        FilledButton(
                          onPressed: () => Navigator.of(ctx).pop(true),
                          child: const Text('削除'),
                        ),
                      ],
                    ),
                  );
                  if (confirmed == true && context.mounted) {
                    await ref
                        .read(todoListViewModelProvider(viewModelKey).notifier)
                        .deleteTodo(todoId);
                    if (context.mounted) context.pop();
                  }
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      todo.isCompleted
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      color: todo.isCompleted ? Colors.green : Colors.grey,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      todo.isCompleted ? '完了' : '未完了',
                      style: TextStyle(
                        color: todo.isCompleted ? Colors.green : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  todo.title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        decoration: todo.isCompleted
                            ? TextDecoration.lineThrough
                            : null,
                        color: todo.isCompleted ? Colors.grey : null,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  '作成日: ${_formatDate(todo.createdAt)}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    icon: Icon(
                      todo.isCompleted ? Icons.undo : Icons.check,
                    ),
                    label: Text(todo.isCompleted ? '未完了に戻す' : '完了にする'),
                    onPressed: () => ref
                        .read(todoListViewModelProvider(viewModelKey).notifier)
                        .toggleTodo(todoId),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _formatDate(DateTime dt) {
    return '${dt.year}/${dt.month.toString().padLeft(2, '0')}/${dt.day.toString().padLeft(2, '0')}';
  }
}
