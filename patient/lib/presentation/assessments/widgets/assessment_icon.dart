import 'package:flutter/material.dart';
import 'package:patient/presentation/assessments/models/assessment_card_model.dart';

class AssessmentIcon extends StatelessWidget {
  final String icon;

  const AssessmentIcon({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      width: 80,
      height: 80,
      fit: BoxFit.contain,
    );
  }
}
