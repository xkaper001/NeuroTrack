
import 'package:dart_mappable/dart_mappable.dart';

part 'therapist_upcoming_appointment_model.mapper.dart';

@MappableClass()
class TherapistUpcomingAppointmentModel with TherapistUpcomingAppointmentModelMappable {

  final String sessionId;
  final String patientId;
  final String patientName;
  final String phoneNo;
  final String therapyName;
  final DateTime timestamp;
  final String? mode;
  final int? duration;
  final String? status;

  TherapistUpcomingAppointmentModel({
    required this.sessionId,
    required this.patientId,
    required this.patientName,
    required this.phoneNo,
    required this.therapyName,
    required this.timestamp,
    this.mode,
    this.duration,
    this.status,
  });


}