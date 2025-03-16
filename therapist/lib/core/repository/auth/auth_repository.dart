import 'package:therapist/core/result/action_result.dart';

abstract interface class AuthRepository {

  Future<ActionResult> signInWithGoogle();

  Future<ActionResult> storePersonalInfo();
  
}
