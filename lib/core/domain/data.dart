import 'package:portfolio/core/constants/assets.dart';
import 'package:portfolio/core/domain/models/person.dart';

/// Data holder class for all of the local data present in this website,
/// for example: personal photo, projects data, about info/texts.
class Data {
  static const person = Person(
    firstName: 'firstName',
    description: 'description',
    imagePath: Assets.profilePicture,
    frontLogoPath: Assets.brandLetter,
    backLogoPath: Assets.brandStrokes,
    lastName: 'lastName',
  );
}
