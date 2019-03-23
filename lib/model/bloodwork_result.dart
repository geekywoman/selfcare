class BloodworkResult {
  String type;
  String category;
  double value;
  String description;
  String unit;
  double lowerLimitNumber;
  double upperLimitNumber;

  BloodworkResult(
      {this.type,
      this.category,
      this.value,
      this.description,
      this.unit,
      this.lowerLimitNumber,
      this.upperLimitNumber});

  factory BloodworkResult.fromJson(Map<String, dynamic> json) {
    return BloodworkResult(
      type: json['type'],
      category: json['category'],
      value: json['value'],
      description: json['description'],
      unit: json['unit'],
      lowerLimitNumber: json['lowerLimitNumber'],
      upperLimitNumber: json['upperLimitNumber'],
    );
  }
}
