import 'dart:developer';

import 'package:dio/dio.dart';

// ignore_for_file: unused_local_variable

class Notes {
  final String _token;
  Notes(this._token);

  final Dio _dio = Dio();
}
