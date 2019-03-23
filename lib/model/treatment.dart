class Treatment {
  String description;
  String form;
  double strength;
  String strengthUnit;
  double morningDose;
  double afternoonDose;
  double eveningDose;
  String instructions;
  bool checked;

  Treatment(
      {this.description,
      this.form,
      this.strength,
      this.strengthUnit,
      this.morningDose,
      this.afternoonDose,
      this.eveningDose,
      this.instructions,
      this.checked = false});

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
