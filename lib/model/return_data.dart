import 'package:selfcare/model/allergy_data.dart';
import 'package:selfcare/model/appointment_data.dart';
import 'package:selfcare/model/arrival_data.dart';
import 'package:selfcare/model/bloodwork_data.dart';
import 'package:selfcare/model/diagnosis_data.dart';
import 'package:selfcare/model/diagnostic_imaging_data.dart';
import 'package:selfcare/model/encounter_data.dart';
import 'package:selfcare/model/measurements_data.dart';
import 'package:selfcare/model/medication_data.dart';
import 'package:selfcare/model/referral_data.dart';
import 'package:selfcare/model/treatment_plan.dart';
import 'package:selfcare/model/vaccination_data.dart';

class ReturnData {
  List<AppointmentData> appointmentData;
  List<ArrivalData> arrivalData;
  List<EncounterData> encounterData;
  List<AllergyData> allergyData;
  List<MeasurementData> measurementsData;
  List<BloodWorkData> bloodworksData;
  List<DiagnosticImagingData> diagnosticImagingData;
  List<DiagnosisData> diagnosisData;
  List<TreatmentPlan> treatmentPlans;
  List<ReferralData> referralData;
  List<VaccinationData> vaccinationData;
  List<MedicationData> medicationData;

  ReturnData(
      {this.appointmentData,
      this.arrivalData,
      this.encounterData,
      this.allergyData,
      this.measurementsData,
      this.bloodworksData,
      this.diagnosticImagingData,
      this.diagnosisData,
      this.treatmentPlans,
      this.referralData,
      this.vaccinationData,
      this.medicationData});

  factory ReturnData.fromJson(Map<String, dynamic> json) {
    return ReturnData(
      appointmentData: (json['appointmentData'] as List).map((i) {
        return AppointmentData.fromJson(i);
      }).toList(),
      arrivalData: (json['arrivalData'] as List).map((i) {
        return ArrivalData.fromJson(i);
      }).toList(),
      encounterData: (json['encounterData'] as List).map((i) {
        return EncounterData.fromJson(i);
      }).toList(),
      allergyData: (json['allergyData'] as List).map((i) {
        return AllergyData.fromJson(i);
      }).toList(),
      measurementsData: (json['measurementsData'] as List).map((i) {
        return MeasurementData.fromJson(i);
      }).toList(),
      bloodworksData: (json['bloodworksData'] as List).map((i) {
        return BloodWorkData.fromJson(i);
      }).toList(),
      diagnosticImagingData: (json['diagnosticImagingData'] as List).map((i) {
        return DiagnosticImagingData.fromJson(i);
      }).toList(),
      diagnosisData: (json['diagnosisData'] as List).map((i) {
        return DiagnosisData.fromJson(i);
      }).toList(),
      treatmentPlans: (json['treatmentPlans'] as List).map((i) {
        return TreatmentPlan.fromJson(i);
      }).toList(),
      referralData: (json['referralData'] as List).map((i) {
        return ReferralData.fromJson(i);
      }).toList(),
      vaccinationData: (json['vaccinationData'] as List).map((i) {
        return VaccinationData.fromJson(i);
      }).toList(),
      medicationData: (json['medicationData'] as List).map((i) {
        return MedicationData.fromJson(i);
      }).toList(),
    );
  }
}
