class ReasonModel {
  List<Reasons>? reasons;

  ReasonModel({this.reasons});

  ReasonModel.fromJson(Map<String, dynamic> json) {
    if (json['Reasons'] != null) {
      reasons = <Reasons>[];
      json['Reasons'].forEach((v) {
        reasons!.add(Reasons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (reasons != null) {
      data['Reasons'] = reasons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reasons {
  String? reasonCode;
  String? reasonName;

  Reasons({this.reasonCode, this.reasonName});

  Reasons.fromJson(Map<String, dynamic> json) {
    reasonCode = json['Reason_Code'];
    reasonName = json['Reason_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Reason_Code'] = reasonCode;
    data['Reason_Name'] = reasonName;
    return data;
  }
}
