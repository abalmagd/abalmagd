import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/domain/models/person.dart';

/// Data holder class for all of the local data present in this web app,
/// for example: personal photo, projects data, about info/texts.
class Data {
  static const person = Person(
    name: 'name',
    description: 'description',
    imagePath: Assets.pfp,
    logoPath: Assets.logoStrokes,
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
      SocialLink(
        url:
            'https://drive.google.com/file/d/14Eecw8MfclHq37hYXDmUAqwm2IxU0mb4/view',
        name: 'Resume',
        icon: Assets.doc,
      ),
    ],
  );
}
