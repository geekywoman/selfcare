class MedicationData {
  String atcCode;
  String confirmDate;
  int daysLeft;
  String instructions;
  String form;
  String lastPrescribed;
  String name;
  int numberOfPackings;
  int numberOfTimes;
  bool oneTimeOnly;
  String prescriptionEnds;
  int quantity;
  int strength;
  String strengthUnit;
  int totalQuantity;

  MedicationData({this.atcCode, this.confirmDate, this.daysLeft,
      this.instructions, this.form, this.lastPrescribed, this.name,
      this.numberOfPackings, this.numberOfTimes, this.oneTimeOnly,
      this.prescriptionEnds, this.quantity, this.strength, this.strengthUnit,
      this.totalQuantity});


  factory MedicationData.fromJson(Map<String, dynamic> json) {
    return MedicationData(
      atcCode: json['atcCode'],
      confirmDate: json['confirmDate'],
      daysLeft: json['daysLeft'],
      instructions: json['instructions'],
      form: json['form'],
      lastPrescribed: json['lastPrescribed'],
      name: json['name'],
      numberOfPackings: json['numberOfPackings'],
      numberOfTimes: json['numberOfTimes'],
      oneTimeOnly: json['oneTimeOnly'],
      prescriptionEnds: json['prescriptionEnds'],
      quantity: json['quantity'],
      strength: json['strength'],
      strengthUnit: json['strengthUnit'],
      totalQuantity: json['totalQuantity'],
    );
  }



}