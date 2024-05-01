import '/resources/pages/main_page.dart';
import '/resources/pages/nfc_page.dart';
import '/resources/pages/signout_page.dart';
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
      router.route(NavPage.path, (context) => NavPage(), initialRoute: true);
      router.route(MapPage.path, (context) => MapPage());
      router.route(SigninPage.path, (context) => SigninPage());
      router.route(SignoutPage.path, (context) => SignoutPage());
      router.route(NfcPage.path, (context) => NfcPage());
      router.route(MainPage.path, (context) => MainPage());
    });
