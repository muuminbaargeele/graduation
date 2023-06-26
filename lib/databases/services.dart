import 'package:graduation/models/complainttypesmodel.dart';
import 'package:graduation/models/usermodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/complaintsmodel.dart';
import '../models/districtModel.dart';

const String urls = "https://baargeelle.com"; // Host url
// const String urls = "http://192.168.1.3"; // Local url

// Login API
Future<String> login(String username, String password, box) async {
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
      box.put("username", username);
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
Future<String> SendOTP(
    name, gmail, username, pass, districtid, phone, gender, box) async {
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
      box.put("username", username);
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

// Get ComplaintTypes API
Future<List<ComplaintTypes>> fetchComplaintTypes() async {
  final url = '${urls}/backEnd/get_complains.php';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = response.body;
    return complaintTypesFromJson(data);
  } else {
    throw Exception('Failed to fetch ComplaintTypes');
  }
}

// Upload Image API
Future uploadImage(String imagePath) async {
  var request = http.MultipartRequest(
    'POST',
    Uri.parse('${urls}/backEnd/upload.php'), // Replace with your API endpoint
  );

  request.files.add(
    await http.MultipartFile.fromPath(
      'image',
      imagePath,
    ),
  );

  var response = await request.send();
  if (response.statusCode == 200) {
    print('Image uploaded successfully');
    return true;
  } else {
    print('Failed to upload image');
  }
}

// Submit Complaint API
Future<String> submitComplaint(username, compTypeID, dateTime, compDesc,
    compImg, districtID, address) async {
  final url =
      '${urls}/backEnd/complaint_submit.php'; // Replace with your API endpoint

  try {
    final response = await http.post(
      Uri.parse(url),
      body: {
        'Username': username,
        'ComplaintTypeID': compTypeID,
        'DateTime': dateTime,
        'ComplaintDesc': compDesc,
        'ComplaintImage': compImg,
        'DistrictID': districtID,
        'Address': address,
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

// Get Complaints API
Future<List<Complaints>> fetchComplaints(username) async {
  final url = '${urls}/backEnd/get_complaints.php';

  try {
    final response = await http.post(
      Uri.parse(url),
      body: {
        'Username': username,
      },
    );

    if (response.statusCode == 200) {
      // Successful 
      final data = response.body;
      return complaintsFromJson(data);
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


// Get User API
Future<List<User>> fetchuser(username) async {
  final url = '${urls}/backEnd/get_user.php';

  try {
    final response = await http.post(
      Uri.parse(url),
      body: {
        'Username': username,
      },
    );

    if (response.statusCode == 200) {
      // Successful 
      final data = response.body;
      return userFromJson(data);
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