import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  static Color primaryColor = Colors.black87;
  static Color secondaryColor = Colors.white38;
  static const baseUrl ="https://my-pets-ecommerce.herokuapp.com/";

  static Widget bgImage(context) {
    return Image.asset(
      'assets/home.jpg',
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      fit: BoxFit.cover,
    );
  }

  static saveToken(value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("token", value);
  }

  static Future getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("token");
  }

  static Widget appBar(String key, String title, BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(color: Colors.white70),),
      leading: (key != "home")
          ? IconButton(onPressed: () {
        Navigator.pop(context);
      }, icon: Icon(Icons.arrow_back, color: Utils.secondaryColor,))
          : Container(),
      leadingWidth: (key == "home") ? 10 : 40,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: false,
    );
  }

  static Color white = Colors.white;
  static Color color = Colors.black.withOpacity(0.5);

  static Widget formField2(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.6),
            focusColor: Colors.black,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(8.0),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(8.0),
            ),
            labelText: label,
            labelStyle: TextStyle(color: Colors.black, fontSize: 18),
          ),
          //validator: validator,
        ),
      ),
    );
  }
  static Widget formField(TextEditingController controller, String label,
      Widget icon, bool obs, Function(String) validator) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.6),
            focusColor: Colors.black,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(8.0),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(8.0),
            ),
            labelText: label,
            labelStyle: TextStyle(color: Colors.black, fontSize: 18),
            prefixIcon: icon,
          ),
          obscureText: obs,
          //validator: validator,
        ),
      ),
    );
  }

  static TextStyle style = TextStyle(color: Utils.secondaryColor);

  static TextStyle style2 = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w800, color: Utils.secondaryColor);

  static button(onTap, context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            'Log In',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
  static button2(onTap, context,label,Color color) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class Validator {
  static String emailValidator(String email) {
    if (RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email)) {
      return "";
    } else {
      return "Invalid Email !";
    }
  }

  static String passValidator(String password) {
    if (password.isEmpty) {
      return "Required ";
    } else if (password.length < 6) {
      return "Password should be 6 characters long";
    } else if (password.length > 15) {
      return "Password should not be greater than 15 characters";
    } else
      return "";
  }
}
