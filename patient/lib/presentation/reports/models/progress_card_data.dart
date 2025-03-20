class ProgressCardData {
  final String value;
  final String label;
  final double percentage;
  final double height;

  const ProgressCardData({
    required this.value,
    required this.label,
    required this.percentage,
    required this.height,
  });
}

ProgressCardData progressCard = const ProgressCardData(
  value: '12/20',
  label: 'Milestones Completed Successfully',
  percentage: 60,
  height: 138,
);
