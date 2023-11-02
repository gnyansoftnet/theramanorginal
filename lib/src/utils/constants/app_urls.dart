class AppUrls {
  AppUrls._();
  // static const String baseUrl =
  //     "http://cms.softnetcms.com/Api/MApp_ServicesApi";

  static const String baseUrl =
      "https://harmony.softnetapps.in/Api/MApp_ServicesApi";

  static const String sendOtpUrl = "/RegisterUser";
  static const String verifyOtpUrl = "/VerifyOTP";

  // Therapist
  static const String getAllotedSlotDetailsUrl = "/GetAllotedSlotDetails";
  static const String startSessionUrl = "/SessionStart?";
  static const String completeSessionUrl = "/SessionCompleted";
  static const String getUserDetailsUrl = "/GetUserProfileDetails";
  static const String applyLeaveUrl = "/ApplyLeave";
  static const String leaveStatusUrl = "/GetAppliedLeaveDetails";

  static const String sessionReportUrl = "/GetSessionSummaryReport";

  static const String sessionSummaryDetailsUrl = "/GetSessionDetailReport";

  // Executive
  static const String getCompletedSlotAllTherapistUrl =
      "/GetAllotedSlotDetailsForAllTherapist/?Session_Status=C";

  static const String getAllotedSlotAllTherapistUrl =
      "/GetAllotedSlotDetailsForAllTherapist/?Session_Status=A";

  static const String reasonsUrl = "/GetAllReasons";

  static const String sessionCancelUrl = "/SessionCancelled";

  static const String getCancelledSlotAllTherapistUrl =
      "/GetAllotedSlotDetailsForAllTherapist/?Session_Status=D";

  static const String therapistNameUrl = "/GetAllTherapist";

  static const String slotTimeUrl = "/GetAllSlotTimes";

  static const String changeTherapistUrl = "/ChangeTherapist";

  static const String sessionRescheduleUrl = "/SessionReschedule";

  static const String exeTomorrowSessionUrl = "/GetNextDayAllotedSlots/?";

  static const String therapistLeaveDetailUrl = "/GetAppliedLeaveDetails/?";

  static const String exeStartSessionUrl = "/SessionStart/?";

  static const String exeCompleteSessionUrl = "/SessionCompleted/?";

  static const String resumeCancelledSessionUrl = "/ResumeCancelledSession";

  static const String exeApplyLeavUrl = "/ApplyLeaveByExecutive";

  static const String exeLeaveStatusUrl = "/GetAppliedLeaveDetails";
}
