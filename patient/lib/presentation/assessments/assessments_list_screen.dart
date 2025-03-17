import 'package:flutter/material.dart';
import 'package:patient/core/theme/theme.dart';
import 'package:patient/presentation/assessments/assessment_screen.dart';

class AssessmentsListScreen extends StatelessWidget {
  const AssessmentsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                'Assessment',
                style: theme.textTheme.displayLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Select assessment you\'d like to take',
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontSize: 14,
                  color: AppTheme.subtitleColor,
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: AssessmentData.assessments.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final assessment = AssessmentData.assessments[index];
                    return AssessmentCard(
                      assessment: assessment,
                      onTap: () {
                        // Handle assessment selection
                        //update the assessment id in the provider by using the setAssessmentId method for e.g:
                        // Provider.of<AssessmentProvider>(context, listen: false)
                        //     .setAssessmentId(assessment.id);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AssessmentScreen()));
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AssessmentCard extends StatelessWidget {
  final AssessmentCardModel assessment;
  final VoidCallback onTap;

  const AssessmentCard({
    super.key,
    required this.assessment,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF9F9FC),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 18.0, right: 18.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      assessment.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      assessment.description,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AssessmentIcon(assessment: assessment),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AssessmentIcon extends StatelessWidget {
  final AssessmentCardModel assessment;

  const AssessmentIcon({
    super.key,
    required this.assessment,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assessment.iconPath,
      width: 80,
      height: 80,
      fit: BoxFit.contain,
    );
  }
}

class AssessmentCardModel {
  final String id;
  final String title;
  final String description;
  final String iconPath;

  const AssessmentCardModel({
    required this.id,
    required this.title,
    required this.description,
    required this.iconPath,
  });
}

// Constant list of assessments
class AssessmentData {
  static const List<AssessmentCardModel> assessments = [
    AssessmentCardModel(
      id: 'autism_quotient',
      title: 'Autism Quotient(AQ)',
      description: 'A quick referral guide to adults with suspected autism',
      iconPath: 'assets/autism_icon.png',
    ),
    AssessmentCardModel(
      id: 'asrs_5',
      title: 'ASRS-5',
      description:
          'The Adult ADHD Self-Report Scale for DSM-5 (ASRS-5) is a self-report screening scale for ADHD in adults',
      iconPath: 'assets/adhd_icon.png',
    ),
    AssessmentCardModel(
      id: 'aq_10',
      title: 'AQ-10',
      description:
          'The AQ-10 is a quick questionnaire that primary care practitioners can use to see if a person should be referred for an autism assessment.',
      iconPath: 'assets/aq10_icon.png',
    ),
  ];
}
