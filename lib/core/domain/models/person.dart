class Person {
  const Person({
    required this.name,
    required this.about,
    required this.image,
    required this.logo,
    required this.socialLinks,
    this.description,
  });

  final String name;
  final String about;
  final String? description;
  final String image;
  final String logo;
  final List<SocialLink> socialLinks;
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
