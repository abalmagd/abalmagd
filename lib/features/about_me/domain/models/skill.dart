import 'package:portfolio/core/constants/assets.dart';

enum Skill {
  flutter(Assets.flutter),
  appStore(Assets.appStore),
  clickUp(Assets.clickUp),
  dart(Assets.dart),
  figma(Assets.figma),
  firebase(Assets.firebase),
  googleDrive(Assets.googleDrive),
  googleMaps(Assets.googleMaps),
  git(Assets.git),
  github(Assets.githubOcto),
  microsoftAzure(Assets.microsoftAzure),
  oneSignal(Assets.oneSignal),
  playStore(Assets.playStore),
  postman(Assets.postman),
  supabase(Assets.supabase);

  final String icon;

  const Skill(this.icon);
}
