import 'package:flutter/material.dart';

class TherapistDataProvider with ChangeNotifier {
  // Regulatory bodies list
  final List<DropdownMenuEntry> regulatoryBodyDropdownItems = [
    const DropdownMenuEntry(
      value: 'Rehabilitation Council of India',
      label: 'Rehabilitation Council of India',
    ),
    const DropdownMenuEntry(
      value: 'All India Occupational Therapists Association',
      label: 'All India Occupational Therapists Association',
    ),
    const DropdownMenuEntry(
      value: 'All India Speech and Hearing Association',
      label: 'All India Speech and Hearing Association',
    ),
    const DropdownMenuEntry(
      value: 'Indian Association of Physiotherapists',
      label: 'Indian Association of Physiotherapists',
    ),
    const DropdownMenuEntry(
      value: 'Indian Association of Occupational Therapists',
      label: 'Indian Association of Occupational Therapists',
    ),
  ];

  // Specialization list
  final List<DropdownMenuEntry> specializationDropdownItems = [
    const DropdownMenuEntry(
      value: 'Neurologists',
      label: 'Neurologists',
    ),
    const DropdownMenuEntry(
      value: 'Psychiatrists',
      label: 'Psychiatrists',
    ),
    const DropdownMenuEntry(
      value: 'Neuropsychiatrists',
      label: 'Neuropsychiatrists',
    ),
    const DropdownMenuEntry(
      value: 'Clinical Psychologists',
      label: 'Clinical Psychologists',
    ),
    const DropdownMenuEntry(
      value: 'Pediatric Psychiatrists',
      label: 'Pediatric Psychiatrists',
    ),
    const DropdownMenuEntry(
      value: 'Pediatric Neurologists',
      label: 'Pediatric Neurologists',
    ),
    const DropdownMenuEntry(
      value: 'Developmental and Behavioral Pediatricians',
      label: 'Developmental and Behavioral Pediatricians',
    ),
    const DropdownMenuEntry(
      value: 'Counseling Psychologists',
      label: 'Counseling Psychologists',
    ),
    const DropdownMenuEntry(
      value: 'Cognitive Behavioral Therapists',
      label: 'Cognitive Behavioral Therapists',
    ),
    const DropdownMenuEntry(
      value: 'Psychopharmacologists',
      label: 'Psychopharmacologists',
    ),
  ];

  // Therapies list
  final List<String> therapies = [
    'Speech Therapy',
    'Physical Therapy',
    'Occupational Therapy',
    'Cognitive Behavioral Therapy',
    'Psychotherapy',
    'Music Therapy',
    'Art Therapy',
    'Dance Therapy',
    'Play Therapy',
    'Recreational Therapy',
    'Nutritional Therapy',
    'Behavioral Therapy',
    'Family Therapy',
    'Group Therapy',
    'Individual Therapy',
    'Couples Therapy',
    'Dialectical Behavior Therapy',
    'Vocational Therapy',
  ];

  Future<void> fetchTherapistData() async {
    // TODO: implemented later to fetch data from Supabase
    notifyListeners();
  }
}
