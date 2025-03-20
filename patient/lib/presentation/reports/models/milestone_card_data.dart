import 'package:flutter/material.dart';

class MilestoneCardData {
  final String iconPath;
  final Color iconColor;
  final Color backgroundColor;
  final String value;
  final String label;
  final bool isCompletedCard;

  const MilestoneCardData({
    required this.iconPath,
    required this.iconColor,
    required this.backgroundColor,
    required this.value,
    required this.label,
    this.isCompletedCard = false,
  });
}

List<MilestoneCardData> milestoneCards = const [
  MilestoneCardData(
    iconPath: "assets/completed_icon.png",
    iconColor: Color(0xff36662C),
    backgroundColor: Color(0xFFF5FAF4),
    value: '2,000',
    label: 'Completed',
    isCompletedCard: true,
  ),
  MilestoneCardData(
    iconPath: "assets/missed_icon.png",
    iconColor: Color(0xffFFA400),
    backgroundColor: Color(0xFFFFF5E3),
    value: '10',
    label: 'Missed',
  ),
  MilestoneCardData(
    iconPath: "assets/regressed_icon.png",
    iconColor: Color(0xffFF3939),
    backgroundColor: Color(0xFFFFEAEA),
    value: '500',
    label: 'Regressed',
  ),
];
