class TherapistNameModel {
  List<AllStaffs>? allStaffs;

  TherapistNameModel({this.allStaffs});

  TherapistNameModel.fromJson(Map<String, dynamic> json) {
    if (json['AllStaffs'] != null) {
      allStaffs = <AllStaffs>[];
      json['AllStaffs'].forEach((v) {
        allStaffs!.add(AllStaffs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (allStaffs != null) {
      data['AllStaffs'] = allStaffs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllStaffs {
  String? staffCode;
  String? staffName;

  AllStaffs({this.staffCode, this.staffName});

  AllStaffs.fromJson(Map<String, dynamic> json) {
    staffCode = json['Staff_Code'];
    staffName = json['Staff_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Staff_Code'] = staffCode;
    data['Staff_Name'] = staffName;
    return data;
  }
}
