import 'constants/assets.dart';
import 'localization/locale_keys.dart';
import 'models/person.dart';

/// Data holder class for all of the local data present.
/// TODO: Fill data
class Data {
  static const person = Person(
    name: LocaleKeys.myName,
    jobTitle: LocaleKeys.jobTitle,
    about: LocaleKeys.myAbout,
    intro: LocaleKeys.myIntro,
    image: Assets.pfp,
    logo: Assets.logo,
    resumeUrl:
        'https://drive.usercontent.google.com/uc?id=14Eecw8MfclHq37hYXDmUAqwm2IxU0mb4&export=download',
    socialLinks: [
      SocialLink(
        url: 'https://www.linkedin.com/in/abalmagd/',
        name: 'LinkedIn',
        icon: Assets.linkedin,
      ),
      SocialLink(
        url: 'https://github.com/abalmagd',
        name: 'Github',
        icon: Assets.github,
      ),
    ],
  );
}
