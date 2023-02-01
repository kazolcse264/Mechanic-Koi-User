import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mechanic_koi/pages/Login/login_screen.dart';
import 'package:mechanic_koi/pages/Signup/signup_screen.dart';
import 'package:mechanic_koi/pages/Welcome/welcome_screen.dart';
import 'package:mechanic_koi/pages/book_service_page.dart';
import 'package:mechanic_koi/pages/bottom_nav_bar_page.dart';
import 'package:mechanic_koi/pages/contact_us.dart';
import 'package:mechanic_koi/pages/home_page.dart';
import 'package:mechanic_koi/pages/launcher_page.dart';
import 'package:mechanic_koi/pages/offer_list_page.dart';
import 'package:mechanic_koi/pages/order_list_page.dart';
import 'package:mechanic_koi/pages/profile_page.dart';
import 'package:mechanic_koi/pages/settings.dart';
import 'package:mechanic_koi/pages/total_expenses_page.dart';
import 'package:mechanic_koi/providers/service_provider.dart';
import 'package:mechanic_koi/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'custom_widgets/bottom_nav_bar_wrapper_page.dart';
import 'utils/constants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [

      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) => ServiceProvider()),

    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mechanic Koi',
      theme: ThemeData(
        iconTheme: const IconThemeData(
          color: kPrimaryColor,
        ),
          primaryColor: kPrimaryColor,
          appBarTheme: const AppBarTheme(
            color: kPrimaryColor,
          ),
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0, backgroundColor: kPrimaryColor,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: kPrimaryLightColor,
            iconColor: kPrimaryColor,
            prefixIconColor: kPrimaryColor,
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          )),
      builder: EasyLoading.init(),
      initialRoute: LauncherPage.routeName,
      routes: {
        LoginScreen.routeName : (context) => const LoginScreen(),
        LauncherPage.routeName : (context) => const LauncherPage(),
        ProfilePage.routeName : (context) => const ProfilePage(),
        HomePage.routeName : (context) => const HomePage(),
        SettingsPage.routeName : (context) => const SettingsPage(),
        // BottomNavBarPage.routeName : (context) =>  BottomNavBarPage(),
        BottomNavBarPageWrapper.routeName : (context) =>  BottomNavBarPageWrapper(),
        OrderListPage.routeName : (context) => const OrderListPage(),
        WelcomeScreen.routeName : (context) => const WelcomeScreen(),
        SignUpScreen.routeName : (context) => const SignUpScreen(),
        BookServicePage.routeName : (context) => const BookServicePage(),
        OfferListPage.routeName : (context) => const OfferListPage(),
        ContactUsPage.routeName : (context) => const ContactUsPage(),
        TotalExpensesPage.routeName : (context) =>  const TotalExpensesPage(),
      },
    );
  }
}
