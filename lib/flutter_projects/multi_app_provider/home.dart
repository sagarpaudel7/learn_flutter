import 'package:flutter/material.dart';
import 'package:learn_flutter/constants.dart/appbar.dart';

class HomeScreenProvider extends StatefulWidget {
  const HomeScreenProvider({super.key});

  @override
  State<HomeScreenProvider> createState() => _HomeScreenProviderState();
}

class _HomeScreenProviderState extends State<HomeScreenProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Appbar.appBar("Multi App"),
      ),
      body: Column(
        children: [Text("data")],
      ),
    );
  }
}
