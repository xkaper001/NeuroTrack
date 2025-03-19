import 'package:flutter/foundation.dart';
import 'package:therapist/core/entities/consultation/consultation_request_entity.dart';
import 'package:therapist/core/services/consultation_service.dart';

class ConsultationProvider extends ChangeNotifier {
  final ConsultationService _consultationService;
  List<ConsultationRequestEntity> _consultationRequests = [];
  bool _isLoading = false;
  String? _error;

  ConsultationProvider(this._consultationService);

  List<ConsultationRequestEntity> get consultationRequests => _consultationRequests;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchConsultationRequests() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _consultationRequests = await _consultationService.fetchConsultationRequests();
    } catch (e) {
      _error = 'Failed to load consultation requests: ${e.toString()}';
      debugPrint(_error);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateRequestStatus(
    String requestId, 
    String status, 
    DateTime? scheduledTime, 
    {String? notes}
  ) async {
    _isLoading = true;
    notifyListeners();

    try {
      // In a real implementation, this would call the service to update the status
      // For now I have just updated the local state
      final index = _consultationRequests.indexWhere((req) => req.id == requestId);
      if (index != -1) {
        final request = _consultationRequests[index];
        final updatedRequest = ConsultationRequestEntity(
          id: request.id,
          patientId: request.patientId,
          patientName: request.patientName,
          therapistId: request.therapistId,
          requestDate: request.requestDate,
          proposedTimes: request.proposedTimes,
          assessmentType: request.assessmentType,
          assessmentSummary: request.assessmentSummary,
          status: status,
          scheduledTime: scheduledTime,
          notes: notes ?? request.notes, assessmentId: '',
        );
        
        _consultationRequests[index] = updatedRequest;
        
        // In production, this would be:
        // await _consultationService.updateRequestStatus(
        //   requestId, status, scheduledTime, notes: notes
        // );
      }
    } catch (e) {
      _error = 'Failed to update request status: ${e.toString()}';
      debugPrint(_error);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Filter methods for UI convenience
  List<ConsultationRequestEntity> get pendingRequests => 
      _consultationRequests.where((req) => req.status == 'pending').toList();
      
  List<ConsultationRequestEntity> get acceptedRequests => 
      _consultationRequests.where((req) => req.status == 'accepted').toList();
      
  List<ConsultationRequestEntity> get declinedRequests => 
      _consultationRequests.where((req) => req.status == 'declined').toList();
}