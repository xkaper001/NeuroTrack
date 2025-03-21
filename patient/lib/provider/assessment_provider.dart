import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:patient/core/result/result.dart';
import 'package:patient/model/assessment_models/assessment_answer_model.dart';
import 'package:patient/model/assessment_models/assessment_models.dart';
import 'package:patient/model/assessment_models/assessment_question_answer_model.dart';
import 'package:patient/presentation/assessments/models/assessment_card_model.dart';
import 'package:patient/repository/supabase_assessments_repository.dart';

class AssessmentProvider with ChangeNotifier {
  final SupabaseAssessmentsRepository _repository =
      SupabaseAssessmentsRepository();

  String? _assessmentId;
  String? get assessmentId => _assessmentId;
  List<AssessmentModel> _allAssessments = [];

  List<AssessmentModel> get allAssessments => _allAssessments;

  String _selectedAssesssmentId = '';

  AssessmentAnswerModel _assessmentAnswerModel = AssessmentAnswerModel(questions: [], assessmentId: '');

  AssessmentAnswerModel? get assessmentAnswerModel => _assessmentAnswerModel;


  set assessmentAnswers(AssessmentQuestionAnswerModel answers) { 
    final index = _assessmentAnswerModel.questions.indexWhere((element) => element.questionId == answers.questionId);
    if(index != -1) {
      _assessmentAnswerModel.questions[index] = answers;
    } else {
      _assessmentAnswerModel.questions.add(answers);
    }
    notifyListeners();
  } 

  String get selectedAssessmentId => _selectedAssesssmentId;
  set selectedAssessmentId(String value) {
    _selectedAssesssmentId = value;
    _assessmentAnswerModel = _assessmentAnswerModel.copyWith(assessmentId: value, questions: []);
    notifyListeners();
  }


  void fetchAllAssessments() async {
    final result = await _repository.fetchAllAssessments();
    if (result is ActionResultSuccess) {
      _allAssessments = result.data;
    }
    notifyListeners();
  }

  //implement the submitAssessment method to submit the assessment when the submitted_assessment table is created
  Future<void> submitAssessment() async {
    final result = await _repository.submitAssessment(_assessmentAnswerModel.toEntity());
  }

}
