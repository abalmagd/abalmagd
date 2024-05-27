import 'package:portfolio/core/constants/assets.dart';

enum Skill {
  flutter(Assets.flutter, 'Flutter'),
  appStore(Assets.appStore, 'App Store'),
  clickUp(Assets.clickUp, 'ClickUp'),
  dart(Assets.dart, 'Dart'),
  figma(Assets.figma, 'Figma'),
  firebase(Assets.firebase, 'Firebase'),
  googleDrive(Assets.googleDrive, 'Google Drive'),
  googleMaps(Assets.googleMaps, 'Google Maps'),
  git(Assets.git, 'Git'),
  github(Assets.githubOcto, 'Github'),
  microsoftAzure(Assets.microsoftAzure, 'Microsoft Azure'),
  oneSignal(Assets.oneSignal, 'OneSignal'),
  playStore(Assets.playStore, 'Play Store'),
  postman(Assets.postman, 'Postman'),
  supabase(Assets.supabase, 'Supabase');

  final String icon;
  final String name;

  const Skill(this.icon, this.name);
}
