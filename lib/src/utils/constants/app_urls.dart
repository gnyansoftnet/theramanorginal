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
  static const String getUserDetailsUrl = "/GetUserProfileDetails";
  static const String applyLeaveUrl = "/ApplyLeave";
  static const String leaveStatusUrl = "/GetAppliedLeaveDetails";

  // Executive
  static const String getCompletedSlotAllTherapistUrl =
      "/GetAllotedSlotDetailsForAllTherapist/?Session_Status=C";
  static const String getAllotedSlotAllTherapistUrl =
      "/GetAllotedSlotDetailsForAllTherapist/?Session_Status=A";
}
