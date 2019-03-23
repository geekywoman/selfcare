class Treatment {
  String description;
  String form;
  int strength;
  String strengthUnit;
  int morningDose;
  int afternoonDose;
  int eveningDose;
  String instructions;

  Treatment({this.description, this.form, this.strength, this.strengthUnit,
      this.morningDose, this.afternoonDose, this.eveningDose,
      this.instructions});


  factory Treatment.fromJson(Map<String, dynamic> json) {
    return Treatment(
      description: json['description'],
      form: json['form'],
      strength: json['strength'],
      strengthUnit: json['strengthUnit'],
      morningDose: json['morningDose'],
      afternoonDose: json['afternoonDose'],
      eveningDose: json['eveningDose'],
      instructions: json['instructions'],
    );
  }

}