// ignore_for_file: file_names

import 'package:fluro/fluro.dart';

import 'view404.dart';

class View404Handlers {
  static Handler view404 = Handler(handlerFunc: (context, params) {
    // Provider.of<SideMenuProvider>(context!).setCurrentPageUrl('/404');
    return View404();
  });
}
