import 'package:camera/camera.dart';
import 'package:date_app_team/core/language/localization/app_localization_setup.dart';
import 'package:date_app_team/core/notification/push_notification_function.dart';
import 'package:date_app_team/core/routes/routes.dart';
import 'package:date_app_team/features/authentication/bloc/auth_cubit.dart';
import 'package:date_app_team/features/chatting/bloc/chatting_provider.dart';
import 'package:date_app_team/features/edit_profile/bloc/editprofile_cubit.dart';
import 'package:date_app_team/features/edit_profile/bloc/editprofile_provider.dart';
import 'package:date_app_team/features/home/bloc/home_cubit.dart';
import 'package:date_app_team/features/home/bloc/home_provier.dart';
import 'package:date_app_team/features/language/bloc/language_cubit.dart';
import 'package:date_app_team/features/likematch/bloc/likematch_provider.dart';
import 'package:date_app_team/features/onboarding/bloc/onbording_cubit.dart';
import 'package:date_app_team/features/onboarding/bloc/onbording_provider.dart';
import 'package:date_app_team/features/onboarding/data/firebase/auth_firebase.dart';
import 'package:date_app_team/features/premium/bloc/premium_provider.dart';
import 'package:date_app_team/features/profile/bloc/profile_provider.dart';
import 'package:date_app_team/features/theme/bloc/lite_dark_cubit.dart';
import 'package:date_app_team/features/theme/bloc/lite_dark_state.dart';
import 'package:date_app_team/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'features/premium/bloc/premium_bloc.dart';
import 'features/profile/presentation/screen/profile_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  initPlatformState();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  loadFCM();
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => OnbordingCubit()),
        BlocProvider(create: (context) => LanguageCubit()),
        BlocProvider(create: (context) => HomePageCubit()),
        BlocProvider(create: (context) => EditProfileCubit()),
        BlocProvider(create: (context) => PremiumBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, theme) {
          return BlocBuilder<LanguageCubit, LanguageState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, languageState) {
              return MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                      create: (context) => ProfileProvider()),
                  ChangeNotifierProvider(
                      create: (context) => OnBordingProvider()),
                  ChangeNotifierProvider(
                      create: (context) => FirebaseAuthService()),
                  ChangeNotifierProvider(
                      create: (context) => EditProfileProvider()),
                  ChangeNotifierProvider(
                      create: (context) => PremiumProvider()),
                  ChangeNotifierProvider(
                      create: (context) => ChattingProvider()),
                  ChangeNotifierProvider(
                      create: (context) => LikeMatchProvider()),
                  ChangeNotifierProvider(create: (context) => HomeProvider()),
                ],
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  initialRoute: "/",
                  theme: theme.themeData,
                  navigatorKey: navigatorKey,
                  onGenerateRoute: Routes.onGenerateRoute,
                  supportedLocales: AppLocalizationSetup.supportedLanguage,
                  localizationsDelegates:
                      AppLocalizationSetup.localizationsDelegates,
                  localeResolutionCallback:
                      AppLocalizationSetup.localeResolutionCallback,
                  locale: languageState.locale,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
