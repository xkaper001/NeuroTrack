

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:therapist/core/entities/therapist_entities/therapist_patient_details_entity.dart';
import 'package:therapist/core/entities/therapist_entities/therapist_schedule_entity.dart';
import 'package:therapist/core/entities/therapist_entities/therapist_upcoming_appointment_entity.dart';

import '../core/repository/repository.dart';
import '../core/result/result.dart';

class TherapistRepositoryImpl implements TherapistRepository {

  TherapistRepositoryImpl({
    required SupabaseClient supabaseClient,
  }) : _supabaseClient = supabaseClient;

  final SupabaseClient _supabaseClient;

  @override
  Future<ActionResult> changeAppointmentStatus(String appointmentId, String status) async {
    final response = await _supabaseClient.from('session')
      .update({'status': status})
      .eq('id', appointmentId);
    
    if (response.error != null) {
      return ActionResultFailure(errorMessage: response.error!.message, statusCode: response.error!.code);
    }

    return ActionResultSuccess(data: 'Appointment Update Successfully', statusCode: 200);
  }

  @override
  Future<ActionResult> getTherapistPatients() async {
    final response = await _supabaseClient.from('patients')
      .select('*')
      .eq('therapist_id', _supabaseClient.auth.currentUser!.id);
    
    final data = response.map((data) => TherapistPatientDetailsEntityMapper.fromMap(data)).toList();

    return ActionResultSuccess(data: data, statusCode: 200);   
  }

  @override
  Future<ActionResult> getTherapistSchedule() async {
    final response = await _supabaseClient.from('session')
      .select('*')
      .eq('therapist_id', _supabaseClient.auth.currentUser!.id);
    
    final data = response.map((data) => TherapistScheduleEntityMapper.fromMap(data)).toList();

    return ActionResultSuccess(data: data, statusCode: 200); 
  }

  @override
  Future<ActionResult> getTherapistUpcomingAppointments() async {
    final response = await _supabaseClient.from('session')
      .select('*')
      .eq('therapist_id', _supabaseClient.auth.currentUser!.id)
      .eq('status', 'Pending');
    
    final data = response.map((data) => TherapistUpcomingAppointmentEntityMapper.fromMap(data)).toList();

    return ActionResultSuccess(data: data, statusCode: 200); 
  }
  
  @override
  Future<ActionResult> getTotalPatients() {
    // TODO: implement getTotalPatients
    throw UnimplementedError();
  }
  
  @override
  Future<ActionResult> getTotalSessions() {
    // TODO: implement getTotalSessions
    throw UnimplementedError();
  }
  
  @override
  Future<ActionResult> getTotalTherapies() {
    // TODO: implement getTotalTherapies
    throw UnimplementedError();
  }



}