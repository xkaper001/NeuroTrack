import 'package:dart_mappable/dart_mappable.dart';

part 'therapist_personal_info_entity.mapper.dart';

// Entity class to store therapist's personal information to Supabase [THERAPIST] table
// This class can have toModel and fromModel methods to convert to and from model

@MappableClass()
class TherapistPersonalInfoEntity with TherapistPersonalInfoEntityMappable {

  @MappableField(key: 'name')
  final String therapistName;

  @MappableField(key: 'email')
  final String email;

  @MappableField(key: 'phone')
  final String phoneNo;

  @MappableField(key: 'clinic_id')
  final String? clinicId;

  @MappableField(key: 'license')
  final String? license;

  @MappableField(key: 'approved')
  final bool approved;

  @MappableField(key: 'specialization')
  final String? specialization;

  @MappableField(key: 'gender')
  final String? gender;

  @MappableField(key: 'offered_therapies')
  final List<String>? offeredTherapies;

  @MappableField(key: 'age')
  final int? age;

  @MappableField(key: 'regulatory_body')
  final String? regulatoryBody;


  TherapistPersonalInfoEntity({
    required this.therapistName,
    required this.email,
    required this.phoneNo,
    required this.approved,
    this.clinicId,
    this.license,
    this.specialization,
    this.gender,
    this.offeredTherapies,
    this.age,
    this.regulatoryBody,
  });



}