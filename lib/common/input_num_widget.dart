import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputNumWidget extends ConsumerWidget {
  const InputNumWidget({
    super.key,
    required this.controller,
    required this.onSubmitted,
  });
  final TextEditingController controller;
  final void Function() onSubmitted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        for (final x in [0, 1, 2])
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final y in [1 + (3 * x), 2 + (3 * x), 3 + (3 * x)])
                SizedBox(
                  width: 64,
                  height: 64,
                  child: InkWell(
                    onTap: () {
                      controller.text = '${controller.text}$y';
                      // setState(() {});
                    },
                    child: Center(
                      child: Text(
                        '$y',
                        style: const TextStyle(fontSize: 32),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 64,
              height: 64,
              child: InkWell(
                onTap: () {
                  controller.text = '${controller.text}0';
                  // setState(() {});
                },
                child: const Center(
                  child: Text(
                    '0',
                    style: TextStyle(fontSize: 32),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 64 * 3,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    controller.clear();
                  },
                  child: const Text(
                    '消去',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: onSubmitted,

                  // () {
                  //   notifier.setUserAnswer(int.parse(controller.text));
                  //   notifier.nextProblem();
                  //   controller.clear();
                  // },
                  child: const Text(
                    '決定',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
