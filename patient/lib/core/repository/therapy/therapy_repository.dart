import 'package:patient/core/result/result.dart';

abstract interface class TherapyGoalsRepository {

  Future<ActionResult> getTherapyGoals(String patientId);

}