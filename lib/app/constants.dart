abstract class Constants {
  static const SPK_ONBOARDING_DONE = 'OnboardingIsDone';
  static const SPK_REGISTER_DONE = 'RegisterDone';
  static final Routes = _Routes();

  //codigos de erros do firebase
  static const INVALID_EMAIL = "invalid-email";
  static const TOO_MANY_REQUESTS = 'too-many-requests';
  static const WRONG_PASSWORD = 'wrong-password';
  static const USER_NOT_FOUND = 'user-not-found';
  static const ERROR_USER_DISABLED = 'error_user_disabled';
  static const ERROR_OPERATION_NOT_ALLOWED = 'error_operation_not_allowed';
  static const ERROR_EMAIL_ALREADY_IN_USE = 'error_email_already_in_use';
}

class _Routes {
  final HOME = '/home';
  final ONBOARDING = '/onboarding';
  final REGISTER = '/register';
  final LOGIN = '/login';
  final FORGOT_PASSWORD = '/login/forgot-password';
  final FEED = '/feed';
  final SEARCH = '/search';
  final PROFILE = '/profile';
  final EDIT_PROFILE = '/edit';
}
