import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/domain/data.dart';
import 'package:universal_html/html.dart';

final coreControllerProvider =
    NotifierProvider<CoreController, void>(CoreController.new);

class CoreController extends Notifier<void> {
  @override
  void build() {}

  void downloadCV() {
    final anchorElement = AnchorElement(href: Data.person.resumeUrl);
    anchorElement.download = Data.person.resumeUrl;
    anchorElement.click();
  }
}
