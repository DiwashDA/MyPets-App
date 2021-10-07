import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mypets/admin/admindashboard.dart';
import 'package:mypets/api/admin_service.dart';
import 'package:mypets/api/service.dart';
import 'package:mypets/utils.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController name = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController breed = TextEditingController();

  // TextEditingController name = TextEditingController();
  // TextEditingController name = TextEditingController();
  // TextEditingController name = TextEditingController();
  File imageFile = File("image");

  Future _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  Future _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.primaryColor,
      body: Container(
        child: Column(
          children: [
            Utils.appBar("home", "Add Product", context),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.grey)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.image,
                                color: Utils.secondaryColor,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Picture',
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.white),
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  iconSize: 30.0,
                                  icon: Icon(
                                    Icons.image_search,
                                    color: Utils.secondaryColor,
                                  ),
                                  onPressed: _getFromGallery,
                                ),
                              ),
                              IconButton(
                                iconSize: 30.0,
                                icon: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Utils.secondaryColor,
                                ),
                                onPressed: _getFromCamera,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    imageFile == null
                        ? Container(
                            color: Colors.grey.withOpacity(0.5),
                            height: 150,
                            width: 150,
                            child: Center(
                                child: Icon(
                              Icons.person_outline,
                              size: 150,
                            )),
                          )
                        : ClipRRect(
                            child: Container(
                                height: 200,
                                width: 200,
                                child: Image.file(
                                  imageFile,
                                  fit: BoxFit.fill,
                                ))),
                    Utils.formField2(
                      name,
                      "Name",
                    ),
                    Utils.formField2(
                      desc,
                      "Description",
                    ),
                    Utils.formField2(
                      price,
                      "Price",
                    ),
                    Utils.formField2(
                      breed,
                      "Breed",
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
    AdminService().addProduct(name.text, desc.text, breed.text, price.text).then((value) {
      print(value);
      if(value["status"]=="success"){
        Fluttertoast.showToast(msg: "Product created successfully");
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AdminDashboard()));
      }else{Fluttertoast.showToast(msg: "Error Creating Product");}
    });
  }
}
