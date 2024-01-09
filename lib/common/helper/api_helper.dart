import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiHelper {
  Future<http.Response> postData(
      {required Map<String, dynamic> data, required Uri url}) {
    print(data);
    print(url);
    return http.post(url,
        headers: <String, String>{
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: data);
  }

  Future<http.Response> postDataWithOutBody({required Uri url}) {
    print(url);
    return http.post(
      url,
      headers: <String, String>{
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );
  }

  Future<http.Response> getData({required Uri url}) {
    print(url);
    return http.get(
      url,
      headers: <String, String>{
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );
  }

  Future<http.Response> putData({required Uri url}) {
    print(url);
    return http.put(
      url,
      headers: <String, String>{
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );
  }

  //update data with body
  Future<http.Response> putDataWithBody(
      {required Uri url, required Map<String, dynamic> data}) {
    print(url);
    return http.put(url,
        headers: <String, String>{
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: data);
  }

  Future<http.Response> deleteData({required Uri url}) {
    return http.delete(
      url,
      headers: <String, String>{
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );
  }

  //add payment

  Future<http.Response> paymentPost({required String userName,required String password,required Map<String,dynamic>  data}) {
  

    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$userName:$password'))}';
    return  http.post(
      Uri.https(
          "api.razorpay.com", "v1/orders"), 
      headers: <String, String>{
        "Content-Type": "application/json",
        'authorization': basicAuth,
      },
      body: jsonEncode(data),
    );
  }
}
