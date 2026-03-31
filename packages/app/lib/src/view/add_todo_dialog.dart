import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../view_model/todo_list_view_model.dart';

Future<void> showAddTodoDialog(
    BuildContext context, WidgetRef ref, String viewModelKey) {
  return showDialog(
    context: context,
    builder: (context) => _AddTodoDialog(viewModelKey: viewModelKey),
  );
}

class _AddTodoDialog extends HookConsumerWidget {
  const _AddTodoDialog({required this.viewModelKey});

  final String viewModelKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final isSubmitting = useState(false);

    Future<void> submit() async {
      final title = controller.text.trim();
      if (title.isEmpty) return;

      isSubmitting.value = true;
      await ref
          .read(todoListViewModelProvider(viewModelKey).notifier)
          .addTodo(title);
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
