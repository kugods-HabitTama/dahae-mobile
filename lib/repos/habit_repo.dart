import 'dart:convert';

import 'package:dahae_mobile/models/habit.dart';

abstract class HabitRepo {
  static final List<Habit> habitList = [
    Habit.fromJson(jsonDecode(
        '{"id":0,"title":"title0","action":"string0000","value":0,"unit":"stri0ng","time":"10:10","startDate":"2022-12-10","endDate":"2022-12-21","days":["Mon"]}')),
    Habit.fromJson(jsonDecode(
        '{"id":1,"title":"title1","action":"string1111","value":11,"unit":"stri1ng","time":"11:10","startDate":"2022-12-11","endDate":"2022-12-21","days":["Mon"]}')),
    Habit.fromJson(jsonDecode(
        '{"id":2,"title":"title2","action":"string2222","value":22,"unit":"stri2ng","time":"12:10","startDate":"2022-12-12","endDate":"2022-12-21","days":["Mon"]}')),
    Habit.fromJson(jsonDecode(
        '{"id":3,"title":"title3","action":"string3333","value":33,"unit":"stri3ng","time":"13:10","startDate":"2022-12-13","endDate":"2022-12-21","days":["Mon"]}')),
    Habit.fromJson(jsonDecode(
        '{"id":4,"title":"title4","action":"string4444","value":44,"unit":"stri4ng","time":"14:10","startDate":"2022-12-14","endDate":"2022-12-21","days":["Mon"]}')),
    Habit.fromJson(jsonDecode(
        '{"id":5,"title":"title5","action":"string5555","value":55,"unit":"stri5ng","time":"15:10","startDate":"2022-12-15","endDate":"2022-12-23","days":["Mon"]}')),
    Habit.fromJson(jsonDecode(
        '{"id":6,"title":"title6","action":"string6666","value":66,"unit":"stri6ng","time":"16:10","startDate":"2022-12-16","endDate":"2022-12-24","days":["Mon"]}')),
    Habit.fromJson(jsonDecode(
        '{"id":7,"title":"title7","action":"string7777","value":77,"unit":"stri7ng","time":"17:10","startDate":"2022-12-17","endDate":"2022-12-25","days":["Mon"]}')),
    Habit.fromJson(jsonDecode(
        '{"id":8,"title":"title8","action":"string8888","value":88,"unit":"stri8ng","time":"18:10","startDate":"2022-12-18","endDate":"2022-12-26","days":["Mon"]}'))
  ];
}
