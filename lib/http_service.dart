
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;


class HttpService {
  static Uri _uri = Uri.parse("https://lsuk.org/app/app.php"); ///also defined in httphelper


  static Future<dynamic> sendLatLng(String lat,String lng,String userID) async {
    try {
      var response = await http.post(
        _uri,
        body: {
          'update_location': '1',
          'lat': lat,
          'lng': lng,
          'ap_user_id': userID,

        },
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else
        return "";
    }
    catch (e) {
      print(e);
      return "";
    }
  }

}