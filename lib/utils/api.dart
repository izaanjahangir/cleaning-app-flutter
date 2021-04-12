import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static const String BASE_URL = "https://izaan-cleaning-app.herokuapp.com/api";

  static Future createStripeUser(String email, String name) async {
    Uri url = Uri.parse(BASE_URL + "/create-customer");
    Map body = {"email": email, "name": name};
    Map<String, String> headers = {"Content-type": "application/json"};

    http.Response response =
        await http.post(url, headers: headers, body: jsonEncode(body));
    print(response.body);

    dynamic json = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return json;
    } else {
      throw {"message": json["message"]};
    }
  }
}
