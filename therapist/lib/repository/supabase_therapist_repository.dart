

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:therapist/core/entities/therapist_entities/therapist_patient_details_entity.dart';
import 'package:therapist/core/entities/therapist_entities/therapist_schedule_entity.dart';
import 'package:therapist/core/entities/therapist_entities/therapist_upcoming_appointment_entity.dart';

import '../core/repository/repository.dart';
import '../core/result/result.dart';

class SupabaseTherapistRepository implements TherapistRepository {

  SupabaseTherapistRepository({
    required SupabaseClient supabaseClient,
  }) : _supabaseClient = supabaseClient;

  final SupabaseClient _supabaseClient;

  @override
  Future<ActionResult> changeAppointmentStatus(String appointmentId, String status) async {
    try {
      await _supabaseClient.from('session')
      .update({'status': status})
      .eq('id', appointmentId);
  
     return ActionResultSuccess(data: 'Appointment Update Successfully', statusCode: 200);
    } catch(e) {
      return ActionResultFailure(errorMessage: e.toString(), statusCode: 400);
    }
  }

  @override
  Future<ActionResult> getTherapistPatients() async {
   try {
      final response = await _supabaseClient.from('patients')
      .select('*')
      .eq('therapist_id', _supabaseClient.auth.currentUser!.id);
    
      final data = response.map((data) => TherapistPatientDetailsEntityMapper.fromMap(data)).toList();

      return ActionResultSuccess(data: data, statusCode: 200); 
    } catch(e) {
      return ActionResultFailure(errorMessage: e.toString(), statusCode: 400);
   } 
  }

  @override
  Future<ActionResult> getTherapistSchedule() async {
   try {
      final response = await _supabaseClient.from('session')
      .select('*')
      .eq('therapist_id', _supabaseClient.auth.currentUser!.id);
    
      final data = response.map((data) => TherapistScheduleEntityMapper.fromMap(data)).toList();

      return ActionResultSuccess(data: data, statusCode: 200); 
    } catch(e) {
      return ActionResultFailure(errorMessage: e.toString(), statusCode: 400);
   }
  }

  @override
  Future<ActionResult> getTherapistUpcomingAppointments() async {
    try {
       final response = await _supabaseClient.from('session')
      .select('*')
      .eq('therapist_id', _supabaseClient.auth.currentUser!.id)
      .eq('status', 'Pending');
    
      final data = response.map((data) => TherapistUpcomingAppointmentEntityMapper.fromMap(data)).toList();

      return ActionResultSuccess(data: data, statusCode: 200); 
    } catch(e) {
      return ActionResultFailure(errorMessage: e.toString(), statusCode: 400);
    }
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