// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'therapy_goals_entity.dart';

class TherapyGoalsEntityMapper extends ClassMapperBase<TherapyGoalsEntity> {
  TherapyGoalsEntityMapper._();

  static TherapyGoalsEntityMapper? _instance;
  static TherapyGoalsEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TherapyGoalsEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TherapyGoalsEntity';

  static String _$id(TherapyGoalsEntity v) => v.id;
  static const Field<TherapyGoalsEntity, String> _f$id = Field('id', _$id);
  static DateTime _$createdAt(TherapyGoalsEntity v) => v.createdAt;
  static const Field<TherapyGoalsEntity, DateTime> _f$createdAt =
      Field('createdAt', _$createdAt, key: r'created_at');
  static String _$therapistId(TherapyGoalsEntity v) => v.therapistId;
  static const Field<TherapyGoalsEntity, String> _f$therapistId =
      Field('therapistId', _$therapistId, key: r'therapist_id');
  static String _$patientId(TherapyGoalsEntity v) => v.patientId;
  static const Field<TherapyGoalsEntity, String> _f$patientId =
      Field('patientId', _$patientId, key: r'patient_id');
  static DateTime? _$performedOn(TherapyGoalsEntity v) => v.performedOn;
  static const Field<TherapyGoalsEntity, DateTime> _f$performedOn =
      Field('performedOn', _$performedOn, key: r'performed_on', opt: true);
  static int? _$therapyMode(TherapyGoalsEntity v) => v.therapyMode;
  static const Field<TherapyGoalsEntity, int> _f$therapyMode =
      Field('therapyMode', _$therapyMode, key: r'therapy_mode', opt: true);
  static int? _$duration(TherapyGoalsEntity v) => v.duration;
  static const Field<TherapyGoalsEntity, int> _f$duration =
      Field('duration', _$duration, opt: true);
  static int? _$therapyType(TherapyGoalsEntity v) => v.therapyType;
  static const Field<TherapyGoalsEntity, int> _f$therapyType =
      Field('therapyType', _$therapyType, key: r'therapy_type', opt: true);
  static Map<String, dynamic>? _$goals(TherapyGoalsEntity v) => v.goals;
  static const Field<TherapyGoalsEntity, Map<String, dynamic>> _f$goals =
      Field('goals', _$goals, opt: true);
  static Map<String, dynamic>? _$observations(TherapyGoalsEntity v) =>
      v.observations;
  static const Field<TherapyGoalsEntity, Map<String, dynamic>> _f$observations =
      Field('observations', _$observations, opt: true);
  static Map<String, dynamic>? _$regressions(TherapyGoalsEntity v) =>
      v.regressions;
  static const Field<TherapyGoalsEntity, Map<String, dynamic>> _f$regressions =
      Field('regressions', _$regressions, opt: true);
  static Map<String, dynamic>? _$activities(TherapyGoalsEntity v) =>
      v.activities;
  static const Field<TherapyGoalsEntity, Map<String, dynamic>> _f$activities =
      Field('activities', _$activities, opt: true);
  static int? _$therapyDate(TherapyGoalsEntity v) => v.therapyDate;
  static const Field<TherapyGoalsEntity, int> _f$therapyDate =
      Field('therapyDate', _$therapyDate, key: r'therapy_date', opt: true);

  @override
  final MappableFields<TherapyGoalsEntity> fields = const {
    #id: _f$id,
    #createdAt: _f$createdAt,
    #therapistId: _f$therapistId,
    #patientId: _f$patientId,
    #performedOn: _f$performedOn,
    #therapyMode: _f$therapyMode,
    #duration: _f$duration,
    #therapyType: _f$therapyType,
    #goals: _f$goals,
    #observations: _f$observations,
    #regressions: _f$regressions,
    #activities: _f$activities,
    #therapyDate: _f$therapyDate,
  };

  static TherapyGoalsEntity _instantiate(DecodingData data) {
    return TherapyGoalsEntity(
        id: data.dec(_f$id),
        createdAt: data.dec(_f$createdAt),
        therapistId: data.dec(_f$therapistId),
        patientId: data.dec(_f$patientId),
        performedOn: data.dec(_f$performedOn),
        therapyMode: data.dec(_f$therapyMode),
        duration: data.dec(_f$duration),
        therapyType: data.dec(_f$therapyType),
        goals: data.dec(_f$goals),
        observations: data.dec(_f$observations),
        regressions: data.dec(_f$regressions),
        activities: data.dec(_f$activities),
        therapyDate: data.dec(_f$therapyDate));
  }

  @override
  final Function instantiate = _instantiate;

  static TherapyGoalsEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TherapyGoalsEntity>(map);
  }

  static TherapyGoalsEntity fromJson(String json) {
    return ensureInitialized().decodeJson<TherapyGoalsEntity>(json);
  }
}

mixin TherapyGoalsEntityMappable {
  String toJson() {
    return TherapyGoalsEntityMapper.ensureInitialized()
        .encodeJson<TherapyGoalsEntity>(this as TherapyGoalsEntity);
  }

  Map<String, dynamic> toMap() {
    return TherapyGoalsEntityMapper.ensureInitialized()
        .encodeMap<TherapyGoalsEntity>(this as TherapyGoalsEntity);
  }

  TherapyGoalsEntityCopyWith<TherapyGoalsEntity, TherapyGoalsEntity,
          TherapyGoalsEntity>
      get copyWith => _TherapyGoalsEntityCopyWithImpl(
          this as TherapyGoalsEntity, $identity, $identity);
  @override
  String toString() {
    return TherapyGoalsEntityMapper.ensureInitialized()
        .stringifyValue(this as TherapyGoalsEntity);
  }

  @override
  bool operator ==(Object other) {
    return TherapyGoalsEntityMapper.ensureInitialized()
        .equalsValue(this as TherapyGoalsEntity, other);
  }

  @override
  int get hashCode {
    return TherapyGoalsEntityMapper.ensureInitialized()
        .hashValue(this as TherapyGoalsEntity);
  }
}

extension TherapyGoalsEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TherapyGoalsEntity, $Out> {
  TherapyGoalsEntityCopyWith<$R, TherapyGoalsEntity, $Out>
      get $asTherapyGoalsEntity =>
          $base.as((v, t, t2) => _TherapyGoalsEntityCopyWithImpl(v, t, t2));
}

abstract class TherapyGoalsEntityCopyWith<$R, $In extends TherapyGoalsEntity,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get goals;
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get observations;
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get regressions;
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get activities;
  $R call(
      {String? id,
      DateTime? createdAt,
      String? therapistId,
      String? patientId,
      DateTime? performedOn,
      int? therapyMode,
      int? duration,
      int? therapyType,
      Map<String, dynamic>? goals,
      Map<String, dynamic>? observations,
      Map<String, dynamic>? regressions,
      Map<String, dynamic>? activities,
      int? therapyDate});
  TherapyGoalsEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _TherapyGoalsEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TherapyGoalsEntity, $Out>
    implements TherapyGoalsEntityCopyWith<$R, TherapyGoalsEntity, $Out> {
  _TherapyGoalsEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TherapyGoalsEntity> $mapper =
      TherapyGoalsEntityMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get goals => $value.goals != null
          ? MapCopyWith($value.goals!,
              (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(goals: v))
          : null;
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get observations => $value.observations != null
          ? MapCopyWith(
              $value.observations!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(observations: v))
          : null;
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get regressions => $value.regressions != null
          ? MapCopyWith(
              $value.regressions!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(regressions: v))
          : null;
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>?
      get activities => $value.activities != null
          ? MapCopyWith(
              $value.activities!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(activities: v))
          : null;
  @override
  $R call(
          {String? id,
          DateTime? createdAt,
          String? therapistId,
          String? patientId,
          Object? performedOn = $none,
          Object? therapyMode = $none,
          Object? duration = $none,
          Object? therapyType = $none,
          Object? goals = $none,
          Object? observations = $none,
          Object? regressions = $none,
          Object? activities = $none,
          Object? therapyDate = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (createdAt != null) #createdAt: createdAt,
        if (therapistId != null) #therapistId: therapistId,
        if (patientId != null) #patientId: patientId,
        if (performedOn != $none) #performedOn: performedOn,
        if (therapyMode != $none) #therapyMode: therapyMode,
        if (duration != $none) #duration: duration,
        if (therapyType != $none) #therapyType: therapyType,
        if (goals != $none) #goals: goals,
        if (observations != $none) #observations: observations,
        if (regressions != $none) #regressions: regressions,
        if (activities != $none) #activities: activities,
        if (therapyDate != $none) #therapyDate: therapyDate
      }));
  @override
  TherapyGoalsEntity $make(CopyWithData data) => TherapyGoalsEntity(
      id: data.get(#id, or: $value.id),
      createdAt: data.get(#createdAt, or: $value.createdAt),
      therapistId: data.get(#therapistId, or: $value.therapistId),
      patientId: data.get(#patientId, or: $value.patientId),
      performedOn: data.get(#performedOn, or: $value.performedOn),
      therapyMode: data.get(#therapyMode, or: $value.therapyMode),
      duration: data.get(#duration, or: $value.duration),
      therapyType: data.get(#therapyType, or: $value.therapyType),
      goals: data.get(#goals, or: $value.goals),
      observations: data.get(#observations, or: $value.observations),
      regressions: data.get(#regressions, or: $value.regressions),
      activities: data.get(#activities, or: $value.activities),
      therapyDate: data.get(#therapyDate, or: $value.therapyDate));

  @override
  TherapyGoalsEntityCopyWith<$R2, TherapyGoalsEntity, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TherapyGoalsEntityCopyWithImpl($value, $cast, t);
}
