class ReferralData {
  int referralId;
  String validFrom;
  String validTo;
  String issuedBy;
  String speciality;
  int status;
  String patientHistory;
  String request;

  ReferralData({this.referralId, this.validFrom, this.validTo, this.issuedBy,
      this.speciality, this.status, this.patientHistory, this.request});



  factory ReferralData.fromJson(Map<String, dynamic> json) {
    return ReferralData(
        referralId: json['referralId'],
        validFrom: json['validFrom'],
        validTo: json['validTo'],
        issuedBy: json['issuedBy'],
        speciality: json['speciality'],
        status: json['status'],
        patientHistory: json['patientHistory'],
        request: json['request'],

    );
  }
}