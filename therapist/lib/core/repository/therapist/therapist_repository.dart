import 'package:therapist/core/result/action_result.dart';

abstract interface class TherapistRepository {

  // All the patients of the therapist

  Future<ActionResult> getTherapistPatients();

  // Get Therapist Schedule as per date

  Future<ActionResult> getTherapistSchedule();

  // Get Therapist Upcoming Appointments
  Future<ActionResult> getTherapistUpcomingAppointments();

  // Change the status of the appointment

  Future<ActionResult> changeAppointmentStatus(String appointmentId, String status);

  // Get the total number of patients
  Future<ActionResult> getTotalPatients();

  // Get the total number of Sessions

  Future<ActionResult> getTotalSessions();

  // Get the total number of Therapies

  Future<ActionResult> getTotalTherapies();

}