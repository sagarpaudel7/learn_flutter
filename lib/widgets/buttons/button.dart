import 'package:flutter/material.dart';
import 'package:learn_flutter/constants.dart/appbar.dart';
import 'package:learn_flutter/constants.dart/heading_text.dart';

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar.appBar("Button Types"),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeadingText.headingTetx("Material Button"),
              //========== Material Button ============
              MaterialButton(
                onPressed: () {},
                height: 40,
                minWidth: 100,
                elevation: 5,
                color: Colors.deepPurple,
                textColor: Colors.white,
                splashColor: Colors.deepOrange,
                highlightColor: Colors.green,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: const Text("Button"),
              ),
              const Divider(
                thickness: 5,
                color: Colors.blue,
              ),
              //============ Elevated Button =============
              HeadingText.headingTetx("Elevated Button"),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all<Color>(Colors.blue),
                    //    backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Background color
                    //     foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      //    side: BorderSide(color: Colors.blue, width: 2.0),
                    )),
                    elevation: MaterialStateProperty.all<double>(4.0)),
                child: const Text("Button"),
              ),
              //=========== for elevated icon============
              ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.ads_click), label: const Text("Elevated icon")),
              const Divider(
                thickness: 5,
                color: Colors.blue,
              ),
              //=============Floating Action Button =======
              HeadingText.headingTetx("Floating Action Button"),
              FloatingActionButton(
                onPressed: () {},
                splashColor: Colors.blue,
                //  shape: CircleBorder(side: BorderSide()),
                child: const Icon(Icons.send),
              ),
              //=============Outlined Button ==============
              const Divider(
                thickness: 5,
                color: Colors.blue,
              ),
              HeadingText.headingTetx("Outline Button"),
              OutlinedButton(
                onPressed: () {},
                style: ButtonStyle(
                  side: MaterialStateProperty.all<BorderSide>(BorderSide(color: Colors.blue, width: 2)),
                ),
                child: const Text("Button"),
              ),
              //=============Icon Button =================
              const Divider(
                thickness: 5,
                color: Colors.blue,
              ),
              HeadingText.headingTetx("Icon Button"),
              IconButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    side: MaterialStateProperty.all<BorderSide>(BorderSide(color: Colors.blue, width: 2)),
                    //    shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
                  ),
                  icon: const Icon(Icons.call)),
              //=============Text Button =================
              const Divider(
                thickness: 5,
                color: Colors.blue,
              ),
              HeadingText.headingTetx("Text Button"),
              TextButton(
                  onPressed: () {},
                  style: ButtonStyle(side: MaterialStateProperty.all<BorderSide>(const BorderSide(color: Colors.blue, width: 2))),
                  child: const Text("Button")),
              //=============Dropdown Button ===============
              const Divider(
                thickness: 5,
                color: Colors.blue,
              ),
              HeadingText.headingTetx("DropDown Button"),
              DropdownButton(items: [], iconDisabledColor: Colors.blue, onChanged: (value) {}),
              //======= =====PopUp Menu Button =============
              const Divider(
                thickness: 5,
                color: Colors.blue,
              ),
              HeadingText.headingTetx("Popup Button"),
              PopupMenuButton(itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    value: "Option1",
                    child: Text("Option 1"),
                  )
                ];
              })
            ],
          ),
        ),
      ),
    );
  }
}
