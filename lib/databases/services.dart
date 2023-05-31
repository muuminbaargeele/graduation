import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> login(String username, String password) async {
  final url =
      'http://192.168.1.3/backEnd/login.php'; // Replace with your API endpoint

  try {
    final response = await http.post(
      Uri.parse(url),
      body: {
        'Username': username,
        'Password': password,
      },
    );

    if (response.statusCode == 200) {
      // Successful login
      final responseData = jsonDecode(response.body);
      // Process the response data as needed
      return responseData;
    } else {
      // Error handling for unsuccessful login
      print('Login failed. Status code: ${response.statusCode}');
      throw Exception(
          'Login failed'); // Throw an exception to indicate login failure
    }
  } catch (error) {
    // Error handling for network request
    print('An error occurred: $error');
    throw Exception(
        'An error occurred'); // Throw an exception to indicate network error
  }
}
