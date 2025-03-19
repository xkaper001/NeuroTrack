import 'package:therapist/core/entities/consultation/consultation_request_entity.dart';

class ConsultationService {
  final List<ConsultationRequestEntity> _mockRequests = [
    ConsultationRequestEntity(
      id: '1',
      patientId: 'p1',
      patientName: 'John Doe',
      therapistId: 't1',
      requestDate: DateTime.now().subtract(const Duration(days: 2)),
      proposedTimes: [
        DateTime.now().add(const Duration(days: 1)),
        DateTime.now().add(const Duration(days: 2)),
        DateTime.now().add(const Duration(days: 3)),
      ],
      assessmentId: 'a1',
      assessmentType: 'Depression Assessment',
      assessmentSummary: 'Patient shows mild signs of depression with PHQ-9 score of 8.',
      status: 'pending',
      notes: 'I would like to discuss my recent assessment results and get your professional opinion.',
    ),
  ];

  Future<List<ConsultationRequestEntity>> fetchConsultationRequests() async {
    await Future.delayed(const Duration(seconds: 1));
    return _mockRequests;
  }

  Future<ConsultationRequestEntity> getConsultationRequestById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockRequests.firstWhere(
      (request) => request.id == id,
      orElse: () => throw Exception('Consultation request not found'),
    );
  }

  Future<void> updateRequestStatus({
    required String requestId,
    required String status,
    DateTime? scheduledTime,
    String? notes,
  }) async {
    await Future.delayed(const Duration(milliseconds: 800));
    final index = _mockRequests.indexWhere((request) => request.id == requestId);
    if (index != -1) {
      final request = _mockRequests[index];
      _mockRequests[index] = request.copyWith(
        status: status,
        scheduledTime: scheduledTime,
        notes: notes ?? request.notes,
        lastUpdated: DateTime.now(),
      );
    }
  }
}