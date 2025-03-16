import 'package:patient/core/repository/assessment_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAssessmentsRepository implements AssessmentsRepository {
  final SupabaseClient _supabase = Supabase.instance.client;

  @override
  Future<List<Map<String, dynamic>>> fetchAssessmentById(String id) async {
    final response = await _supabase
        .from('assessments')
        .select('*')
        .eq('id', id)
        .limit(1)
        .maybeSingle();

    return response != null ? [response] : [];
  }

  @override
  Future<void> submitAssessment(Map<String, dynamic> assessment) async {}
}
