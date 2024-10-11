import 'package:date_app_team/features/authentication/presentation/screens/auth_screen.dart';
import 'package:date_app_team/features/authentication/presentation/screens/login_screen.dart';
import 'package:date_app_team/features/edit_profile/presentation/screen/edit_screen.dart';
import 'package:date_app_team/features/onboarding/presentation/screens/onbording_screens.dart';
import 'package:date_app_team/features/plan/presentation/screen/plan_screen.dart';
import 'package:date_app_team/features/premium/presentation/screen/premium_screen.dart';
import 'package:date_app_team/features/profile/presentation/screen/block_screen.dart';
import 'package:date_app_team/features/profile/presentation/screen/faq_screen.dart';
import 'package:date_app_team/features/profile/presentation/screen/profile_privacy_screen.dart';
import 'package:date_app_team/features/splash/presentation/screens/splash_screen.dart';
import 'package:date_app_team/features/step_account/presentation/screens/create_step_screen.dart';
import 'package:date_app_team/widget/bottom_bar.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return CupertinoPageRoute(builder: (_) => const SplashScreen());

      case "/OnBoardingScreen":
        return CupertinoPageRoute(builder: (_) => const OnBoardingScreen());

      case "/recoverEmail":
        return CupertinoPageRoute(builder: (_) => Container());

      case "/creatSteps":
        return CupertinoPageRoute(builder: (_) => const CreateStepScreen());

      case "/authScreen":
        return CupertinoPageRoute(builder: (_) => const AuthScreen());
      case "/login":
        return CupertinoPageRoute(builder: (_) => const LoginScreen());
      case "/bottombar":
        return CupertinoPageRoute(builder: (_) => const BottomBar());
      case "/faqScreen":
        return CupertinoPageRoute(builder: (_) => const FaqScreen());
      case "/editScreen":
        return CupertinoPageRoute(builder: (_) => const EditScreen());
      case "/planScreen":
        return CupertinoPageRoute(builder: (_) => const PlanScreen());
      case "/premiumScreen":
        return CupertinoPageRoute(builder: (_) => const PremiumScreen());
      case "/profilePrivacyScreen":
        return CupertinoPageRoute(builder: (_) => const ProfilePrivacyScreen());
      case "/blockScreen":
        return CupertinoPageRoute(builder: (_) => const BlockScreen());

      default:
        return CupertinoPageRoute(builder: (_) => Container());
    }
  }
}
