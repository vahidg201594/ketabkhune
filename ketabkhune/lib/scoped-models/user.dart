import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user.dart';

//https://api.myjson.com/bins/jb58f

class UserModel extends Model {
  bool _isEmailValid = true;
  List<String> _loggetInUserData = [];
  bool _isLoading = false;
  List _pdfDataList = [];

  bool get isEmailValid {
    return _isEmailValid;
  }

  List<String> get loggetInUserData {
    return _loggetInUserData;
  }

  bool get isLoadin {
    return _isLoading;
  }

  List get pdfDataList {
    return _pdfDataList;
  }

  void createNewUser(User user) async {
    String _setEmailAsKey = user.email;
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setStringList(
        _setEmailAsKey, [user.name, user.lastName, user.email, user.password]);
  }

  Future<bool> logIn(String email, String password) async {
    List<String> _loginData;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _loginData = prefs.getStringList(email);
    if (_loginData[3] == password) {
      loggedInUser(email);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> emailValidation(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(email)) {
      return true;
    } else {
      return false;
    }
  }

  void loggedInUser(String loggedInUserEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _loggetInUserData = prefs.getStringList(loggedInUserEmail);
    prefs.setStringList('logged_in_user', _loggetInUserData);
  }

  void logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('logged_in_user', null);
  }

  void fetchData() async {
    _isLoading = true;

    http.Response response =
        await http.get('https://api.myjson.com/bins/jb58f');
    List<dynamic> fetchData = json.decode(response.body);
    _pdfDataList = fetchData;
    _isLoading = false;
    notifyListeners();
  }
}
