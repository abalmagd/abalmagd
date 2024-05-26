class Person {
  const Person({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.logoPath,
    required this.socialLinks,
  });

  final String name;
  final String description;
  final String imagePath;
  final String logoPath;
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
