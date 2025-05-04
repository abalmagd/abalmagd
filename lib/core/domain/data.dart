import 'constants/assets.dart';
import 'localization/locale_keys.dart';
import 'models/person.dart';
import 'models/service.dart';

/// Data holder class for all of the local data present.
/// TODO: Fill data
class Data {
  static var person = Person(
    name: LocaleKeys.myName,
    jobTitle: LocaleKeys.jobTitle,
    about: LocaleKeys.myAbout,
    image: Assets.pfp,
    logo: Assets.logo,
    resumeUrl:
        'https://drive.usercontent.google.com/uc?id=14Eecw8MfclHq37hYXDmUAqwm2IxU0mb4&export=download',
    socialLinks: const [
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
    services: [
      PortfolioService(
        title: LocaleKeys.crossPlatformApps,
        description: LocaleKeys.crossPlatformAppsDesc,
        icon: Assets.crossPlatform,
      ),
      PortfolioService(
        title: LocaleKeys.designImplementation,
        description: LocaleKeys.designImplementationDesc,
        icon: Assets.design,
      ),
      PortfolioService(
        title: LocaleKeys.apiAndDataIntegration,
        description: LocaleKeys.apiAndDataIntegrationDesc,
        icon: Assets.apiData,
      ),
      PortfolioService(
        title: LocaleKeys.appDeployment,
        description: LocaleKeys.appDeploymentDesc,
        icon: Assets.appDeployment,
      ),
    ],
  );
}
