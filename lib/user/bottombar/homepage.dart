import 'package:flutter/material.dart';
import 'package:mypets/api/service.dart';
import 'package:mypets/user/details.dart';
import 'package:mypets/utils.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getData();
    super.initState();
  }
  var data;
  getData(){
    ApiService().getAllProduct().then((value){
      data = value["data"];
      print(value["data"]);
      print(data.length);
      setState(() {
        isLoading = false;
      });

    });
  }
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.primaryColor,
      body: isLoading?Center(child: CircularProgressIndicator()):Container(
        decoration: BoxDecoration(color: Colors.transparent),
        padding: EdgeInsets.symmetric(),
        child: body(),
      ),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Utils.appBar("home", "My Pets", context),
          Text("Welcome",style: Utils.style2,),
          Text("Find A Perfect Partner For You",style: Utils.style2,),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Details(data:data[index],)));
                    },
                    child: Card(
                      color: Colors.black12,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical:5,horizontal: 8.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    "https://media.istockphoto.com/photos/group-of-pets-posing-around-a-border-collie-dog-cat-ferret-rabbit-picture-id1296353202?b=1&k=20&m=1296353202&s=170667a&w=0&h=PZjACFOzhvma6vorhg2TXRwrZwo6rHt4ttCTUctGZaQ=",
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${data[index]["name"]}",
                            style: TextStyle(color: Utils.secondaryColor),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${data[index]["price"]}",
                            style: TextStyle(color: Utils.secondaryColor),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
