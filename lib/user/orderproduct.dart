import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mypets/api/service.dart';
import 'package:mypets/utils.dart';

class OrderProduct extends StatefulWidget {
   OrderProduct({Key? key,this.id}) : super(key: key);
 var id;
  @override
  _OrderProductState createState() => _OrderProductState();
}

class _OrderProductState extends State<OrderProduct> {
  TextEditingController quantity = TextEditingController();
  TextEditingController deliveryAddress = TextEditingController();
  @override
  void initState() {
    print(widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Utils.primaryColor,
        child: Column(
          children: [
            Utils.appBar("k", "Add Product", context),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: [
                    Utils.formField2(
                      quantity,
                      "Quantity",
                    ),
                    Utils.formField2(
                      deliveryAddress,
                      "Delivery Address",
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

  onTap() {
    ApiService().orderProduct(quantity.text, deliveryAddress.text,widget.id).then((value) {
      print(value);
      if(value["status"]=="success"){
        Fluttertoast.showToast(msg: "Order Created");
        Navigator.pop(context);
        Navigator.pop(context);
      }else{Fluttertoast.showToast(msg: "Error Creating Order");}
    });
  }
}
