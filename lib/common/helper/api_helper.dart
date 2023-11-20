import 'package:http/http.dart' as http;


class ApiHelper{

  Future<http.Response> postData({required Map<String,dynamic>  data ,required Uri  url}) {
  return http.post(
    url,
    // headers: <String, String>{
      
    // },
    body: data
  );
}



   
}