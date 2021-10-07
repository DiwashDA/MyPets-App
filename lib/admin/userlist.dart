import 'package:flutter/material.dart';
import 'package:mypets/utils.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Utils.primaryColor,
        child:Column(
          children: [
            Utils.appBar("key", "Users", context),
            Expanded(
              child:ListView.builder(
                itemCount:5 ,
                itemBuilder: (context,index){
                  return Card();
                },
              )
            )
          ],
        ),
      ),
    );
  }
}
