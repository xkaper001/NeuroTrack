import 'package:therapist/core/result/action_result.dart';

abstract interface class TherapyRepository {

  Future<ActionResult> getTherapyDetails();

  Future<ActionResult> saveTherapyDetails();

  Future<ActionResult> getTherapyActivities();

  Future<ActionResult> saveTherapyActivities();

}