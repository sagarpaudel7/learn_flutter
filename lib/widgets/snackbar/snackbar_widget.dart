import 'package:flutter/material.dart';
import 'package:learn_flutter/constants.dart/appbar.dart';
import 'package:learn_flutter/constants.dart/elevated_btn.dart';
import 'package:learn_flutter/widgets/snackbar/navigate_page.dart';

class SnackBarWidget extends StatelessWidget {
  const SnackBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //for prevent the SnackBar appear in next page when you navigate then use
    // return ScaffoldMessenger(child: Builder(builder: (context) {return Scaffold(...
    return Scaffold(
      appBar: Appbar.appBar("SnackBar Widget"),
      body: Center(
        child: Column(
          children: [
            const Spacer(
              flex: 2,
            ),
            const Text(
              "Hello there,",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Color(0xFF3700FF),
              ),
            ),
            const Spacer(),
            ElevatedBtn(
                text: "Simple SnackBar",
                onClicked: () {
                  final message = SnackBar(
                    content: const Text(
                      "Simple SnackBar",
                      textAlign: TextAlign.center,
                    ),
                    backgroundColor: Colors.deepOrange,
                    elevation: 5,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    duration: const Duration(seconds: 5),
                    action: SnackBarAction(
                      textColor: const Color(0xFF00FF3C),
                      label: "Dismiss",
                      onPressed: () {},
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(message);
                }),
            ElevatedBtn(
                text: "Action SnackBar",
                onClicked: () {
                  final message = SnackBar(
                    content: const Text(
                      "Action SnackBar",
                      textAlign: TextAlign.center,
                    ),
                    action: SnackBarAction(
                        label: "Next page",
                        textColor: Colors.red,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NavigatePage()));
                        }),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(message);
                }),
            ElevatedBtn(
                text: "Async SnackBar",
                onClicked: () async {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NavigatePage()));
                  const message = SnackBar(
                    content: Text(
                      "Async SnackBar",
                      textAlign: TextAlign.center,
                    ),
                  );
                  await Future.delayed(const Duration(seconds: 2));
                  ScaffoldMessenger.of(context).showSnackBar(message);
                }),
            ElevatedBtn(
                text: "Imp SnackBar",
                onClicked: () {
                  const message = SnackBar(
                    content: Text(
                      "Important SnackBar",
                      textAlign: TextAlign.center,
                    ),
                  );
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar() //can use ..removeCurrentSnackBar()
                    ..showSnackBar(message);
                }),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
