import 'package:flutter/material.dart';

// Todo
// HabitRecord 객체를 입력받아 '메인 페이지'에 있는 HabitTile을 구현합니다.
// 클릭하면 입력 필드가 나와서 얼마나 했는지 작성할 수 있어야 합니다.
// 수정버튼을 누르면 내부에 있는 HabitRecord의 Habit을 찾아 해당 Habit을 수정할 수 있는
// 팝업을 띄울 수 있어야 합니다.
class HabitRecordTile extends StatelessWidget {
  final String title;

  const HabitRecordTile({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Theme.of(context).backgroundColor,
        ),
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [Expanded(child: Text(title)), const Icon(Icons.done)],
        ),
      ),
    );
  }
}
