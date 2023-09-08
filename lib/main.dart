import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hash_ecommerce_user_sideapp/constants/constants.dart';
import 'package:hash_ecommerce_user_sideapp/constants/logics/address/address_provider.dart';
import 'package:hash_ecommerce_user_sideapp/constants/logics/cart/cart_provider.dart';
import 'package:hash_ecommerce_user_sideapp/constants/logics/logics.dart';
import 'package:hash_ecommerce_user_sideapp/constants/logics/pallettprovider.dart';
import 'package:hash_ecommerce_user_sideapp/constants/logics/product_details_provider/product_details_provider.dart';
import 'package:hash_ecommerce_user_sideapp/constants/order/orderprovider.dart';
import 'package:hash_ecommerce_user_sideapp/firebase_options.dart';
import 'package:hash_ecommerce_user_sideapp/screens/splash_screen/splashscreen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(2400, 1080),
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Logics(),
          ),
          ChangeNotifierProvider(
            create: (context) => PaletteProvider(),
          ),
          ChangeNotifierProvider<ProductDetailProvider>(
            create: (context) => ProductDetailProvider(),
          ),
          ChangeNotifierProvider<CartProvider>(
            create: (context) => CartProvider(),
          ),
           ChangeNotifierProvider<AddressProvider>(
            create: (context) => AddressProvider(),
          ),
          ChangeNotifierProvider<OrdersProvider>(
            create: (context) => OrdersProvider(),
          ),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: kPrimaryColor,
            textTheme:
                GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(
              bodyColor: kTextColor,
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ).copyWith(
            useMaterial3: true,
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
