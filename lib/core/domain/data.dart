import 'constants/assets.dart';
import 'models/person.dart';

/// Data holder class for all of the local data present.
/// TODO: Fill data
class Data {
  static const person = Person(
    name: 'name',
    about: 'about',
    description: 'description',
    image: Assets.pfp,
    logo: Assets.logo,
    socialLinks: [
      SocialLink(
        url: 'https://www.linkedin.com/in/abalmagd/',
        name: '',
        icon: '',
      ),
      SocialLink(
        url: 'https://github.com/abalmagd',
        name: '',
        icon: '',
      ),
      SocialLink(
        url:
            'https://drive.google.com/file/d/14Eecw8MfclHq37hYXDmUAqwm2IxU0mb4/view',
        name: '',
        icon: '',
      ),
    ],
  );
}
