import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/domain/models/person.dart';

/// Data holder class for all of the local data present in this web app,
/// for example: personal photo, projects data, about info/texts.
class Data {
  static const person = Person(
    name: 'firstName',
    description: 'description',
    imagePath: Assets.pfp,
    logoPath: Assets.logoStrokes,
  );
}
