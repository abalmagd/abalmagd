import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_html/js.dart' as js;

final homeControllerProvider =
    NotifierProvider<HomeController, void>(HomeController.new);

class HomeController extends Notifier<void> {
  @override
  void build() {}

  void openSocialLink(String url) {
    js.context.callMethod('open', [url, '_blank']);
  }
}
