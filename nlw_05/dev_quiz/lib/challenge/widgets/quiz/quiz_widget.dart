import 'package:DevQuiz/challenge/widgets/answer/answer_widget.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final QuestionModel question;

  QuizWidget({required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              question.title,
              style: AppTextStyles.heading,
            ),
            SizedBox(
              height: 20,
            ),
            ...question.answers
                .map(
                  (e) => AnswerWidget(
                    isRight: e.isRight,
                    title: e.title,
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}
