class SessionSummaryDetailModel {
  List<SessionDtl>? sessionDtl;

  SessionSummaryDetailModel({this.sessionDtl});

  SessionSummaryDetailModel.fromJson(Map<String, dynamic> json) {
    if (json['SessionDtl'] != null) {
      sessionDtl = <SessionDtl>[];
      json['SessionDtl'].forEach((v) {
        sessionDtl!.add(SessionDtl.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sessionDtl != null) {
      data['SessionDtl'] = sessionDtl!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SessionDtl {
  String? allotDay;
  String? isSunday;
  int? allotted;
  int? taken;
  int? cancelled;
  int? assessment;

  SessionDtl(
      {this.allotDay,
      this.isSunday,
      this.allotted,
      this.taken,
      this.cancelled,
      this.assessment});

  SessionDtl.fromJson(Map<String, dynamic> json) {
    allotDay = json['Allot_Day'];
    isSunday = json['Is_Sunday'];
    allotted = json['Allotted'];
    taken = json['Taken'];
    cancelled = json['Cancelled'];
    assessment = json['Assessment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Allot_Day'] = allotDay;
    data['Is_Sunday'] = isSunday;
    data['Allotted'] = allotted;
    data['Taken'] = taken;
    data['Cancelled'] = cancelled;
    data['Assessment'] = assessment;
    return data;
  }
}
