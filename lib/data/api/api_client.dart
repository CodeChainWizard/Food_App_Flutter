import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  late String appBarUrl;

  late Map<String, String> _mainHeader;

  ApiClient({required this.appBarUrl}) {
    baseUrl = appBarUrl;
    timeout = Duration(seconds: 30);
    token = "";

    _mainHeader = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  //---- Get Method
  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusText: e.toString(), statusCode: 1);
    }
  }


}
