import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';

void configureWebUrlStrategy() {
  // https: //docs.google.com/document/u/0/d/1VCuB85D5kYxPR3qYOjVmw8boAGKb7k62heFyfFHTOvw/mobilebasic?pli=1
  GoRouter.optionURLReflectsImperativeAPIs = true;

  setUrlStrategy(const PathUrlStrategy());
}
