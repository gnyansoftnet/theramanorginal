class SlotTimeModel {
  List<AllSlotTime>? allSlotTime;
  SlotTimeModel({this.allSlotTime});

  SlotTimeModel.fromJson(Map<String, dynamic> json) {
    if (json['AllSlotTime'] != null) {
      allSlotTime = <AllSlotTime>[];
      json['AllSlotTime'].forEach((v) {
        allSlotTime!.add(AllSlotTime.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (allSlotTime != null) {
      data['AllSlotTime'] = allSlotTime!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllSlotTime {
  String? slotCode;
  String? slotName;

  AllSlotTime({this.slotCode, this.slotName});

  AllSlotTime.fromJson(Map<String, dynamic> json) {
    slotCode = json['Slot_Code'];
    slotName = json['Slot_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Slot_Code'] = slotCode;
    data['Slot_Name'] = slotName;
    return data;
  }
}
