import 'package:equatable/equatable.dart';

class ConsultationRequestEntity with EquatableMixin {
  final String id;
  final String patientId;
  final String patientName;
  final String? patientProfileImageUrl;
  final String therapistId;
  final DateTime requestDate;
  final List<DateTime> proposedTimes;
  final String assessmentId;
  final String assessmentType;
  final String assessmentSummary;
  final String status; // 'pending', 'accepted', 'declined'
  final DateTime? scheduledTime;
  final String? notes;
  final DateTime? lastUpdated;

  const ConsultationRequestEntity({
    required this.id,
    required this.patientId,
    required this.patientName,
    this.patientProfileImageUrl,
    required this.therapistId,
    required this.requestDate,
    required this.proposedTimes,
    required this.assessmentId,
    required this.assessmentType,
    required this.assessmentSummary,
    required this.status,
    this.scheduledTime,
    this.notes,
    this.lastUpdated,
  });

  @override
  List<Object?> get props => [
        id,
        patientId,
        patientName,
        patientProfileImageUrl,
        therapistId,
        requestDate,
        proposedTimes,
        assessmentId,
        assessmentType,
        assessmentSummary,
        status,
        scheduledTime,
        notes,
        lastUpdated,
      ];

  ConsultationRequestEntity copyWith({
    String? id,
    String? patientId,
    String? patientName,
    String? patientProfileImageUrl,
    String? therapistId,
    DateTime? requestDate,
    List<DateTime>? proposedTimes,
    String? assessmentId,
    String? assessmentType,
    String? assessmentSummary,
    String? status,
    DateTime? scheduledTime,
    String? notes,
    DateTime? lastUpdated,
  }) {
    return ConsultationRequestEntity(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      patientName: patientName ?? this.patientName,
      patientProfileImageUrl: patientProfileImageUrl ?? this.patientProfileImageUrl,
      therapistId: therapistId ?? this.therapistId,
      requestDate: requestDate ?? this.requestDate,
      proposedTimes: proposedTimes ?? this.proposedTimes,
      assessmentId: assessmentId ?? this.assessmentId,
      assessmentType: assessmentType ?? this.assessmentType,
      assessmentSummary: assessmentSummary ?? this.assessmentSummary,
      status: status ?? this.status,
      scheduledTime: scheduledTime ?? this.scheduledTime,
      notes: notes ?? this.notes,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  factory ConsultationRequestEntity.fromMap(Map<String, dynamic> map) {
    return ConsultationRequestEntity(
      id: map['id'],
      patientId: map['patientId'],
      patientName: map['patientName'],
      patientProfileImageUrl: map['patientProfileImageUrl'],
      therapistId: map['therapistId'],
      requestDate: DateTime.parse(map['requestDate']),
      proposedTimes: (map['proposedTimes'] as List)
          .map((time) => DateTime.parse(time))
          .toList(),
      assessmentId: map['assessmentId'],
      assessmentType: map['assessmentType'],
      assessmentSummary: map['assessmentSummary'],
      status: map['status'],
      scheduledTime: map['scheduledTime'] != null
          ? DateTime.parse(map['scheduledTime'])
          : null,
      notes: map['notes'],
      lastUpdated: map['lastUpdated'] != null
          ? DateTime.parse(map['lastUpdated'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'patientId': patientId,
      'patientName': patientName,
      'patientProfileImageUrl': patientProfileImageUrl,
      'therapistId': therapistId,
      'requestDate': requestDate.toIso8601String(),
      'proposedTimes': proposedTimes.map((time) => time.toIso8601String()).toList(),
      'assessmentId': assessmentId,
      'assessmentType': assessmentType,
      'assessmentSummary': assessmentSummary,
      'status': status,
      'scheduledTime': scheduledTime?.toIso8601String(),
      'notes': notes,
      'lastUpdated': lastUpdated?.toIso8601String(),
    };
  }
}