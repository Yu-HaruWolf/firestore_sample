import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

DateTime _dateTimeFromTimestamp(Timestamp timestamp) => timestamp.toDate();
Timestamp _dateTimeToTimestamp(DateTime dateTime) =>
    Timestamp.fromDate(dateTime);

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
  converters: [TimestampConverter()],
)
class User {
  User({
    this.name = "user",
    DateTime? date,
    this.nullable,
    SecondlyClass? secondly,
  }) : date = date ?? DateTime.now(),
       secondly = secondly ?? SecondlyClass();
  String name;
  DateTime date;
  String? nullable;
  SecondlyClass secondly;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
  converters: [TimestampConverter()],
)
class SecondlyClass {
  SecondlyClass({this.sample = "sample value"});
  String sample;

  factory SecondlyClass.fromJson(Map<String, dynamic> json) =>
      _$SecondlyClassFromJson(json);

  Map<String, dynamic> toJson() => _$SecondlyClassToJson(this);
}

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) => timestamp.toDate();

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}
