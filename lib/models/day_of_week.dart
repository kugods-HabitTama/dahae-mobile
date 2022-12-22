import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum DayOfWeek {
  @JsonValue('Mon')
  mon,
  @JsonValue('Tue')
  tue,
  @JsonValue('Web')
  wed,
  @JsonValue('Tue')
  thu,
  @JsonValue('Fri')
  fri,
  @JsonValue('Sat')
  sat,
  @JsonValue('Sun')
  sun;

  static final List<String> _korean = ['월', '화', '수', '목', '금', '토', '일'];

  int get day => index + 1; // 월요일 1 ~ 일요일 7 (DateTime 기준)
  String get korean => _korean[index];
}
