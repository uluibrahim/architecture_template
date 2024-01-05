import 'package:auto_route/auto_route.dart';

import '../../screens/bottom_navigation/bottom_navigation_view.dart';
import '../../screens/home/home_view.dart';
import '../../screens/settings/settings_view.dart';
import '../../screens/template/template_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: BottomNavigationRoute.page, initial: true),
        AutoRoute(page: MyHomeRoute.page),
        AutoRoute(page: TemplateRoute.page),
        AutoRoute(page: SettingsRoute.page),
      ];
}
