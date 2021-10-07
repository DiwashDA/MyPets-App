import 'package:flutter/material.dart';
import 'package:mypets/user/orderproduct.dart';
import 'package:mypets/utils.dart';

class Details extends StatefulWidget {
  Details({Key? key, required this.data}) : super(key: key);
  Map data;

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  void initState() {
    print(widget.data["_id"]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderProduct(id: widget.data["_id"],)));
          },
          child: Container(
            alignment: Alignment.center,
            color: Utils.primaryColor,
            height: 60,
            child: Row(
              children: [
                const SizedBox(
                  width: 50,
                ),
                Icon(
                  Icons.shopping_cart_outlined,
                  color: Utils.secondaryColor,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Text(
                  "Order Now",
                  style: Utils.style,
                )),
                Text(
                  "Price : ${widget.data["price"]}",
                  style: Utils.style,
                ),
                const SizedBox(
                  width: 100,
                ),
              ],
            ),
          )),
      body: Container(
        color: Utils.primaryColor,
        child: Column(
          children: [
            Utils.appBar("key", "", context),
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
                  ListTile(
                    title: Text(
                      "${widget.data["name"]}",
                      style: TextStyle(color: Utils.secondaryColor),
                    ),
                  ),
                  ExpansionTile(
                    iconColor: Utils.secondaryColor,
                    title: Text(
                      "Description",
                      style: TextStyle(color: Utils.secondaryColor),
                    ),
                    children: [
                      Text(
                        "${widget.data["description"]}",
                        style: Utils.style,
                      )
                    ],
                  ),
                  ListTile(
                    title: Text(
                      "Breed",
                      style: TextStyle(color: Utils.secondaryColor),
                    ),
                    subtitle: Text(
                      "${widget.data["breed"]}",
                      style: TextStyle(color: Utils.secondaryColor),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Price",
                      style: TextStyle(color: Utils.secondaryColor),
                    ),
                    subtitle: Text("${widget.data["price"]}",
                        style: TextStyle(color: Utils.secondaryColor)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
