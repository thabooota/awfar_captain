class ApiConstants {

  // Base URL
  static const String apiBaseURL = "https://dash.awfarcar.com/api/v1/driver/";
  static const String routesBaseUrl =
      "https://routes.googleapis.com/directions/v2:computeRoutes/";
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

 static const String updateProfileEndPoint = 'profile';
 static const String getMyTrip = 'my-trips';
 static const String rateClient = 'rate-trip/{tripId}/{clientId}';
 static const String acceptTrip = 'TripAccept';
 static const String rejectedTrip = 'TripRejected';
 static const String storeDriverTrip = 'Store-Driver-Trip';
 static const String changeDriverStatus = 'ChangeStatusDriver';
 static const String tripCost = 'add-charge/{tripId}';

 //chat end points
 static const String getMessage = 'Get-Messages';
 static const String sendMessage = 'sent-message';

 // captain gate end points
  static const String getMyBalance = 'my-balance';
  static const String getProfile = 'profile';

 // map api
  static const String locationBaseUrl = "https://maps.googleapis.com/maps/api/";
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