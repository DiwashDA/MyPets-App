import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mypets/admin/admindashboard.dart';
import 'package:mypets/api/service.dart';
import 'package:mypets/user/dashboard.dart';
import 'package:mypets/user/register.dart';
import 'package:mypets/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  nothing() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Utils.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Colors.black26,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      foregroundImage: NetworkImage(
                        "https://media.istockphoto.com/photos/group-of-pets-posing-around-a-border-collie-dog-cat-ferret-rabbit-picture-id1296353202?b=1&k=20&m=1296353202&s=170667a&w=0&h=PZjACFOzhvma6vorhg2TXRwrZwo6rHt4ttCTUctGZaQ=",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Utils.formField(username, "Email", Icon(Icons.person),
                        false, Validator.emailValidator),
                    formField(password, "Password", Icon(Icons.lock), true,
                        Validator.passValidator),
                    SizedBox(
                      height: 10,
                    ),
                    Utils.button(onTap, context),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "OR",
                        style: Utils.style,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Utils.button2(
                        onTap2, context, "Sign Up", Colors.blue.shade900)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  onTap2(){
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Register()));
  }

  onTap() {
    ApiService().login(username.text, password.text).then((value) {
      if(value['data']['user']['role']=="admin") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AdminDashboard()));
      }else{
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Dashboard()));
      }
    });

  }

  bool pressed = false;

  Widget formField(TextEditingController controller, String label, Widget icon,
      bool obs, Function(String) validator) {
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
              borderSide:
                  BorderSide(color: Colors.black, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(8.0),
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.remove_red_eye_outlined),
              color: pressed ? Colors.green : Colors.black,
              onPressed: () {
                setState(() {
                  pressed ? pressed = false : pressed = true;
                });
              },
            ),
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.black, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(8.0),
            ),
            labelText: label,
            labelStyle: TextStyle(color: Colors.black, fontSize: 18),
            prefixIcon: icon,
          ),

          obscureText: pressed ? false : true,
          //validator: validator,
        ),
      ),
    );
  }
}
