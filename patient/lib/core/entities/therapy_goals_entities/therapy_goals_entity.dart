
import 'package:dart_mappable/dart_mappable.dart';

part 'therapy_goals_entity.mapper.dart';

@MappableClass()
class TherapyGoalsEntity with TherapyGoalsEntityMappable{

  @MappableField(key: 'id')
  final String id;

  @MappableField(key: 'created_at')
  final DateTime createdAt;

  @MappableField(key: 'performed_on')
  final DateTime? performedOn;

  @MappableField(key: 'therapist_id')
  final String therapistId;

  @MappableField(key: 'therapy_mode')
  final int? therapyMode;

  @MappableField(key: 'duration')
  final int? duration;

  @MappableField(key: 'therapy_type')
  final int? therapyType;

  @MappableField(key: 'goals')
  final Map<String,dynamic>? goals;

  @MappableField(key: 'observations')
  final Map<String,dynamic>? observations;

  @MappableField(key: 'regressions')
  final Map<String,dynamic>? regressions;

  @MappableField(key: 'activities')
  final Map<String,dynamic>? activities;

  @MappableField(key: 'patient_id')
  final String patientId;

  @MappableField(key: 'therapy_date')
  final int? therapyDate;

  TherapyGoalsEntity({
    required this.id,
    required this.createdAt,
    required this.therapistId,
    required this.patientId,
    this.performedOn,
    this.therapyMode,
    this.duration,
    this.therapyType,
    this.goals,
    this.observations,
    this.regressions,
    this.activities,
    this.therapyDate
  });  

}