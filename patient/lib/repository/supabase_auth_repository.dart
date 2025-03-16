import 'package:patient/core/entities/auth_entities/auth_entities.dart';
import 'package:patient/core/repository/auth/auth_repository.dart';
import 'package:patient/core/result/result.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
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
  Future<ActionResult> storePersonalInfo(PersonalInfoEntity personalInfoEntity) async {
    try {
      await _supabaseClient.from('patient')
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