import 'package:flutter/material.dart';
import 'package:patient/core/repository/auth/auth.dart';

import '../core/result/result.dart';


enum AuthNavigationStatus {
  unknown,
  home,
  personalDetails,
  error,
}

extension AuthNavigationStatusX on AuthNavigationStatus {
  bool get isUnknown => this == AuthNavigationStatus.unknown;
  bool get isHome => this == AuthNavigationStatus.home;
  bool get isPersonalDetails => this == AuthNavigationStatus.personalDetails;
  bool get isError => this == AuthNavigationStatus.error;
}

class AuthProvider extends ChangeNotifier {

  AuthProvider({
    required AuthRepository authRepository,
  }): _authRepository = authRepository;

  final AuthRepository _authRepository;

  AuthNavigationStatus _authNavigationStatus = AuthNavigationStatus.unknown;
  String _signInErrorMessage = '';

  String get signInErrorMessage => _signInErrorMessage;

  AuthNavigationStatus get navigationStatus => _authNavigationStatus;



  Future<ActionResult> _checkIfPatientExists() async {
    final ActionResult result = await _authRepository.checkIfPatientExists();
    return result;
  }

  void _navigate(bool checkIfPatientExists, [bool error = false]) {
    if (error) {
      _authNavigationStatus = AuthNavigationStatus.error;
    } else if (checkIfPatientExists) {
      _authNavigationStatus = AuthNavigationStatus.home;
    } else {
      _authNavigationStatus = AuthNavigationStatus.personalDetails;
    }
    notifyListeners();
  }

  Future<void> signInWithGoogle() async {
    //await _authRepository.signInWithGoogle();
    final ActionResult result = await _checkIfPatientExists();
    if(result is ActionResultSuccess) {
      _navigate(result.data as bool);
      notifyListeners();
    } else {
      _signInErrorMessage = result.errorMessage ?? 'An error occurred. Please try again.';
      _navigate(false, true);
      notifyListeners();
    }
  }

  void resetStateInFailure() {
    _authNavigationStatus = AuthNavigationStatus.unknown;
    _signInErrorMessage = '';
    notifyListeners();
  }
}
