class UserModel {
  int? id;
  bool? isLogin;
  String? staffCode;
  String? orgCode;
  String? staffName;
  String? empCode;
  String? designation;
  String? emailId;
  String? mobNo;
  String? altMobNo;
  String? staffType;
  String? employmentType;
  String? status;
  String? staffTypeName;
  String? employmentTypeName;
  String? createdBy;
  String? createdDate;
  String? modifiedBy;
  String? modifiedDate;
  String? dflag;
  String? mappStatusMsg;

  UserModel(
      {this.id,
      this.isLogin,
      this.staffCode,
      this.orgCode,
      this.staffName,
      this.empCode,
      this.designation,
      this.emailId,
      this.mobNo,
      this.altMobNo,
      this.staffType,
      this.employmentType,
      this.status,
      this.staffTypeName,
      this.employmentTypeName,
      this.createdBy,
      this.createdDate,
      this.modifiedBy,
      this.modifiedDate,
      this.dflag,
      this.mappStatusMsg});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    isLogin = json['isLogin'];
    staffCode = json['Staff_Code'];
    orgCode = json['Org_Code'];
    staffName = json['Staff_Name'];
    empCode = json['Emp_Code'];
    designation = json['Designation'];
    emailId = json['Email_Id'];
    mobNo = json['Mob_No'];
    altMobNo = json['Alt_Mob_No'];
    staffType = json['Staff_Type'];
    employmentType = json['Employment_Type'];
    status = json['Status'];
    staffTypeName = json['Staff_Type_Name'];
    employmentTypeName = json['Employment_Type_Name'];
    createdBy = json['Created_By'];
    createdDate = json['Created_Date'];
    modifiedBy = json['Modified_By'];
    modifiedDate = json['Modified_Date'];
    dflag = json['Dflag'];
    mappStatusMsg = json['Mapp_Status_msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['isLogin'] = isLogin;
    data['Staff_Code'] = staffCode;
    data['Org_Code'] = orgCode;
    data['Staff_Name'] = staffName;
    data['Emp_Code'] = empCode;
    data['Designation'] = designation;
    data['Email_Id'] = emailId;
    data['Mob_No'] = mobNo;
    data['Alt_Mob_No'] = altMobNo;
    data['Staff_Type'] = staffType;
    data['Employment_Type'] = employmentType;
    data['Status'] = status;
    data['Staff_Type_Name'] = staffTypeName;
    data['Employment_Type_Name'] = employmentTypeName;
    data['Created_By'] = createdBy;
    data['Created_Date'] = createdDate;
    data['Modified_By'] = modifiedBy;
    data['Modified_Date'] = modifiedDate;
    data['Dflag'] = dflag;
    data['Mapp_Status_msg'] = mappStatusMsg;
    return data;
  }
}
