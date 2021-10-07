import 'package:flutter/material.dart';
import 'package:mypets/admin/details.dart';
import 'package:mypets/admin/orderdetails.dart';
import 'package:mypets/api/admin_service.dart';
import 'package:mypets/utils.dart';

class OrdersReceived extends StatefulWidget {
  const OrdersReceived({Key? key}) : super(key: key);

  @override
  _OrdersReceivedState createState() => _OrdersReceivedState();
}

class _OrdersReceivedState extends State<OrdersReceived> {

  @override
  void initState() {
    super.initState();
  }

  var data = [
    {
      "quantity": 2,
      "status": "Pending",
      "_id": "1",
      "buyer": "Saurav",
      "product": "60c8581299cb5a13e44c2bce",
      "deliveryAddress": "Koteshwor",
      "totalPrice": 800,
      "createdAt": "2021-09-30T16:31:13.489Z",
      "updatedAt": "2021-09-30T16:31:13.489Z",
      "__v": 0
    },
    {
      "quantity": 2,
      "status": "Pending",
      "_id": "2",
      "buyer": "Saurav",
      "product": "60c8581299cb5a13e44c2bce",
      "deliveryAddress": "Thimi",
      "totalPrice": 7000,
      "createdAt": "2021-09-30T16:31:13.489Z",
      "updatedAt": "2021-09-30T16:31:13.489Z",
      "__v": 0
    },
    {
      "quantity": 8,
      "status": "Pending",
      "_id": "3",
      "buyer": "Saurav",
      "product": "60c8581299cb5a13e44c2bce",
      "deliveryAddress": "Sankhu",
      "totalPrice": 3000,
      "createdAt": "2021-09-30T16:31:13.489Z",
      "updatedAt": "2021-09-30T16:31:13.489Z",
      "__v": 0
    },
    {
      "quantity": 2,
      "status": "Pending",
      "_id": "1",
      "buyer": "Saurav",
      "product": "60c8581299cb5a13e44c2bce",
      "deliveryAddress": "Koteshwor",
      "totalPrice": 800,
      "createdAt": "2021-09-30T16:31:13.489Z",
      "updatedAt": "2021-09-30T16:31:13.489Z",
      "__v": 0
    },
    {
      "quantity": 2,
      "status": "Pending",
      "_id": "2",
      "buyer": "Saurav",
      "product": "60c8581299cb5a13e44c2bce",
      "deliveryAddress": "Thimi",
      "totalPrice": 7000,
      "createdAt": "2021-09-30T16:31:13.489Z",
      "updatedAt": "2021-09-30T16:31:13.489Z",
      "__v": 0
    },
    {
      "quantity": 8,
      "status": "Pending",
      "_id": "3",
      "buyer": "Saurav",
      "product": "60c8581299cb5a13e44c2bce",
      "deliveryAddress": "Sankhu",
      "totalPrice": 3000,
      "createdAt": "2021-09-30T16:31:13.489Z",
      "updatedAt": "2021-09-30T16:31:13.489Z",
      "__v": 0
    },
    {
      "quantity": 2,
      "status": "Pending",
      "_id": "1",
      "buyer": "Saurav",
      "product": "60c8581299cb5a13e44c2bce",
      "deliveryAddress": "Koteshwor",
      "totalPrice": 800,
      "createdAt": "2021-09-30T16:31:13.489Z",
      "updatedAt": "2021-09-30T16:31:13.489Z",
      "__v": 0
    },
    {
      "quantity": 2,
      "status": "Pending",
      "_id": "2",
      "buyer": "Saurav",
      "product": "60c8581299cb5a13e44c2bce",
      "deliveryAddress": "Thimi",
      "totalPrice": 7000,
      "createdAt": "2021-09-30T16:31:13.489Z",
      "updatedAt": "2021-09-30T16:31:13.489Z",
      "__v": 0
    },
    {
      "quantity": 8,
      "status": "Pending",
      "_id": "3",
      "buyer": "Saurav",
      "product": "60c8581299cb5a13e44c2bce",
      "deliveryAddress": "Sankhu",
      "totalPrice": 3000,
      "createdAt": "2021-09-30T16:31:13.489Z",
      "updatedAt": "2021-09-30T16:31:13.489Z",
      "__v": 0
    },
    {
      "quantity": 2,
      "status": "Pending",
      "_id": "1",
      "buyer": "Saurav",
      "product": "60c8581299cb5a13e44c2bce",
      "deliveryAddress": "Koteshwor",
      "totalPrice": 800,
      "createdAt": "2021-09-30T16:31:13.489Z",
      "updatedAt": "2021-09-30T16:31:13.489Z",
      "__v": 0
    },
    {
      "quantity": 2,
      "status": "Pending",
      "_id": "2",
      "buyer": "Saurav",
      "product": "60c8581299cb5a13e44c2bce",
      "deliveryAddress": "Thimi",
      "totalPrice": 7000,
      "createdAt": "2021-09-30T16:31:13.489Z",
      "updatedAt": "2021-09-30T16:31:13.489Z",
      "__v": 0
    },
    {
      "quantity": 8,
      "status": "Pending",
      "_id": "3",
      "buyer": "Saurav",
      "product": "60c8581299cb5a13e44c2bce",
      "deliveryAddress": "Sankhu",
      "totalPrice": 3000,
      "createdAt": "2021-09-30T16:31:13.489Z",
      "updatedAt": "2021-09-30T16:31:13.489Z",
      "__v": 0
    },
    {
      "quantity": 2,
      "status": "Pending",
      "_id": "1",
      "buyer": "Saurav",
      "product": "60c8581299cb5a13e44c2bce",
      "deliveryAddress": "Koteshwor",
      "totalPrice": 800,
      "createdAt": "2021-09-30T16:31:13.489Z",
      "updatedAt": "2021-09-30T16:31:13.489Z",
      "__v": 0
    },
    {
      "quantity": 2,
      "status": "Pending",
      "_id": "2",
      "buyer": "Saurav",
      "product": "60c8581299cb5a13e44c2bce",
      "deliveryAddress": "Thimi",
      "totalPrice": 7000,
      "createdAt": "2021-09-30T16:31:13.489Z",
      "updatedAt": "2021-09-30T16:31:13.489Z",
      "__v": 0
    },
    {
      "quantity": 8,
      "status": "Pending",
      "_id": "3",
      "buyer": "Saurav",
      "product": "60c8581299cb5a13e44c2bce",
      "deliveryAddress": "Sankhu",
      "totalPrice": 3000,
      "createdAt": "2021-09-30T16:31:13.489Z",
      "updatedAt": "2021-09-30T16:31:13.489Z",
      "__v": 0
    },
    {
      "quantity": 4,
      "status": "Pending",
      "_id": "4",
      "buyer": "Saurav",
      "product": "60c8581299cb5a13e44c2bce",
      "deliveryAddress": "Baneshwor",
      "totalPrice": 5000,
      "createdAt": "2021-09-30T16:31:13.489Z",
      "updatedAt": "2021-09-30T16:31:13.489Z",
      "__v": 0
    },
    {
      "quantity": 3,
      "status": "Pending",
      "_id": "5",
      "buyer": "Saurav",
      "product": "60c8581299cb5a13e44c2bce",
      "deliveryAddress": "Bhaktapur",
      "totalPrice": 6000,
      "createdAt": "2021-09-30T16:31:13.489Z",
      "updatedAt": "2021-09-30T16:31:13.489Z",
      "__v": 0
    },
    {
      "quantity": 5,
      "status": "Pending",
      "_id": "6",
      "buyer": "Saurav",
      "product": "60c8581299cb5a13e44c2bce",
      "deliveryAddress": "Kathmande",
      "totalPrice": 9000,
      "createdAt": "2021-09-30T16:31:13.489Z",
      "updatedAt": "2021-09-30T16:31:13.489Z",
      "__v": 0
    },
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black87),
        padding: EdgeInsets.symmetric(),
        child: body(),
      ),
    );
  }

  Widget body() {
    return Column(
      children: [
        Utils.appBar("home", "My Orders", context),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrderDetails(
                              data: data[index],
                            )));
                  },
                  child: Card(
                    color: Colors.black12,
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  "https://media.istockphoto.com/photos/group-of-pets-posing-around-a-border-collie-dog-cat-ferret-rabbit-picture-id1296353202?b=1&k=20&m=1296353202&s=170667a&w=0&h=PZjACFOzhvma6vorhg2TXRwrZwo6rHt4ttCTUctGZaQ=",
                                  height: 100,
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${data[index]["quantity"]}",
                          style: TextStyle(color: Utils.secondaryColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${data[index]["deliveryAddress"]}",
                          style: TextStyle(color: Utils.secondaryColor),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
