import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mypets/utils.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Utils.primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: Colors.black26,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        "https://media.istockphoto.com/photos/group-of-pets-posing-around-a-border-collie-dog-cat-ferret-rabbit-picture-id1296353202?b=1&k=20&m=1296353202&s=170667a&w=0&h=PZjACFOzhvma6vorhg2TXRwrZwo6rHt4ttCTUctGZaQ=",
                      ),
                    ),
                    Text("MY PETS",
                        style: TextStyle(
                            color: Utils.secondaryColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w900)),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      child: ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Icon(
                            Icons.lock_open,
                            color: Utils.secondaryColor,
                          ),
                        ),
                        title: Text(
                          "Change Password",
                          style: Utils.style,
                        ),
                        subtitle: Text(
                          "Set a new Password",
                          style: Utils.style,
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                          color: Utils.secondaryColor,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Icon(
                            Icons.power_settings_new,
                            color: Utils.secondaryColor,
                          ),
                        ),
                        title: Text("Log Out", style: Utils.style),
                        subtitle: Text(
                          "Log out from the application",
                          style: Utils.style,
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                          color: Utils.secondaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
