class MeasurementItem {
  String description;
  String type;
  String value;
  String unit;

  MeasurementItem({this.description, this.type, this.value, this.unit});

  factory MeasurementItem.fromJson(Map<String, dynamic> json) {
    return MeasurementItem(
      description: json['description'],
      type: json['type'],
      value: json['value'],
      unit: json['unit'],
    );
  }
}
