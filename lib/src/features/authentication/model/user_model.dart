// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class UserModel {
  final bool isLogin;
  final String userType;
  final int Id;
  final String Staff_Code;
  final String Org_Code;
  final String Staff_Name;
  final String Staff_Short_Name;
  final String Emp_Code;
  final String Designation;
  final String Email_Id;
  final String Mob_No;
  final String Alt_Mob_No;
  final String Staff_Type;
  final String Employment_Type;
  final String Status;
  final String Staff_Type_Name;
  final String Employment_Type_Name;
  final String Created_By;
  final String Created_Date;
  final String Modified_By;
  final String Modified_Date;
  final String Dflag;
  final String Mapp_Status_msg;
  UserModel({
    this.isLogin = false,
    required this.userType,
    required this.Id,
    required this.Staff_Code,
    required this.Org_Code,
    required this.Staff_Name,
    required this.Staff_Short_Name,
    required this.Emp_Code,
    required this.Designation,
    required this.Email_Id,
    required this.Mob_No,
    required this.Alt_Mob_No,
    required this.Staff_Type,
    required this.Employment_Type,
    required this.Status,
    required this.Staff_Type_Name,
    required this.Employment_Type_Name,
    required this.Created_By,
    required this.Created_Date,
    required this.Modified_By,
    required this.Modified_Date,
    required this.Dflag,
    required this.Mapp_Status_msg,
  });

  UserModel copyWith({
    bool? isLogin,
    String? userType,
    int? Id,
    String? Staff_Code,
    String? Org_Code,
    String? Staff_Name,
    String? Staff_Short_Name,
    String? Emp_Code,
    String? Designation,
    String? Email_Id,
    String? Mob_No,
    String? Alt_Mob_No,
    String? Staff_Type,
    String? Employment_Type,
    String? Status,
    String? Staff_Type_Name,
    String? Employment_Type_Name,
    String? Created_By,
    String? Created_Date,
    String? Modified_By,
    String? Modified_Date,
    String? Dflag,
    String? Mapp_Status_msg,
  }) {
    return UserModel(
      isLogin: isLogin ?? this.isLogin,
      userType: userType ?? this.userType,
      Id: Id ?? this.Id,
      Staff_Code: Staff_Code ?? this.Staff_Code,
      Org_Code: Org_Code ?? this.Org_Code,
      Staff_Name: Staff_Name ?? this.Staff_Name,
      Staff_Short_Name: Staff_Short_Name ?? this.Staff_Short_Name,
      Emp_Code: Emp_Code ?? this.Emp_Code,
      Designation: Designation ?? this.Designation,
      Email_Id: Email_Id ?? this.Email_Id,
      Mob_No: Mob_No ?? this.Mob_No,
      Alt_Mob_No: Alt_Mob_No ?? this.Alt_Mob_No,
      Staff_Type: Staff_Type ?? this.Staff_Type,
      Employment_Type: Employment_Type ?? this.Employment_Type,
      Status: Status ?? this.Status,
      Staff_Type_Name: Staff_Type_Name ?? this.Staff_Type_Name,
      Employment_Type_Name: Employment_Type_Name ?? this.Employment_Type_Name,
      Created_By: Created_By ?? this.Created_By,
      Created_Date: Created_Date ?? this.Created_Date,
      Modified_By: Modified_By ?? this.Modified_By,
      Modified_Date: Modified_Date ?? this.Modified_Date,
      Dflag: Dflag ?? this.Dflag,
      Mapp_Status_msg: Mapp_Status_msg ?? this.Mapp_Status_msg,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isLogin': isLogin,
      'userType': userType,
      'Id': Id,
      'Staff_Code': Staff_Code,
      'Org_Code': Org_Code,
      'Staff_Name': Staff_Name,
      'Staff_Short_Name': Staff_Short_Name,
      'Emp_Code': Emp_Code,
      'Designation': Designation,
      'Email_Id': Email_Id,
      'Mob_No': Mob_No,
      'Alt_Mob_No': Alt_Mob_No,
      'Staff_Type': Staff_Type,
      'Employment_Type': Employment_Type,
      'Status': Status,
      'Staff_Type_Name': Staff_Type_Name,
      'Employment_Type_Name': Employment_Type_Name,
      'Created_By': Created_By,
      'Created_Date': Created_Date,
      'Modified_By': Modified_By,
      'Modified_Date': Modified_Date,
      'Dflag': Dflag,
      'Mapp_Status_msg': Mapp_Status_msg,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      isLogin: map['isLogin'] ?? false,
      userType: map['userType'] ?? '',
      Id: map['Id']?.toInt() ?? 0,
      Staff_Code: map['Staff_Code'] ?? '',
      Org_Code: map['Org_Code'] ?? '',
      Staff_Name: map['Staff_Name'] ?? '',
      Staff_Short_Name: map['Staff_Short_Name'] ?? '',
      Emp_Code: map['Emp_Code'] ?? '',
      Designation: map['Designation'] ?? '',
      Email_Id: map['Email_Id'] ?? '',
      Mob_No: map['Mob_No'] ?? '',
      Alt_Mob_No: map['Alt_Mob_No'] ?? '',
      Staff_Type: map['Staff_Type'] ?? '',
      Employment_Type: map['Employment_Type'] ?? '',
      Status: map['Status'] ?? '',
      Staff_Type_Name: map['Staff_Type_Name'] ?? '',
      Employment_Type_Name: map['Employment_Type_Name'] ?? '',
      Created_By: map['Created_By'] ?? '',
      Created_Date: map['Created_Date'] ?? '',
      Modified_By: map['Modified_By'] ?? '',
      Modified_Date: map['Modified_Date'] ?? '',
      Dflag: map['Dflag'] ?? '',
      Mapp_Status_msg: map['Mapp_Status_msg'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(isLogin: $isLogin, userType: $userType, Id: $Id, Staff_Code: $Staff_Code, Org_Code: $Org_Code, Staff_Name: $Staff_Name, Staff_Short_Name: $Staff_Short_Name, Emp_Code: $Emp_Code, Designation: $Designation, Email_Id: $Email_Id, Mob_No: $Mob_No, Alt_Mob_No: $Alt_Mob_No, Staff_Type: $Staff_Type, Employment_Type: $Employment_Type, Status: $Status, Staff_Type_Name: $Staff_Type_Name, Employment_Type_Name: $Employment_Type_Name, Created_By: $Created_By, Created_Date: $Created_Date, Modified_By: $Modified_By, Modified_Date: $Modified_Date, Dflag: $Dflag, Mapp_Status_msg: $Mapp_Status_msg)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.isLogin == isLogin &&
        other.userType == userType &&
        other.Id == Id &&
        other.Staff_Code == Staff_Code &&
        other.Org_Code == Org_Code &&
        other.Staff_Name == Staff_Name &&
        other.Staff_Short_Name == Staff_Short_Name &&
        other.Emp_Code == Emp_Code &&
        other.Designation == Designation &&
        other.Email_Id == Email_Id &&
        other.Mob_No == Mob_No &&
        other.Alt_Mob_No == Alt_Mob_No &&
        other.Staff_Type == Staff_Type &&
        other.Employment_Type == Employment_Type &&
        other.Status == Status &&
        other.Staff_Type_Name == Staff_Type_Name &&
        other.Employment_Type_Name == Employment_Type_Name &&
        other.Created_By == Created_By &&
        other.Created_Date == Created_Date &&
        other.Modified_By == Modified_By &&
        other.Modified_Date == Modified_Date &&
        other.Dflag == Dflag &&
        other.Mapp_Status_msg == Mapp_Status_msg;
  }

  @override
  int get hashCode {
    return isLogin.hashCode ^
        userType.hashCode ^
        Id.hashCode ^
        Staff_Code.hashCode ^
        Org_Code.hashCode ^
        Staff_Name.hashCode ^
        Staff_Short_Name.hashCode ^
        Emp_Code.hashCode ^
        Designation.hashCode ^
        Email_Id.hashCode ^
        Mob_No.hashCode ^
        Alt_Mob_No.hashCode ^
        Staff_Type.hashCode ^
        Employment_Type.hashCode ^
        Status.hashCode ^
        Staff_Type_Name.hashCode ^
        Employment_Type_Name.hashCode ^
        Created_By.hashCode ^
        Created_Date.hashCode ^
        Modified_By.hashCode ^
        Modified_Date.hashCode ^
        Dflag.hashCode ^
        Mapp_Status_msg.hashCode;
  }
}
