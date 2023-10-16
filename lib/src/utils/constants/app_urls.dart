class AppUrls {
  AppUrls._();
  static const String baseUrl =
      "http://cms.softnetcms.com/Api/MApp_ServicesApi";

  static const String sendOtpUrl = "/RegisterUser";
  static const String verifyOtpUrl = "/VerifyOTP";

  // Therapist
  static const String getAllotedSlotDetailsUrl = "/GetAllotedSlotDetails";
  static const String startSessionUrl = "/SessionStart";
  static const String completeSessionUrl = "/SessionCompleted";
  static const String getUserDetails = "/GetUserProfileDetails";
  static const String applyLeave = "/ApplyLeave";
  static const String leaveStatus = "/GetAppliedLeaveDetails";

  // Executive
  static const String getCompletedSlotDetailsForAllTherapist =
      "/GetAllotedSlotDetailsForAllTherapist/?Session_Status=C";
}
