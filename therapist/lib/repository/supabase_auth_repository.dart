import 'package:therapist/core/repository/auth/auth_repository.dart';
import 'package:therapist/core/result/action_result.dart';

class SupabaseAuthRepository implements AuthRepository {
  @override
  Future<ActionResult> signInWithGoogle() {
    throw UnimplementedError();
  }

  @override
  Future<ActionResult> storePersonalInfo() {
    throw UnimplementedError();
  }

}
