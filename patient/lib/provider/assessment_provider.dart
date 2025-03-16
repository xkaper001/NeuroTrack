import 'package:flutter/material.dart';
import 'package:patient/repository/supabase_assessments_repository.dart';

class AssessmentProvider with ChangeNotifier {
  final SupabaseAssessmentsRepository _repository =
      SupabaseAssessmentsRepository();
  Map<String, dynamic>? _assessment;
  Map<int, String?> _selectedAnswers = {};
  String? _assessmentId;

  String? get assessmentId => _assessmentId;
  Map<String, dynamic>? get assessment => _assessment;
  Map<int, String?> get selectedAnswers => _selectedAnswers;

  Future<void> fetchAssessmentById(String id) async {
    try {
      final assessments = await _repository.fetchAssessmentById(id);
      if (assessments.isNotEmpty) {
        _assessment = assessments.first;
        _selectedAnswers = {
          for (int i = 0; i < _assessment!['questions'].length; i++) i: null
        };
      } else {
        _assessment = null;
        _selectedAnswers.clear();
      }
      notifyListeners();
    } catch (e) {
      // debugPrint('Error fetching assessment: $e');
      _assessment = null;
      _selectedAnswers.clear();
      notifyListeners();
    }
  }

  void selectAnswer(int questionIndex, String answer) {
    if (_assessment != null &&
        questionIndex >= 0 &&
        questionIndex < _assessment!['questions'].length) {
      _selectedAnswers[questionIndex] = answer;
      notifyListeners();
    }
  }

  //implement the submitAssessment method to submit the assessment when the submitted_assessment table is created
  Future<void> submitAssessment() async {}

  //setAssessmentId method can be used to set the assessment id
  void setAssessmentId(String id) {
    _assessmentId = id;
    notifyListeners();
  }
}
