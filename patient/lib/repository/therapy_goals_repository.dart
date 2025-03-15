import 'package:patient/core/entities/entities.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../core/repository/therapy/therapy_repository.dart';
import '../core/result/result.dart';

class TherapyGoalsRepositoryImpl implements TherapyGoalsRepository{

  TherapyGoalsRepositoryImpl({
    required SupabaseClient supabaseClient,
  }) : _supabaseClient = supabaseClient;


  final SupabaseClient _supabaseClient;

  // Method is used to get therapy goals of a patient from Supabase [THERAPY_GOALS] table

  @override
  Future<ActionResult> getTherapyGoals(String patientId) async {

    final response = await _supabaseClient.from('therapy_goals')
      .select().eq('patient_id', patientId);

    final List<TherapyGoalsEntity> data = response.map((e) => TherapyGoalsEntityMapper.fromMap(e)).toList();

    return ActionResultSuccess(
      data: data,
      statusCode: 200
    );

  }

}