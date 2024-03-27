import 'package:http/http.dart' as http;

Future<http.Response> get(String url, {Map<String, String>? headers}) async {
  return http.get(Uri.parse(url), headers: headers);
}

Future<http.Response> post(String url,
    {Map<String, String>? headers, dynamic body}) async {
  return http.post(Uri.parse(url), headers: headers, body: body);
}

Future<http.Response> put(String url,
    {Map<String, String>? headers, dynamic body}) async {
  return http.put(Uri.parse(url), headers: headers, body: body);
}

Future<http.Response> delete(String url, {Map<String, String>? headers}) async {
  return http.delete(Uri.parse(url), headers: headers);
}

Future<http.Response> patch(String url,
    {Map<String, String>? headers, dynamic body}) async {
  return http.patch(Uri.parse(url), headers: headers, body: body);
}
