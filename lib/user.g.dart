// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  name: json['name'] as String? ?? "user",
  date: _$JsonConverterFromJson<Timestamp, DateTime>(
    json['date'],
    const TimestampConverter().fromJson,
  ),
  nullable: json['nullable'] as String?,
  secondly:
      json['secondly'] == null
          ? null
          : SecondlyClass.fromJson(json['secondly'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'name': instance.name,
  'date': const TimestampConverter().toJson(instance.date),
  if (instance.nullable case final value?) 'nullable': value,
  'secondly': instance.secondly.toJson(),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

SecondlyClass _$SecondlyClassFromJson(Map<String, dynamic> json) =>
    SecondlyClass(sample: json['sample'] as String? ?? "sample value");

Map<String, dynamic> _$SecondlyClassToJson(SecondlyClass instance) =>
    <String, dynamic>{'sample': instance.sample};
