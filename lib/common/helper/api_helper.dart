import 'package:http/http.dart' as http;


class ApiHelper{

  Future<http.Response> postData({required Map<String,dynamic>  data ,required Uri  url}) {
    print(data);
    print(url);
  return http.post(
    url,
    headers: <String, String>{
       "Content-Type": "application/x-www-form-urlencoded",
    },
    body: data
  );
}



   
}