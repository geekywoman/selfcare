class AllergyData {
  String atc;
  String classification;
  String comment;
  String component;
  String createDate;
  String type;

  AllergyData({this.atc, this.classification, this.comment, this.component,
      this.createDate, this.type});


  factory AllergyData.fromJson(Map<String, dynamic> json) {
    return AllergyData(
      atc: json['atc'],
      classification: json['classification'],
      comment: json['comment'],
      component: json['component'],
      createDate: json['createDate'],
      type: json['type'],
    );
  }

}