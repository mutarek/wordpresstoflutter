import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List> fetchWpPost() async {
  final response = await http.get(Uri.parse("https://dhakacity.com.bd/index.php/wp-json/wp/v2/posts?per_page=20"), headers: {
    "Accept": "application/json"
  });
  var convertedDatatoJson = jsonDecode(response.body);
  return convertedDatatoJson;
}

Future fetchWpPostImageUrl(href) async {
  final response = await http.get(Uri.parse(href), headers: {
    "Accept": "application/json"
  });
  var convertedDatatoJson = jsonDecode(response.body);
  return convertedDatatoJson;
}

Future<List> fetchWpCategory() async {
  final response = await http.get(Uri.parse("https://dhakacity.com.bd/wp-json/wp/v2/Categories/"), headers: {
    "Accept": "application/json"
  });
  var convertedDatatoJson = jsonDecode(response.body);
  return convertedDatatoJson;
}
