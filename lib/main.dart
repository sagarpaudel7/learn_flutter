import 'package:flutter/material.dart';
import 'package:learn_flutter/learn_provider/counter_app/provider/counter_provider.dart';
import 'package:learn_flutter/learn_provider/login_api_provider/auth_provider/login_api_provider.dart';
import 'package:learn_flutter/learn_provider/opacity_changer_app/provider/opacity_provider.dart';
import 'package:learn_flutter/learn_provider/wishlist_app/provider/wishlist_provider.dart';
import 'package:learn_flutter/shared_preference/shared_preference_demo.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const LearnFlutter());
}

class LearnFlutter extends StatelessWidget {
  const LearnFlutter({super.key});
  @override
  Widget build(BuildContext context) {
    //................................................
    //for single provider
    //  return ChangeNotifierProvider(
    // create: (context) => CounterProvider(),
    // child: MaterialApp()
    //for multiple provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OpacityProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteProder(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginApiProvider(),
        ),
      ],
      //..............................................
      child: MaterialApp(
        title: "Shoes Shop",
        debugShowCheckedModeBanner: false,
        //  theme: ThemeData.dark( *for weather app
        //👉👉 ColumnIdea Project
        //  home:const ColumnIdeas(),
        //👉👉 Currency Converter App
        // home:const CurrencyConverter(),
        //👉👉 Weather App with API
        theme: ThemeData(
          ///////////
          fontFamily: "noto",
          /////////////
          primaryColor: const Color(0xFFE3480B), //use as required

          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0Xffff5f1f),
            primary: const Color(0xFFE3480B), //use as required
          ),
          ////////////
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          //////////
          textTheme: const TextTheme(
            bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.red,
            ),
            //////////////
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            /////////////
            titleLarge: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            //////////////
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            prefixIconColor: Color(0xFF848484),
          ),
          //////////////
          useMaterial3: true,
        ),
//...................................................
        //  home: const WeatherApp(),
        //👉👉 Shoes App
        /* home: ProductDetail(
        product: products[0],
      ),*/
        // home: const ShoesShop(),
        // home: const SetstateDemo(),
        // home: const CounterExample(),
        // home: const OpacitySlider(),
        //home: const WishlistDemo(),
        // home: const LoginScreen(),

//==========Self UI Challenges 😅😁 =============
        // home: const CurveContainerChallenge(), //create curve container
        //home: const GlassMorphismDemo(), //for glass effects
        //home: const NeomorphismDemo(),

//================ Animations ====================
        //home: const HeroAnimation(), //hero animation
//========= WIDGETS =============
        //home: const StackWidgets(), //stack widget
        // home: const ListExamples(), //ListView,builder & seperated
        //home: const CardDemo(),
        // home: const ListTileDemo(),
        //home: const GridViewDemo(),
        // home: const ResponsiveLayout(), //learn about create responsive widget
        //home: const SliverAppbarDemo(),
        //home: const DrawerDemo(),
        // home: const ButtonDemo(),//all types of button
        //home: const RichTextDemo(),
        //home: const SwitchWidget(),
        //home: const FractionSizeboxWidget(),
        //home: const RadioButtonWidget(),
        //home: const CheckBoxWidget(),
        //home: const ExpansionTileWidget(),
        //home: const StreamBuilderWidget(),
        //home: const FutureBuilderWidget(),
        //home: const SnackBarWidget(),
        home: const SharedPreferenceDemo(),
      ),
    );
  }
}
