class DiagnosticImagingData {
  List<int> referralIds;
  String testDate;
  String resultDate;
  String labName;
  String type;
  String result;

  DiagnosticImagingData(
      {this.referralIds,
      this.testDate,
      this.resultDate,
      this.labName,
      this.type,
      this.result});

  factory DiagnosticImagingData.fromJson(Map<String, dynamic> json) {
    return DiagnosticImagingData(
      referralIds: json['referralIds'] != null
          ? json['referralIds'].cast<int>() as List
          : null,
      testDate: json['testDate'],
      resultDate: json['resultDate'],
      labName: json['labName'],
      type: json['type'],
      result: json['result'],
    );
  }
}
