// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

// import 'data_helper.dart';
// import '../../features/login/view/login_screen.dart';

class HTTPHelper {
  // static const String baseUrl = 'https://clinics.soulnbody.net/clinic_mobile/';

  static Future httpLogin(String endPoint, dynamic body, {dynamic headers}) async{
    Uri url = Uri.parse(endPoint);
    headers ??= {};
    headers = Map<String, String>.from(headers);
    var response = await http.post(url, body: body, headers: headers);
    var utf8ResponseBody = utf8.decode(response.bodyBytes);
    return utf8ResponseBody;
  }

  static Future httpPost(BuildContext context, String endPoint, dynamic body, {dynamic headers}) async{
    // DataHelper instance = DataHelper.instance;
    // if(instance['userDb'] == null) {
    //   await instance.reset();
      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false);
    // }
    Uri url = Uri.parse(endPoint);
    headers ??= {};
    headers = Map<String, String>.from(headers);
    var response = await http.post(url, body: body, headers: headers);
    var utf8ResponseBody = utf8.decode(response.bodyBytes);
    return utf8ResponseBody;
  }

  static Future httpGet(BuildContext context, String endPoint, Map<String, String> headers, {dynamic params}) async{
    params ??= {};
    Uri url = Uri.parse(endPoint).replace(queryParameters: params);
    var response = await http.get(url, headers: headers);
    return response.body;
  }

  static Future<void> uploadFiles(BuildContext context, File file, String url, String imgKey, Map<String, String> body) async {
    try {
      final uri = Uri.parse(url);
      var request = http.MultipartRequest('POST', uri);
      if (await file.exists()) {
        final fileBytes = file.readAsBytesSync();
        request.files.add(
          http.MultipartFile.fromBytes(
            imgKey,
            fileBytes,
            filename: file.path.split('/').last,
            contentType: MediaType('image', 'png'),
          ),
        );
        request.fields.addAll(body);
        request.headers.addAll({
          'Content-Type': 'application/json',
        });
        var response = await request.send();
        String responseBody = await response.stream.bytesToString();
        if (response.statusCode == 200) {
          if (responseBody[0] == '1') {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialog(
                  title: Text('Upload Successful'),
                  content: Text('The image has been uploaded successfully!'),
                );
              },
            );
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Upload Failed'),
                  content: Text('Failed to upload the image. Reason: $responseBody'),
                );
              },
            );
          }
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const AlertDialog(
                title: Text('Upload Failed'),
                content: Text('Server error: Unable to process the request.'),
              );
            },
          );
        }
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              title: Text('File Not Found'),
              content: Text('The selected file does not exist.'),
            );
          },
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('An error occurred: $e'),
          );
        },
      );
    }
  }
}