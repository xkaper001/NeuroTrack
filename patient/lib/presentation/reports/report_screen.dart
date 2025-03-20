import 'package:flutter/material.dart';
import 'package:patient/core/theme/theme.dart';
import 'package:patient/presentation/reports/models/milestone_card_data.dart';
import 'package:patient/presentation/reports/models/milestone_section_data.dart';
import 'package:patient/presentation/reports/models/progress_card_data.dart';
import 'package:patient/presentation/reports/widgets/expandable_section.dart';
import 'package:patient/presentation/reports/widgets/progress_summary.dart';
import 'package:patient/presentation/reports/widgets/milestone_cards.dart';

class ReportsScreen extends StatelessWidget {
  // Define the dynamic data

  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Reports',
                          style: theme.textTheme.displayMedium,
                        ),
                        const ImageIcon(AssetImage(
                          'assets/calendar.png',
                        )),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Milestones Progress Section
                    Row(
                      children: [
                        Text(
                          'Milestones Progress',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '(Jun 1 - Jun 30)',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Milestone Cards - Rearranged Layout with dynamic data
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left column - Completed card
                        CompletedMilestoneCard(
                          iconPath: milestoneCards[0].iconPath,
                          iconColor: milestoneCards[0].iconColor,
                          backgroundColor: milestoneCards[0].backgroundColor,
                          value: milestoneCards[0].value,
                          label: milestoneCards[0].label,
                        ),
                        // Right column - Missed and Regressed cards stacked
                        Column(
                          children: [
                            HorizontalMilestoneCard(
                              iconPath: milestoneCards[1].iconPath,
                              iconColor: milestoneCards[1].iconColor,
                              backgroundColor:
                                  milestoneCards[1].backgroundColor,
                              value: milestoneCards[1].value,
                              label: milestoneCards[1].label,
                            ),
                            const SizedBox(height: 12),
                            HorizontalMilestoneCard(
                              iconPath: milestoneCards[2].iconPath,
                              iconColor: milestoneCards[2].iconColor,
                              backgroundColor:
                                  milestoneCards[2].backgroundColor,
                              value: milestoneCards[2].value,
                              label: milestoneCards[2].label,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Progress Card - Dynamic data
                    MilestoneProgressCard(
                      value: progressCard.value,
                      label: progressCard.label,
                      percentage: progressCard.percentage.toInt(),
                      height: progressCard.height,
                    ),
                    const SizedBox(height: 24),

                    // Milestones in Details Section
                    Text(
                      'Milestones in Details',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Dynamic Expandable Sections using ExpandableSection
                    ...milestoneSections.map((section) => ExpandableSection(
                          title: section.title,
                          children: section.items,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
