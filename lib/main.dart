import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unimate/screens/categories/categories.dart';
import 'package:unimate/screens/groups/group_screen.dart';
import 'package:unimate/screens/home.dart';
import 'package:unimate/screens/homescreen/home_screen.dart';
import 'package:unimate/screens/homescreen/new_post.dart';
import 'package:unimate/screens/authentication/login.dart';
import 'package:unimate/screens/authentication/signup.dart';
import 'package:unimate/screens/resources/resource_screen.dart';
import 'package:unimate/screens/resources/resources.dart';
import 'package:unimate/screens/profile/profile.dart';
import 'models/user_model.dart';
import 'screens/authentication/verification.dart';
import 'screens/comment_screen.dart';
import 'screens/authentication/get_started.dart';
import 'services/user_service.dart';
import 'theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final dio = Dio();
SharedPreferences? prefs;
UserModel? user;

Future<bool> myInitApp() async {
  prefs = await SharedPreferences.getInstance();
  user = await UserAuthentication.getLoggedUser();
  return true;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await myInitApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: getScreen(),
        routes: {
          '/homescreen': (context) => const HomeScreen(),
          '/newpost': (context) => const NewPost(),
          '/comments': (context) => const CommentPage(),
          '/resources': (context) => const ResourcesPage(),
          '/resource': (context) => const ResourceScreen(),
          '/groups': (context) => const GroupScreen(),
          '/profile': (context) => const ProfileTap(),
          '/categories': (context) => const Categories(),
          '/home': (context) => const PageHandler(),
          '/signup': (context) => const SignUpForm(),
          '/login': (context) => const LoginForm(),
          '/verification': (context) => const Verification(),
          '/getstarted': (context) => const GetStarted(),
          '/group_overview': (context) => const GroupScreen()
        },
        theme: AppTheme.customTheme());
  }

  Widget getScreen() {
    if (user == null) {
      return const GetStarted();
    }
    return const PageHandler();
  }
}
