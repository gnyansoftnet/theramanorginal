class CompletedSessionModel {
  List<AllotSlots>? allotSlots;

  CompletedSessionModel({this.allotSlots});

  CompletedSessionModel.fromJson(Map<String, dynamic> json) {
    if (json['AllotSlots'] != null) {
      allotSlots = <AllotSlots>[];
      json['AllotSlots'].forEach((v) {
        allotSlots!.add(AllotSlots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (allotSlots != null) {
      data['AllotSlots'] = allotSlots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllotSlots {
  int? rSSlotId;
  String? rSPCode;
  String? rSPName;
  String? rSDoctorCode;
  String? rSDoctorName;
  String? rSSlotDate;
  String? rSStartTime;
  String? rSEndTime;
  String? rSSlotType;
  String? rSSlotStatus;
  String? rSReason;
  String? rSTherapistStartTime;
  String? rSTherapistEndTime;
  String? rSDuration;

  AllotSlots(
      {this.rSSlotId,
      this.rSPCode,
      this.rSPName,
      this.rSDoctorCode,
      this.rSDoctorName,
      this.rSSlotDate,
      this.rSStartTime,
      this.rSEndTime,
      this.rSSlotType,
      this.rSSlotStatus,
      this.rSReason,
      this.rSTherapistStartTime,
      this.rSTherapistEndTime,
      this.rSDuration});

  AllotSlots.fromJson(Map<String, dynamic> json) {
    rSSlotId = json['RS_Slot_Id'];
    rSPCode = json['RS_P_Code'];
    rSPName = json['RS_P_Name'];
    rSDoctorCode = json['RS_Doctor_Code'];
    rSDoctorName = json['RS_Doctor_Name'];
    rSSlotDate = json['RS_Slot_Date'];
    rSStartTime = json['RS_Start_Time'];
    rSEndTime = json['RS_End_Time'];
    rSSlotType = json['RS_Slot_Type'];
    rSSlotStatus = json['RS_Slot_Status'];
    rSReason = json['RS_Reason'];
    rSTherapistStartTime = json['RS_Therapist_Start_Time'];
    rSTherapistEndTime = json['RS_Therapist_End_Time'];
    rSDuration = json['RS_Duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['RS_Slot_Id'] = rSSlotId;
    data['RS_P_Code'] = rSPCode;
    data['RS_P_Name'] = rSPName;
    data['RS_Doctor_Code'] = rSDoctorCode;
    data['RS_Doctor_Name'] = rSDoctorName;
    data['RS_Slot_Date'] = rSSlotDate;
    data['RS_Start_Time'] = rSStartTime;
    data['RS_End_Time'] = rSEndTime;
    data['RS_Slot_Type'] = rSSlotType;
    data['RS_Slot_Status'] = rSSlotStatus;
    data['RS_Reason'] = rSReason;
    data['RS_Therapist_Start_Time'] = rSTherapistStartTime;
    data['RS_Therapist_End_Time'] = rSTherapistEndTime;
    data['RS_Duration'] = rSDuration;
    return data;
  }
}
