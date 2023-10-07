class AppUrls {
  AppUrls._();
  static const String baseUrl =
      "http://cms.softnetcms.com/Api/MApp_ServicesApi";

  static const String sendOtpUrl = "/RegisterUser";
  static const String verifyOtpUrl = "/VerifyOTP";
  static const String getAllotedSlotDetailsUrl = "/GetAllotedSlotDetails";
  static const String startSessionUrl = "/SessionStart";
  static const String completeSessionUrl = "/SessionCompleted";
  static const String getUserDetails = "/GetUserProfileDetails";
}


// http://cms.softnetcms.com/Api/MApp_ServicesApi/SessionCompleted/?Id=1234&Type=T