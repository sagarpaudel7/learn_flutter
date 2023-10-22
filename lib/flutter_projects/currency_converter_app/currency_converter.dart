import 'package:flutter/material.dart';

// 1. create a variable to store the converted currency value
// 2. create a function that multiplies the values given by textfield with 132
// 3. store the vaalue in the variable that we ctreated
// 4. display the variable
class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  double result = 0;
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //👉👉 border variable banayeko reuse garna lai same thing
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
        width: 3,
        // style: BorderStyle.none
        style: BorderStyle.solid,
        strokeAlign: BorderSide.strokeAlignOutside,
      ),
      borderRadius: BorderRadius.all(Radius.circular(50)),
    );

    ////////////
    return Scaffold(
      backgroundColor: const Color(0xFFfcfcff),
      appBar: AppBar(
        backgroundColor: const Color(0xFFfcfcff),
        elevation: 0,
        title: const Center(
          child: Text(
            "Currency Converter",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Rs. ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              //padding
              //  it has a only one widgets.
              //container
              // it has a many more widgtes.
              TextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                decoration: const InputDecoration(
                  /*   label: Text(
                  "Please enter the amount in USD",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                )
              👉👉  label le widget linxa rw more customizable hunxa 
              ani label text le string so to style it use labelstyle
              both are not disapear when we click on filed
                ////////////
                    labelText: "Please enter the amount in USD",
                    labelStyle: TextStyle(
                      color: Colors.red,
                    )
                      */

                  hintText: "Please enter the amount in USD",
                  hintStyle: TextStyle(
                    color: Colors.blue,
                  ),
                  prefixIcon: Icon(
                    Icons.monetization_on_outlined,
                    color: Colors.red,
                  ),
                  filled: true,
                  fillColor: Colors.yellow,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 10,
              ),
              //button
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    result = double.parse(textEditingController.text) * 132;
                  });
                },
                /* 👉👉this is optional method to decorate button but it is hadder 
                
                 style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(Colors.black),
                  foregroundColor: const MaterialStatePropertyAll(Colors.white),
                  minimumSize:
                      const MaterialStatePropertyAll(Size(double.infinity, 50)),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),  */

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Convert",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              /* 👉👉 this is optional material button and it is more easy than other.
*/
              MaterialButton(
                onPressed: () {},
                color: Colors.red,
                minWidth: 50,
                height: 35,
                child: const Text(
                  "Converter",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
