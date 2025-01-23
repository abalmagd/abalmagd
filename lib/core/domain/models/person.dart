import 'package:portfolio/core/domain/models/service.dart';

class Person {
  const Person({
    required this.name,
    required this.about,
    required this.image,
    required this.logo,
    required this.socialLinks,
    required this.jobTitle,
    required this.intro,
    required this.resumeUrl,
    required this.services,
  });

  final String name;
  final String about;
  final String intro;
  final String image;
  final String logo;
  final String jobTitle;
  final String resumeUrl;
  final List<SocialLink> socialLinks;
  final List<PortfolioService> services;
}

class SocialLink {
  const SocialLink({
    required this.url,
    required this.icon,
    required this.name,
  });

  final String url;
  final String icon;
  final String name;
}
