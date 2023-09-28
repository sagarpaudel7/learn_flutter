import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class LoginApiProvider with ChangeNotifier {
//for password visiblity
  bool _obsecureText = true;
  bool get obsecureText => _obsecureText;
  void getSecure(bool value) {
    _obsecureText = !value;
    notifyListeners();
  }

  //for loading
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void login(String email, String password) async {
    setLoading(true);

    try {
      Response response = await post(Uri.parse('https://jsonplaceholder.typicode.com/users'), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        print("Successful");
        setLoading(false);
      } else {
        // If the response is not successful, set loading to false after a delay
        await Future.delayed(const Duration(seconds: 60), () {
          setLoading(false);
          print("Loading time exceeded 10 seconds.");
        });
      }
    } catch (e) {
      print(e.toString());
      setLoading(false);
    }
  }
}
