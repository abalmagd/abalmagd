class Person {
  const Person({
    required this.firstName,
    required this.lastName,
    required this.description,
    required this.imagePath,
    required this.frontLogoPath,
    required this.backLogoPath,
  });

  final String firstName;
  final String lastName;
  final String description;
  final String imagePath;
  final String frontLogoPath;
  final String backLogoPath;
}
