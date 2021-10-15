import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rabbito/controller/app_controller.dart';
import 'package:rabbito/global/exceptions.dart';
import 'package:rabbito/global/strings/request_strings.dart';
import 'package:rabbito/model/user.dart';

class LoginRegisterController extends GetxController {
  RxString _username = "".obs;
  RxString _password = "".obs;
  RxString _email = "".obs;
  RxString _error = "".obs;
  Rx<TextEditingController> rUsernameC = TextEditingController().obs;
  Rx<TextEditingController> rPasswordC = TextEditingController().obs;
  Rx<TextEditingController> rEmailC = TextEditingController().obs;

  Rx<TextEditingController> lUsernameC = TextEditingController().obs;
  Rx<TextEditingController> lPasswordC = TextEditingController().obs;
  login(String username, String password) async {
    try {
      checkUsername(username);
      checkPassword(password);
      print("******* login checks passed *******");
      Map<String, dynamic> result = await User.login(username, password);

      if (result[RequestStrings.status]) {
        AppController.appController.currUser =
            (result[RequestStrings.data] as User);
        //todo login successful
        _error.value = RequestStrings.successful;
      } else {
        _error.value = result[RequestStrings.message];
      }
      print("login_error: $_error");
    } on InvalidUsernameException catch (e) {
      _error.value = e.cause;
      print(e.cause);
    } on InvalidPasswordException catch (e) {
      _error.value = e.cause;
      print(e.cause);
    }
  }

  register(String username, String password, String email) async {
    try {
      checkUsername(username);
      checkPassword(password);
      checkEmail(email);
      print("******* register checks passed *******");
      Map<String, dynamic> result =
          await User.register(username, password, email);
      if (result[RequestStrings.status]) {
        //todo register successful
        AppController.appController.currUser =
            (result[RequestStrings.data] as User);
        _error.value = "successful";
        print(AppController.appController.currUser!.username);
      } else {
        _error.value = result[RequestStrings.message];
      }
      print("inside register result: "+result.toString());
      print("error: $_error");
    } on InvalidUsernameException catch (e) {
      _error.value = e.cause;
      print(e.cause);
    } on InvalidPasswordException catch (e) {
      _error.value = e.cause;
      print(e.cause);
    } on InvalidEmailException catch (e) {
      _error.value = e.cause;
      print(e.cause);
    }
  }

  RxString get error => _error;

  set error(RxString value) {
    _error = value;
  }

  RxString get username => _username;

  set username(RxString value) {
    _username = value;
  }

  RxString get password => _password;

  set password(RxString value) {
    _password = value;
  }

  RxString get email => _email;

  set email(RxString value) {
    _email = value;
  }

  void checkUsername(String username) {
    // char and digits allowed,
    Pattern pattern = r'^[A-Za-z0-9]+(?:[_][A-Za-z0-9]+)*$';
    RegExp regex = new RegExp(pattern.toString());
    if (!regex.hasMatch(username))
      throw InvalidUsernameException("username invalid : $username}");
  }

  void checkEmail(String email) {
    if (!EmailValidator.validate(email))
      throw InvalidEmailException("email invalid: $email");
  }

  void checkPassword(String password) {
    // must be at least 6 char and must have one digit and one char without space
    // sdsd2d -> correct
    Pattern pattern = r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
    RegExp regex = new RegExp(pattern.toString());
    if (!regex.hasMatch(password))
      throw InvalidPasswordException("password invalid : $password");
  }
}
