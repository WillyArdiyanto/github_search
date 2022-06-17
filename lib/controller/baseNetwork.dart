import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_request/model/followersModel.dart';

import '../model/repoModel.dart';

class BaseNetwork {
  static final String baseUrl = "https://api.github.com/users/";

  //get user
  static Future<Map<String, dynamic>> get(String partUrl) async {
    final String fullUrl = baseUrl + "/" + partUrl;
    debugPrint("BaseNetwork - fullUrl : $fullUrl");
    final response = await http.get(Uri.parse(fullUrl));
    debugPrint("BaseNetwork - response : ${response.body}");
    return _processResponse(response);
  }
  static Future<Map<String, dynamic>> _processResponse(
      http.Response response) async {
    final body = response.body;
    if (body.isNotEmpty) {
      final jsonBody = json.decode(body);
      return jsonBody;
    } else {
      print("processResponse error");
      return {"error": true};
    }
  }

  //get repos
  static Future<List<RepoModel>> getRepos(String partUrl) async {
    final String fullUrl = baseUrl + partUrl;
    debugPrint("BaseNetwork - fullUrl : $fullUrl");
    final response = await http.get(Uri.parse(fullUrl));
    debugPrint("BaseNetwork - response : ${response.body}");
    return _processResponse2(response);
  }
  static Future<List<RepoModel>> _processResponse2(http.Response response) async {
    final body = response.body;
    List jsonResponse = json.decode(body);
    return jsonResponse.map((p) => RepoModel.fromJson(p)).toList();
  }

  //getFollowers
  static Future<List<FollowersModel>> getFollowers(String partUrl) async {
    final String fullUrl = baseUrl + partUrl;
    debugPrint("BaseNetwork - fullUrl : $fullUrl");
    final response = await http.get(Uri.parse(fullUrl));
    debugPrint("BaseNetwork - response : ${response.body}");
    return _processResponse3(response);
  }
  static Future<List<FollowersModel>> _processResponse3(http.Response response) async {
    final body = response.body;
    List jsonResponse = json.decode(body);
    return jsonResponse.map((p) => FollowersModel.fromJson(p)).toList();
  }

  //getFollowing
  static Future<List<FollowersModel>> getFollowing(String partUrl) async {
    final String fullUrl = baseUrl + partUrl;
    debugPrint("BaseNetwork - fullUrl : $fullUrl");
    final response = await http.get(Uri.parse(fullUrl));
    debugPrint("BaseNetwork - response : ${response.body}");
    return _processResponse4(response);
  }
  static Future<List<FollowersModel>> _processResponse4(http.Response response) async {
    final body = response.body;
    List jsonResponse = json.decode(body);
    return jsonResponse.map((p) => FollowersModel.fromJson(p)).toList();
  }

  static void debugPrint(String value) {
    print("[BASE_NETWORK] - $value");
  }
}