import 'package:cft/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: const Text('ホームに戻りますか？'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('キャンセル'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      context.go(HomePage.path);
                    },
                    child: const Text('戻る'),
                  ),
                ],
              );
            },
          );
        },
        icon: const Icon(Icons.home),
      ),
    );
  }
}
