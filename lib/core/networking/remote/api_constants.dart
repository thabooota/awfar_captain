class ApiConstants {

  // Base URL
  static const String apiBaseURL = "https://dash.awfarcar.com/api/v1/driver/";

  //Auth end points
  static const String loginEndPoint = 'auth/login';
  static const String registerEndPoint = 'auth/register';
  static const String verifyPhoneEndPoint = 'auth/verify-phone';
  static const String addDetailsEndPoint = 'add-details';
  static const String forgotPasswordEndPoint = "auth/forgot-password";
  static const String checkCodeEndPoint = "auth/check-code";
  static const String resetPasswordEndPoint = "auth/reset-password";
  static const String uploadFilesEndPoint = "/upload-files";

  // home end points
 static const String getProfile = 'profile';
 static const String updateProfileEndPoint = 'profile';
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String cancelError = "cancelError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}