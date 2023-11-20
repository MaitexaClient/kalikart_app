import 'package:kalicart/common/helper/api_helper.dart';
import 'package:kalicart/common/utils/api_constants.dart';

class ApiService {
  final _apiHelper = ApiHelper();

  //sign up
  Future<void> signUp(
      {String? name, String? email, String? confirmPassword}) async {
    final url = Uri.parse(ApiConstant.baseUrl + ApiConstant.signUp);

    final data = {'name': name, 'email': email, 'password': confirmPassword};

    var response = await _apiHelper.postData(data: data, url: url);

    if(response.statusCode !=  200){

      throw 'Somthing  went wrong';

    }


  }
}
