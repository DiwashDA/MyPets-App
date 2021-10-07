import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mypets/api/service.dart';
import 'package:mypets/utils.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Utils.primaryColor,
        child: Column(
          children: [
            Utils.appBar("k", "Register", context),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: [
                    Utils.formField2(
                      name,
                      "Name",
                    ),
                    Utils.formField2(
                      address,
                      "Address",
                    ),
                    Utils.formField2(
                      password,
                      "Password",
                    ),
                    Utils.formField2(
                      email,
                      "Email",
                    ),
                    Utils.formField2(
                      dob,
                      "DOB",
                    ),
                    Utils.formField2(
                      contact,
                      "Contact",
                    ),
                    Utils.button2(onTap, context, "Done", Colors.green),
                    SizedBox(height: 20,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  TextEditingController address = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController contact = TextEditingController();

  onTap() {
   ApiService().register(address.text, password.text, name.text, email.text, dob.text, contact.text).then((value){
     print(value);
     if(value==201){
       Fluttertoast.showToast(msg: "User Registered Successfully");
       Navigator.pop(context);
     }
     else{
       Fluttertoast.showToast(msg: "ERROR");
     }
   });
  }
}
