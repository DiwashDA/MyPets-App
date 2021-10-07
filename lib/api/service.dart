import 'package:dio/dio.dart';
import 'package:mypets/utils.dart';

class ApiService {

  Future login(String email, String password) async {
    var data = {"email": "$email", "password": "$password"};
    try {
      var response = await Dio().post(Utils.baseUrl + "users/login", data: data);
      Utils.saveToken(response.data['token']);
      return response.data;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future changePassword(oldPass, newPass, confirmPass) async {
    var data = {};
    var token = Utils.getToken();
    Dio dio = Dio();
    dio.options.headers["authorization"] = "Bearer ${token}";

    try {
      var response = await dio.patch(Utils.baseUrl + "users/login", data: data);
      print(response.data);
      return response.data;
    } on DioError catch (e) {
      return e;
    }
  }

  Future register(
      address, password, name, email, dob, contact) async {
    var data = {
      "address": "$address ",
      "password": "$password",
      "name": "$name",
      "email": "$email",
      "dob": "$dob",
      "contact": "$contact"

    };
    try {
      var response = await Dio().post(Utils.baseUrl + "users/register", data: data);
      print(response.statusCode);
      if (response.statusCode == 201) {
        print(response.statusCode);
        return response.statusCode;
      }
    } on DioError catch (e) {
      print(e.response);
      return e.response;
    }
  }

  // Future getAnProduct(id) async {
  //   Dio dio = Dio();
  //   var token = await Utils.getToken();
  //   dio.options.headers["authorization"] = "Bearer ${token}";
  //   try {
  //     var response = await dio.get(Utils.baseUrl + "applicants/$id");
  //     return response.data;
  //   } on DioError catch (e) {
  //     return e;
  //   }
  // }

  Future getAllProduct() async {
    Dio dio = Dio();
    var token = await Utils.getToken();
    dio.options.headers["authorization"] = "Bearer ${token}";
    try {
      var response = await dio.get(Utils.baseUrl + "products");
      return response.data;
    } on DioError catch (e) {
      return e;
    }
  }
  Future orderProduct(quantity,delivery,id)async{
    Dio dio = Dio();
    var token = await Utils.getToken();
    dio.options.headers["authorization"] = "Bearer ${token}";
    var data = {
    "quantity": "$quantity",
    "deliveryAddress": "$delivery"
    };
    try {
      var response = await dio.post(Utils.baseUrl+"products/$id/orders",data: data);
      print(response.statusCode);
      return response.data;
    } on DioError catch (e) {
      return e.response;
    }
  }
  Future getOrders() async {
    Dio dio = Dio();
    var token = await Utils.getToken();
    dio.options.headers["authorization"] = "Bearer ${token}";
    try {
      var response = await dio.get(Utils.baseUrl + "orders");
      return response.data;
    } on DioError catch (e) {
      return e;
    }
  }
  Future getOrder(id) async {
    Dio dio = Dio();
    var token = await Utils.getToken();
    dio.options.headers["authorization"] = "Bearer ${token}";
    try {
      var response = await dio.get(Utils.baseUrl + "orders/$id");
      return response.data;
    } on DioError catch (e) {
      return e;
    }
  }
}
