import 'package:flutter/material.dart';
import 'package:learn_flutter/flutter_projects/currency_converter_app/currency_converter.dart';
import 'package:learn_flutter/flutter_ideas/column_ideas.dart';
import 'package:learn_flutter/flutter_projects/shoes_shop/global_pro_variable.dart';
import 'package:learn_flutter/flutter_projects/shoes_shop/home_page.dart';
import 'package:learn_flutter/flutter_projects/shoes_shop/product_detail.dart';
import 'package:learn_flutter/flutter_projects/weather_app/weather_app.dart';
import 'package:learn_flutter/flutter_ideas/setstate.dart';
import 'package:learn_flutter/learn_provider/provider/counter_provider.dart';
import 'package:learn_flutter/learn_provider/provider/opacity_provider.dart';
import 'package:learn_flutter/learn_provider/provider/wishlist_provider.dart';
import 'package:learn_flutter/learn_provider/screens/counter_example.dart';
import 'package:learn_flutter/learn_provider/screens/opacity_slider.dart';
import 'package:learn_flutter/learn_provider/screens/wish_example/wishlist_demo.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const LearnFlutter());
}

class LearnFlutter extends StatelessWidget {
  const LearnFlutter({super.key});
  @override
  Widget build(BuildContext context) {
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
      ],
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

        //  home: const WeatherApp(),
        //👉👉 Shoes App
        /* home: ProductDetail(
        product: products[0],
      ),*/
        //  home: const ShoesShop(),
        // home: const SetstateDemo(),
        // home: const CounterExample(),
        // home: const OpacitySlider(),
        home: const WishlistDemo(),
      ),
    );
  }
}
