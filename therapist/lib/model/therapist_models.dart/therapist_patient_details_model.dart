
import 'package:dart_mappable/dart_mappable.dart';

part 'therapist_patient_details_model.mapper.dart';

@MappableClass()
class TherapistPatientDetailsModel with TherapistPatientDetailsModelMappable {
  
  final String patientId;
  final String patientName;
  final String phoneNo;
  final String email;


  TherapistPatientDetailsModel({
    required this.patientId,
    required this.patientName,
    required this.phoneNo,
    required this.email,
  });

}