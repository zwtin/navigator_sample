import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../todo_list/todo_list_view_model.dart';

/// Todo追加ダイアログ
/// flutter_hooksのuseTextEditingController()でコントローラーのライフサイクルを管理
Future<void> showAddTodoDialog(BuildContext context, WidgetRef ref) {
  return showDialog(
    context: context,
    builder: (context) => const _AddTodoDialog(),
  );
}

class _AddTodoDialog extends HookConsumerWidget {
  const _AddTodoDialog();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // useTextEditingController: Hookによりウィジェットのライフサイクルとコントローラーを自動連動
    final controller = useTextEditingController();
    final isSubmitting = useState(false);

    Future<void> submit() async {
      final title = controller.text.trim();
      if (title.isEmpty) return;

      isSubmitting.value = true;
      await ref.read(todoListViewModelProvider.notifier).addTodo(title);
      isSubmitting.value = false;

      if (context.mounted) Navigator.of(context).pop();
    }

    return AlertDialog(
      title: const Text('Todoを追加'),
      content: TextField(
        controller: controller,
        autofocus: true,
        decoration: const InputDecoration(
          hintText: 'タイトルを入力...',
          border: OutlineInputBorder(),
        ),
        onSubmitted: (_) => submit(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('キャンセル'),
        ),
        FilledButton(
          onPressed: isSubmitting.value ? null : submit,
          child: isSubmitting.value
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('追加'),
        ),
      ],
    );
  }
}
