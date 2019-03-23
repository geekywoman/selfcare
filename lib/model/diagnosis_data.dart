class DiagnosisData {
  int id;
  List<int> treatmentPlanIds;
  String date;
  String icD10Code;
  String term;

  DiagnosisData({this.id, this.treatmentPlanIds, this.date, this.icD10Code,
      this.term});


  factory DiagnosisData.fromJson(Map<String, dynamic> json) {
    return DiagnosisData(
        id: json['id'],
        treatmentPlanIds: json['treatmentPlanIds'] as List,
        date: json['date'],
      icD10Code: json['icD10Code'],
      term: json['term'],
    );
  }

}