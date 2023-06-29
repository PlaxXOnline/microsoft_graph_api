import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:microsoft_graph_api/models/models.dart';

class Me {
  final String _token;
  Me(this._token);

  final Dio _dio = Dio();

  /*-----------------------------USER--------------------------------*/

  /// Sends a GET request to the Microsoft Graph API to fetch user information.
  ///
  /// This function returns a `Future<User>`, which means it executes asynchronously and returns a `User` object when it completes.
  ///
  /// If the request is successful, the response data is converted into a `User` object by applying the static `fromJson` method on the `User` class.
  ///
  /// In case of an error (e.g., network error, invalid response data, etc.), the function catches the exception, logs out an appropriate error message, and returns an empty `User` object.
  ///
  /// Note that `$token` in `Bearer $token` is a variable that contains the access token needed for authenticating the request. This token must be set prior to the execution of the function.
  Future<User> fetchUserInfo() async {
    try {
      final response = await _dio.get(
        'https://graph.microsoft.com/v1.0/me/',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
          },
        ),
      );
      return User.fromJson(response.data);
    } catch (e) {
      log('Failed to fetch user info: $e');
      return const User.empty();
    }
  }

  /// Changes the password of the current user using the Microsoft Graph API.
  ///
  /// [currentPassword] is the current password of the user.
  /// [newPassword] is the new password to be set for the user.
  ///
  /// This method sends a PATCH request to the Microsoft Graph API to change the password
  /// of the current user.
  ///
  /// If the request is successful, it returns `true`.
  ///
  /// If the request fails, it logs the error message and returns `false`.
  Future<bool> changePassword(
      String currentPassword, String newPassword) async {
    try {
      final data = {
        "currentPassword": currentPassword,
        "newPassword": newPassword,
      };

      await _dio.patch(
        'https://graph.microsoft.com/v1.0/me/changePassword',
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $_token',
            'Content-Type': 'application/json',
          },
        ),
      );
      return true;
    } catch (e) {
      log('Failed to change password: $e');
      return false;
    }
  }

  /// Fetches the user's profile image from the Microsoft Graph API.
  ///
  /// This method sends a GET request to the Microsoft Graph API to fetch the
  /// profile image of the current user. The user's access token is sent in the
  /// header to authenticate the request.
  ///
  /// The [size] parameter is used to specify the desired size of the profile image.
  /// The Microsoft Graph API supports the following sizes: 48x48, 64x64, 96x96,
  /// 120x120, 240x240, 360x360, 432x432, 504x504, and 648x648. If you specify a
  /// size that is not supported, the API returns the next larger image.
  ///
  /// If the request is successful (HTTP status code 200), the image data is
  /// returned as a `MemoryImage`. If the request fails for any reason, an
  /// exception is thrown. If the image data cannot be retrieved, a default
  /// image asset is returned.
  ///
  /// Returns:
  ///   A `Future` that completes with an `ImageProvider` representing the
  ///   user's profile image or a default image.
  ///
  /// Throws:
  ///   Exception if the server does not return a 200 OK response.
  Future<ImageProvider> fetchUserProfileImage(String size) async {
    try {
      final response = await _dio.get(
        'https://graph.microsoft.com/v1.0/me/photos/$size/\$value',
        options: Options(
          responseType: ResponseType.bytes,
          headers: {
            'Authorization': 'Bearer $_token',
          },
        ),
      );

      if (response.statusCode == 200) {
        return MemoryImage(response.data);
      } else {
        throw Exception('Failed to load image');
      }
    } catch (e) {
      log('Failed to fetch user profile image: $e');
      if (e is DioException && e.response != null) {
        log('Server response: ${e.response?.data}');
      }
      return const AssetImage('assets/user-shadow.png');
    }
  }

  /// Fetches a list of all supported time zones from the Graph API.
  ///
  /// This method sends a GET request to the Graph API's supportedTimeZones endpoint
  /// and parses the response into a list of [TimeZone] objects.
  ///
  /// The request is authenticated with a bearer token, which is passed in the
  /// 'Authorization' header.
  ///
  /// Throws an [Exception] if the request fails.
  ///
  /// Returns a [Future] that completes with a list of [TimeZone]s.
  Future<List<TimeZone>> fetchTimeZones() async {
    final response = await _dio.get(
      'https://graph.microsoft.com/v1.0/me/outlook/supportedTimeZones',
      options: Options(
        headers: {
          'Authorization': 'Bearer $_token',
        },
      ),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = response.data['value'];
      return data.map((dynamic item) => TimeZone.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load time zones');
    }
  }
}
