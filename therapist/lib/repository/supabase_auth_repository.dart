import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:therapist/core/entities/auth_entities/therapist_personal_info_entity.dart';
import 'package:therapist/core/repository/auth/auth_repository.dart';
import 'package:therapist/core/result/action_result.dart';

import '../core/result/result.dart';

class SupabaseAuthRepository implements AuthRepository {

  SupabaseAuthRepository({
    required SupabaseClient supabaseClient,
  }) : _supabaseClient = supabaseClient;

  final SupabaseClient _supabaseClient;

  @override
  Future<ActionResult> signInWithGoogle() {
    throw UnimplementedError();
  }

  @override
  Future<ActionResult> storePersonalInfo(TherapistPersonalInfoEntity personalInfoEntity) async {
    try {
      await _supabaseClient.from('therapist')
        .insert(personalInfoEntity.toMap());

      return ActionResultSuccess(
        data: 'Personal information stored successfully',
        statusCode: 200
      );
    } catch(e) {
      return ActionResultFailure(
        errorMessage: e.toString(),
        statusCode: 400,
      );
    }
  }

}
