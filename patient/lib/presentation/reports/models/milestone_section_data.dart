import 'package:patient/presentation/reports/widgets/milestone_list_item.dart';

class MilestoneSection {
  final String title;
  final List<MilestoneListItem> items;

  const MilestoneSection({
    required this.title,
    required this.items,
  });
}

List<MilestoneSection> milestoneSections = const [
  MilestoneSection(
    title: 'Completed Milestones',
    items: [
      MilestoneListItem(
        title: 'Development Milestone 1',
        description: 'Successfully achieved on February 15, 2025',
      ),
      MilestoneListItem(
        title: 'Behavioral Goal 2',
        description: 'Mastered on March 10, 2025',
      ),
    ],
  ),
  MilestoneSection(
    title: 'Missed Milestones',
    items: [
      MilestoneListItem(
        title: 'Communication Skill 3',
        description: 'Expected completion: April 10, 2025',
      ),
      MilestoneListItem(
        title: 'Social Interaction Goal',
        description: 'Target date passed: April 15, 2025',
      ),
    ],
  ),
  MilestoneSection(
    title: 'Regressed Milestones',
    items: [
      MilestoneListItem(
        title: 'Speech Development',
        description: 'Showing decline since last assessment',
      ),
      MilestoneListItem(
        title: 'Motor Skills',
        description: 'Needs immediate intervention',
      ),
    ],
  ),
];
