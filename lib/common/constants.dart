// App 사용하는 모든 상수값을 모아놓는 파일
abstract class Constants {
  // String.fromEnvironment을 통해 컴파일타임 환경변수로 설정한 값을 읽어온다.
  static const baseUrl = String.fromEnvironment('BASE_URL');

  static const dahaeNoticeUrl =
      'https://instagram.com/dahae.kugods_official?igshid=YmMyMTA2M2Y=';
  static const dahaeInfoUrl =
      'https://instagram.com/dahae.kugods_official?igshid=YmMyMTA2M2Y=';
}
