import '/resources/pages/signup_page.dart';
import 'package:flutter_app/resources/pages/account_page.dart';

import '/resources/pages/profile_page.dart';
import '/resources/pages/statement_page.dart';
import '/resources/pages/appusage_page.dart';
import '/resources/pages/main_page.dart';
import '/resources/pages/nfc_page.dart';
import '/resources/pages/signin_page.dart';
import '/resources/pages/map_page.dart';
import '../resources/pages/nav_page.dart';
import '../resources/pages/about_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

/* App Router
|--------------------------------------------------------------------------
| * [Tip] Create pages faster 🚀
| Run the below in the terminal to create new a page.
| "dart run nylo_framework:main make:page profile_page"
| Learn more https://nylo.dev/docs/5.20.0/router
|-------------------------------------------------------------------------- */

appRouter() => nyRoutes((router) {
      router.route(AboutPage.path, (context) => AboutPage());
      // Add your routes here

      // router.route(NewPage.path, (context) => NewPage(), transition: PageTransitionType.fade);

      // Example using grouped routes
      // router.group(() => {
      //   "route_guards": [AuthRouteGuard()],
      //   "prefix": "/dashboard"
      // }, (router) {
      //
      //   router.route(AccountPage.path, (context) => AccountPage());
      // });
      router.route(NavPage.path, (context) => NavPage(), authPage: true);
      router.route(MapPage.path, (context) => MapPage());
      router.route(SigninPage.path, (context) => SigninPage(),
          initialRoute: true);
      router.route(NfcPage.path, (context) => NfcPage());
      router.route(MainPage.path, (context) => MainPage());
      router.route(AppusagePage.path, (context) => AppusagePage());
      router.route(StatementPage.path, (context) => StatementPage());
      router.route(ProfilePage.path, (context) => ProfilePage());
      router.route(AccountPage.path, (context) => AccountPage());
      router.route(SignupPage.path, (context) => SignupPage());
});
