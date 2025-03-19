import 'package:therapist/core/entities/consultation/consultation_request_entity.dart';

class ConsultationService {
  // Mock data for demonstration purposes
  // In a real app, we would fetch this from Supabase
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
    ConsultationRequestEntity(
      id: '2',
      patientId: 'p2',
      patientName: 'Jane Smith',
      therapistId: 't1',
      requestDate: DateTime.now().subtract(const Duration(days: 5)),
      proposedTimes: [
        DateTime.now().add(const Duration(days: 2, hours: 3)),
        DateTime.now().add(const Duration(days: 4, hours: 1)),
      ],
      assessmentId: 'a2',
      assessmentType: 'Anxiety Assessment',
      assessmentSummary: 'Patient exhibits moderate anxiety symptoms with GAD-7 score of 12.',
      status: 'accepted',
      scheduledTime: DateTime.now().add(const Duration(days: 2, hours: 3)),
      notes: 'Looking forward to discussing strategies for managing my anxiety.',
    ),
    ConsultationRequestEntity(
      id: '3',
      patientId: 'p3',
      patientName: 'Robert Johnson',
      therapistId: 't1',
      requestDate: DateTime.now().subtract(const Duration(days: 7)),
      proposedTimes: [
        DateTime.now().subtract(const Duration(days: 1)),
        DateTime.now().add(const Duration(days: 1, hours: 2)),
      ],
      assessmentId: 'a3',
      assessmentType: 'Stress Assessment',
      assessmentSummary: 'Patient is experiencing high levels of stress due to work-related factors.',
      status: 'declined',
      notes: 'I need help managing my work-related stress that has been affecting my sleep.',
    ),
  ];

  Future<List<ConsultationRequestEntity>> fetchConsultationRequests() async {
    // In a real app, we would fetch from Supabase:
    // final response = await supabase
    //     .from('consultation_requests')
    //     .select()
    //     .eq('therapist_id', currentTherapistId)
    //     .execute();
    
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    
    return _mockRequests;
  }

  Future<ConsultationRequestEntity> getConsultationRequestById(String id) async {
    // In a real app, we would fetch from Supabase:
    // final response = await supabase
    //     .from('consultation_requests')
    //     .select()
    //     .eq('id', id)
    //     .single()
    //     .execute();
    
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    final request = _mockRequests.firstWhere(
      (request) => request.id == id,
      orElse: () => throw Exception('Consultation request not found'),
    );
    
    return request;
  }

  Future<void> updateRequestStatus({
    required String requestId,
    required String status,
    DateTime? scheduledTime,
    String? notes,
  }) async {
    // In a real app, we would update Supabase:
    // await supabase
    //     .from('consultation_requests')
    //     .update({
    //       'status': status,
    //       'scheduled_time': scheduledTime?.toIso8601String(),
    //       'notes': notes,
    //       'last_updated': DateTime.now().toIso8601String(),
    //     })
    //     .eq('id', requestId)
    //     .execute();
    
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));
    
    // For mock data, update the in-memory list
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
  
  // Additional method to handle sending notifications
  Future<void> sendNotificationToPatient({
    required String patientId,
    required String title,
    required String body,
  }) async {
    // In a real app, this would trigger a notification to the patient
    // This could be implemented using Firebase Cloud Messaging or another notification service
    
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Log for development purposes
    print('Notification sent to patient $patientId: $title - $body');
  }
}