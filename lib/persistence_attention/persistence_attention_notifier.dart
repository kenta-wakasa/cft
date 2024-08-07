import 'package:cft/persistence_attention/persistence_attention_state.dart';
import 'package:cft/persistence_attention/simple_arithmetic_problem.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'operator.dart';

part 'persistence_attention_notifier.g.dart';

@riverpod
class PersistenceAttentionNotifier extends _$PersistenceAttentionNotifier {
  @override
  PersistenceAttentionState build() {
    state = PersistenceAttentionState(
      isPlaying: false,
      problems: [],
      startedAt: null,
      countDownTime: 0,
    );
    nextProblem();
    return state;
  }

  Future<void> start() async {
    build();
    state = state.copyWith(countDownTime: 3);
    while (state.countDownTime != 0) {
      await Future.delayed(const Duration(seconds: 1));
      state = state.copyWith(countDownTime: state.countDownTime - 1);
    }
    state = state.copyWith(
      isPlaying: true,
      startedAt: DateTime.now(),
      problems: [],
      isTimeUp: false,
    );
    nextProblem();
  }

  Future<void> timeUp() async {
    state = state.copyWith(isTimeUp: true);
  }

  void setUserAnswer(int userAnswer) {
    final currentProblem = state.problems.last;
    final newProblem = currentProblem.copyWith(
      userAnswer: userAnswer,
      answeredAt: DateTime.now(),
    );
    state = state.copyWith(problems: [
      for (final problem in state.problems)
        if (problem == currentProblem) newProblem else problem
    ]);
  }

  void nextProblem() {
    while (true) {
      final newRandomOperator = Operator.values[
          SimpleArithmeticProblem.random.nextInt(Operator.values.length)];
      final newProblem = SimpleArithmeticProblem.generate(newRandomOperator);
      if ((newProblem.randomOperator == Operator.addition &&
              newProblem.answer < 10) ||
          (newProblem.randomOperator == Operator.subtraction &&
              newProblem.answer >= 0) ||
          (newProblem.randomOperator == Operator.division &&
              newProblem.answer % 1 == 0) ||
          (newProblem.randomOperator == Operator.multiplication)) {
        state = state.copyWith(problems: [...state.problems, newProblem]);
        return;
      }
    }
  }
}