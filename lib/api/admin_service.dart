import 'package:dio/dio.dart';
import 'package:mypets/utils.dart';

class AdminService {

  Future getAllProduct() async {
    Dio dio = Dio();
    var token = await Utils.getToken();
    dio.options.headers["authorization"] = "Bearer ${token}";
    try {
      var response = await dio.get(Utils.baseUrl + "admin/products");
      return response.data;
    } on DioError catch (e) {
      return e;
    }
  }
  Future getProduct(id) async {
    Dio dio = Dio();
    var token = await Utils.getToken();
    dio.options.headers["authorization"] = "Bearer ${token}";
    try {
      var response = await dio.get(Utils.baseUrl + "admin/products/$id");
      print(response.data);
      return response.data['data']['data'];
    } on DioError catch (e) {
      return e;
    }
  }
  Future addProduct(name,description,breed,price)async{
    var data = {
      "name":"$name",
      "description":"$description",
      "breed":"$breed",
      "price":"$price",
    };
    FormData formData = FormData.fromMap(data);
    Dio dio = Dio();
    var token = await Utils.getToken();
    dio.options.headers["authorization"] = "Bearer ${token}";
    try {
      var response = await dio.post("https://my-pets-ecommerce.herokuapp.com/admin/products",data: formData);
      return response.data;
    } on DioError catch (e) {
      return e.response;
    }
  }
  Future updateProduct(name,description,breed,price,image)async{
    var data = {
      "name":"$name",
      "description":"$description",
      "breed":"$breed",
      "price":"$price",
    };
    Dio dio = Dio();
    var token = await Utils.getToken();
    dio.options.headers["authorization"] = "Bearer ${token}";
    try {
      var response = await dio.patch(Utils.baseUrl + "admin/products",data: data);
      print(response.data);
      return response.data['data']['data'];
    } on DioError catch (e) {
      return e;
    }
  }
  Future deleteProduct(id)async{
    Dio dio = Dio();
    var token = await Utils.getToken();
    dio.options.headers["authorization"] = "Bearer ${token}";
    try {
      var response = await dio.post(Utils.baseUrl + "admin/products/$id");
      print(response.data);
      return response.data['data']['data'];
    } on DioError catch (e) {
      return e;
    }
  }

  Future getOrders()async{
    Dio dio = Dio();
    var token = await Utils.getToken();
    dio.options.headers["authorization"] = "Bearer ${token}";
    try {
      var response = await dio.get(Utils.baseUrl + "admin/orders");
      return response.data;
    } on DioError catch (e) {
      return e;
    }
  }
  Future getOrder(id)async{
    Dio dio = Dio();
    var token = await Utils.getToken();
    dio.options.headers["authorization"] = "Bearer ${token}";
    try {
      var response = await dio.get(Utils.baseUrl + "admin/orders/$id");
      print(response.data);
      return response.data['data'];
    } on DioError catch (e) {
      return e;
    }
  }

}
