class LeaveDetailsModel {
  List<LeaveDtls>? leaveDtls;

  LeaveDetailsModel({this.leaveDtls});

  LeaveDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json['LeaveDtls'] != null) {
      leaveDtls = <LeaveDtls>[];
      json['LeaveDtls'].forEach((v) {
        leaveDtls!.add(LeaveDtls.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (leaveDtls != null) {
      data['LeaveDtls'] = leaveDtls!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LeaveDtls {
  int? lId;
  String? staffCode;
  String? staffName;
  String? leaveType;
  String? leaveAppliedOn;
  String? leaveFrom;
  String? leaveTo;
  double? noOfDays;
  String? reason;
  String? leaveStatus;
  String? remarks;

  LeaveDtls(
      {this.lId,
      this.staffCode,
      this.staffName,
      this.leaveType,
      this.leaveAppliedOn,
      this.leaveFrom,
      this.leaveTo,
      this.noOfDays,
      this.reason,
      this.leaveStatus,
      this.remarks});

  LeaveDtls.fromJson(Map<String, dynamic> json) {
    lId = json['L_Id'];
    staffCode = json['Staff_Code'];
    staffName = json['Staff_Name'];
    leaveType = json['Leave_Type'];
    leaveAppliedOn = json['Leave_Applied_On'];
    leaveFrom = json['Leave_From'];
    leaveTo = json['Leave_To'];
    noOfDays = json['No_Of_Days'];
    reason = json['Reason'];
    leaveStatus = json['Leave_Status'];
    remarks = json['Remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['L_Id'] = lId;
    data['Staff_Code'] = staffCode;
    data['Staff_Name'] = staffName;
    data['Leave_Type'] = leaveType;
    data['Leave_Applied_On'] = leaveAppliedOn;
    data['Leave_From'] = leaveFrom;
    data['Leave_To'] = leaveTo;
    data['No_Of_Days'] = noOfDays;
    data['Reason'] = reason;
    data['Leave_Status'] = leaveStatus;
    data['Remarks'] = remarks;
    return data;
  }
}
