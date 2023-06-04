import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/districtModel.dart';

const String urls = "https://baargeelle.com"; // Host url
// const String urls = "http://192.168.1.3"; // Local url



// Login API
Future<String> login(String username, String password) async {
  final url = '${urls}/backEnd/login.php'; // Replace with your API endpoint

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


// Get Districts API
Future<List<Districts>> fetchDistricts() async {
  final url = '${urls}/backEnd/get_districts.php';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = response.body;
    return districtsFromJson(data);
  } else {
    throw Exception('Failed to fetch districts');
  }
}


// Send Verification Code API
Future<String> SendOTP(name, gmail, username, pass, districtid, phone, gender) async {
  final url = '${urls}/backEnd/auth.php'; // Replace with your API endpoint

  try {
    final response = await http.post(
      Uri.parse(url),
      body: {
        'FullName': name,
        'Gmail': gmail,
        'Username': username,
        'Password': pass,
        'DistrictID': districtid,
        'PhoneNumber': phone,
        'Gender': gender,
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


// OTP Check API
Future<String> otpCheck(String gmail, String code) async {
  final url = '${urls}/backEnd/checkotp.php'; // Replace with your API endpoint

  try {
    final response = await http.post(
      Uri.parse(url),
      body: {
        'Code': code,
        'Gmail': gmail,
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