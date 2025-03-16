// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'therapist_personal_info_entity.dart';

class TherapistPersonalInfoEntityMapper
    extends ClassMapperBase<TherapistPersonalInfoEntity> {
  TherapistPersonalInfoEntityMapper._();

  static TherapistPersonalInfoEntityMapper? _instance;
  static TherapistPersonalInfoEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = TherapistPersonalInfoEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TherapistPersonalInfoEntity';

  static String _$therapistName(TherapistPersonalInfoEntity v) =>
      v.therapistName;
  static const Field<TherapistPersonalInfoEntity, String> _f$therapistName =
      Field('therapistName', _$therapistName, key: r'name');
  static String _$email(TherapistPersonalInfoEntity v) => v.email;
  static const Field<TherapistPersonalInfoEntity, String> _f$email =
      Field('email', _$email);
  static String _$phoneNo(TherapistPersonalInfoEntity v) => v.phoneNo;
  static const Field<TherapistPersonalInfoEntity, String> _f$phoneNo =
      Field('phoneNo', _$phoneNo, key: r'phone');
  static bool _$approved(TherapistPersonalInfoEntity v) => v.approved;
  static const Field<TherapistPersonalInfoEntity, bool> _f$approved =
      Field('approved', _$approved);
  static String? _$clinicId(TherapistPersonalInfoEntity v) => v.clinicId;
  static const Field<TherapistPersonalInfoEntity, String> _f$clinicId =
      Field('clinicId', _$clinicId, key: r'clinic_id', opt: true);
  static String? _$license(TherapistPersonalInfoEntity v) => v.license;
  static const Field<TherapistPersonalInfoEntity, String> _f$license =
      Field('license', _$license, opt: true);
  static String? _$specialization(TherapistPersonalInfoEntity v) =>
      v.specialization;
  static const Field<TherapistPersonalInfoEntity, String> _f$specialization =
      Field('specialization', _$specialization, opt: true);
  static String? _$gender(TherapistPersonalInfoEntity v) => v.gender;
  static const Field<TherapistPersonalInfoEntity, String> _f$gender =
      Field('gender', _$gender, opt: true);
  static List<String>? _$offeredTherapies(TherapistPersonalInfoEntity v) =>
      v.offeredTherapies;
  static const Field<TherapistPersonalInfoEntity, List<String>>
      _f$offeredTherapies = Field('offeredTherapies', _$offeredTherapies,
          key: r'offered_therapies', opt: true);
  static int? _$age(TherapistPersonalInfoEntity v) => v.age;
  static const Field<TherapistPersonalInfoEntity, int> _f$age =
      Field('age', _$age, opt: true);
  static String? _$regulatoryBody(TherapistPersonalInfoEntity v) =>
      v.regulatoryBody;
  static const Field<TherapistPersonalInfoEntity, String> _f$regulatoryBody =
      Field('regulatoryBody', _$regulatoryBody,
          key: r'regulatory_body', opt: true);

  @override
  final MappableFields<TherapistPersonalInfoEntity> fields = const {
    #therapistName: _f$therapistName,
    #email: _f$email,
    #phoneNo: _f$phoneNo,
    #approved: _f$approved,
    #clinicId: _f$clinicId,
    #license: _f$license,
    #specialization: _f$specialization,
    #gender: _f$gender,
    #offeredTherapies: _f$offeredTherapies,
    #age: _f$age,
    #regulatoryBody: _f$regulatoryBody,
  };

  static TherapistPersonalInfoEntity _instantiate(DecodingData data) {
    return TherapistPersonalInfoEntity(
        therapistName: data.dec(_f$therapistName),
        email: data.dec(_f$email),
        phoneNo: data.dec(_f$phoneNo),
        approved: data.dec(_f$approved),
        clinicId: data.dec(_f$clinicId),
        license: data.dec(_f$license),
        specialization: data.dec(_f$specialization),
        gender: data.dec(_f$gender),
        offeredTherapies: data.dec(_f$offeredTherapies),
        age: data.dec(_f$age),
        regulatoryBody: data.dec(_f$regulatoryBody));
  }

  @override
  final Function instantiate = _instantiate;

  static TherapistPersonalInfoEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TherapistPersonalInfoEntity>(map);
  }

  static TherapistPersonalInfoEntity fromJson(String json) {
    return ensureInitialized().decodeJson<TherapistPersonalInfoEntity>(json);
  }
}

mixin TherapistPersonalInfoEntityMappable {
  String toJson() {
    return TherapistPersonalInfoEntityMapper.ensureInitialized()
        .encodeJson<TherapistPersonalInfoEntity>(
            this as TherapistPersonalInfoEntity);
  }

  Map<String, dynamic> toMap() {
    return TherapistPersonalInfoEntityMapper.ensureInitialized()
        .encodeMap<TherapistPersonalInfoEntity>(
            this as TherapistPersonalInfoEntity);
  }

  TherapistPersonalInfoEntityCopyWith<TherapistPersonalInfoEntity,
          TherapistPersonalInfoEntity, TherapistPersonalInfoEntity>
      get copyWith => _TherapistPersonalInfoEntityCopyWithImpl(
          this as TherapistPersonalInfoEntity, $identity, $identity);
  @override
  String toString() {
    return TherapistPersonalInfoEntityMapper.ensureInitialized()
        .stringifyValue(this as TherapistPersonalInfoEntity);
  }

  @override
  bool operator ==(Object other) {
    return TherapistPersonalInfoEntityMapper.ensureInitialized()
        .equalsValue(this as TherapistPersonalInfoEntity, other);
  }

  @override
  int get hashCode {
    return TherapistPersonalInfoEntityMapper.ensureInitialized()
        .hashValue(this as TherapistPersonalInfoEntity);
  }
}

extension TherapistPersonalInfoEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TherapistPersonalInfoEntity, $Out> {
  TherapistPersonalInfoEntityCopyWith<$R, TherapistPersonalInfoEntity, $Out>
      get $asTherapistPersonalInfoEntity => $base
          .as((v, t, t2) => _TherapistPersonalInfoEntityCopyWithImpl(v, t, t2));
}

abstract class TherapistPersonalInfoEntityCopyWith<
    $R,
    $In extends TherapistPersonalInfoEntity,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get offeredTherapies;
  $R call(
      {String? therapistName,
      String? email,
      String? phoneNo,
      bool? approved,
      String? clinicId,
      String? license,
      String? specialization,
      String? gender,
      List<String>? offeredTherapies,
      int? age,
      String? regulatoryBody});
  TherapistPersonalInfoEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TherapistPersonalInfoEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TherapistPersonalInfoEntity, $Out>
    implements
        TherapistPersonalInfoEntityCopyWith<$R, TherapistPersonalInfoEntity,
            $Out> {
  _TherapistPersonalInfoEntityCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TherapistPersonalInfoEntity> $mapper =
      TherapistPersonalInfoEntityMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get offeredTherapies => $value.offeredTherapies != null
          ? ListCopyWith(
              $value.offeredTherapies!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(offeredTherapies: v))
          : null;
  @override
  $R call(
          {String? therapistName,
          String? email,
          String? phoneNo,
          bool? approved,
          Object? clinicId = $none,
          Object? license = $none,
          Object? specialization = $none,
          Object? gender = $none,
          Object? offeredTherapies = $none,
          Object? age = $none,
          Object? regulatoryBody = $none}) =>
      $apply(FieldCopyWithData({
        if (therapistName != null) #therapistName: therapistName,
        if (email != null) #email: email,
        if (phoneNo != null) #phoneNo: phoneNo,
        if (approved != null) #approved: approved,
        if (clinicId != $none) #clinicId: clinicId,
        if (license != $none) #license: license,
        if (specialization != $none) #specialization: specialization,
        if (gender != $none) #gender: gender,
        if (offeredTherapies != $none) #offeredTherapies: offeredTherapies,
        if (age != $none) #age: age,
        if (regulatoryBody != $none) #regulatoryBody: regulatoryBody
      }));
  @override
  TherapistPersonalInfoEntity $make(CopyWithData data) =>
      TherapistPersonalInfoEntity(
          therapistName: data.get(#therapistName, or: $value.therapistName),
          email: data.get(#email, or: $value.email),
          phoneNo: data.get(#phoneNo, or: $value.phoneNo),
          approved: data.get(#approved, or: $value.approved),
          clinicId: data.get(#clinicId, or: $value.clinicId),
          license: data.get(#license, or: $value.license),
          specialization: data.get(#specialization, or: $value.specialization),
          gender: data.get(#gender, or: $value.gender),
          offeredTherapies:
              data.get(#offeredTherapies, or: $value.offeredTherapies),
          age: data.get(#age, or: $value.age),
          regulatoryBody: data.get(#regulatoryBody, or: $value.regulatoryBody));

  @override
  TherapistPersonalInfoEntityCopyWith<$R2, TherapistPersonalInfoEntity, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _TherapistPersonalInfoEntityCopyWithImpl($value, $cast, t);
}
