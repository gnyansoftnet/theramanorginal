class SessionSummaryModel {
  List<SessionSummary>? sessionSummary;

  SessionSummaryModel({this.sessionSummary});

  SessionSummaryModel.fromJson(Map<String, dynamic> json) {
    if (json['SessionSummary'] != null) {
      sessionSummary = <SessionSummary>[];
      json['SessionSummary'].forEach((v) {
        sessionSummary!.add(SessionSummary.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sessionSummary != null) {
      data['SessionSummary'] = sessionSummary!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SessionSummary {
  int? totalAllotted;
  int? totalTaken;
  int? totalCancelled;
  int? totalAssessment;

  SessionSummary(
      {this.totalAllotted,
      this.totalTaken,
      this.totalCancelled,
      this.totalAssessment});

  SessionSummary.fromJson(Map<String, dynamic> json) {
    totalAllotted = json['Total_Allotted'];
    totalTaken = json['Total_Taken'];
    totalCancelled = json['Total_Cancelled'];
    totalAssessment = json['Total_Assessment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Total_Allotted'] = totalAllotted;
    data['Total_Taken'] = totalTaken;
    data['Total_Cancelled'] = totalCancelled;
    data['Total_Assessment'] = totalAssessment;
    return data;
  }
}
