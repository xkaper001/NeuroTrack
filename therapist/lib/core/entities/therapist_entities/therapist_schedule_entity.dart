import 'package:dart_mappable/dart_mappable.dart';

part 'therapist_schedule_entity.mapper.dart';

@MappableClass()
class TherapistScheduleEntity with TherapistScheduleEntityMappable {

  @MappableField(key: 'id')
  final String sessionId;

  @MappableField(key: 'created_at')
  final String createdAt;

  @MappableField(key: 'timestamp')
  final DateTime timestamp;

  @MappableField(key: 'therapist_id')
  final String therapistId;

  @MappableField(key: 'patient_id')
  final String patientId;

  @MappableField(key: 'mode')
  final int? mode;

  @MappableField(key: 'status')
  final String status;

  @MappableField(key: 'duration')
  final int? duration;

  @MappableField(key: 'name')
  final String? therapyName;


  TherapistScheduleEntity({
    required this.sessionId,
    required this.createdAt,
    required this.timestamp,
    required this.therapistId,
    required this.patientId,
    required this.status,
    this.mode,
    this.duration,
    this.therapyName,
  });


}