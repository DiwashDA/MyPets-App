import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mypets/utils.dart';

class OrderDetails extends StatefulWidget {
   OrderDetails({Key? key,this.data}) : super(key: key);
  var data;
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Utils.primaryColor,
        child: Column(
          children: [
            Utils.appBar("key", "", context),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  width: 20,
                ),
                const SizedBox(
                  width: 30,
                ),
              ],
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          "https://media.istockphoto.com/photos/group-of-pets-posing-around-a-border-collie-dog-cat-ferret-rabbit-picture-id1296353202?b=1&k=20&m=1296353202&s=170667a&w=0&h=PZjACFOzhvma6vorhg2TXRwrZwo6rHt4ttCTUctGZaQ=",
                        )),
                  ),
                  ExpansionTile(
                    iconColor: Utils.secondaryColor,
                    title: Text(
                      "Description",
                      style: TextStyle(color: Utils.secondaryColor),
                    ),
                    children: [
                      Text(
                        "asdadassdadasdasdasdasdasdassdasdassdasdasdaaaaaaaaaaaaaaaadddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd",
                        style: Utils.style,
                      )
                    ],
                  ),
                  ListTile(
                    title: Text("Quantity",style: Utils.style,),
                    subtitle: Text(widget.data["quantity"].toString(),style: Utils.style,),
                  ),
                  ListTile(
                    title: Text("Buyer",style: Utils.style,),
                    subtitle: Text(widget.data["buyer"].toString(),style: Utils.style,),
                  ),
                  ListTile(
                    title: Text("Delivery Address",style: Utils.style,),
                    subtitle: Text(widget.data["deliveryAddress"].toString(),style: Utils.style,),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
