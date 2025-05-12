import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeleteAlertDialog extends ConsumerWidget {
  const DeleteAlertDialog({super.key});

  static Future<bool?> show(
    BuildContext context,
  ) {
    return showDialog<bool>(
      context: context,
      builder: (context) => const DeleteAlertDialog(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('削除確認'),
      content: const Text('本当に削除しますか？'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('キャンセル'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: const Text('削除'),
        ),
      ],
    );
  }
}
