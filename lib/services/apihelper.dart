import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  ApiService._();
  static ApiService apiService = ApiService._();

  Future fetchApiData() async {
    final response = await http.get(
      Uri.parse("http://raw.githubusercontent.com/bikashthapa01/myvideos-android-app/master/data.json"),
    );

    if (response.statusCode == 200) {
       return jsonDecode(response.body);
    } else {
        return "Error";// Return an empty Map instead of a List
    }
  }
}
