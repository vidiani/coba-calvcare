import 'package:calvcare/firebase_options.dart';
import 'package:calvcare/pages/cart.page.dart';
import 'package:calvcare/pages/checkout_page.dart';
import 'package:calvcare/pages/checkout_success_page.dart';
import 'package:calvcare/pages/detail_chat_page.dart';
import 'package:calvcare/pages/edit_profile_page.dart';
import 'package:calvcare/pages/home/main_page.dart';
import 'package:calvcare/pages/product_page.dart';
import 'package:calvcare/pages/sign_in_page.dart';
import 'package:calvcare/pages/sign_up_page.dart';
import 'package:calvcare/pages/splash_page.dart';
import 'package:calvcare/providers/auth_provider.dart';
import 'package:calvcare/providers/cart_provider.dart';
import 'package:calvcare/providers/page_provider.dart';
import 'package:calvcare/providers/product_provider.dart';
import 'package:calvcare/providers/transaction_provider.dart';
import 'package:calvcare/providers/wishlist_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => const MainPage(),
          '/edit-profile': (context) => EditProfilePage(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout-success': (context) => CheckoutSuccessPage(),
        },
      ),
    );
  }
}
