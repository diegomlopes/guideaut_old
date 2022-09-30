// ignore: import_of_legacy_library_into_null_safe
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:guidealt/data/datasources/authentication_data_source.dart';
import 'package:guidealt/data/datasources/remote/config/configs.dart';
import 'package:guidealt/domain/entities/user.dart';
import 'package:guidealt/domain/errors/error.dart';

class AuthenticationDataSourceSql implements AuthenticationDataSource {

  var dio = Dio();
  
  @override
  Future<Either<ErrorHandler, User>> signin(String email, String password) async {
    try {
      final response = await dio.post(
        baseUrl + '/authentication/signin', 
        data: jsonEncode({'email': email, 'password': password}),
        options: Options(
          headers: {
              "Accept": "application/json",
              "Access-Control-Allow-Origin": "*",
              "Access-Control-Allow-Headers": "*",
              "Access-Control-Allow-Methods": "*",
              // "Access-Control-Allow-Credentials": "true"
          }
        )
      );

      if (response.statusCode == 200) {
        if (response.data != null) {
          return Right(
            User(
              firstName: "", 
              secondName: "", 
              email: email, 
              password: password, 
              type: response.data["data"]["type"]),
          );
        }
      }
    } on DioError catch (error) {
      return Left(ErrorHandler(message: "Error: ${error.response!.data["errorMessage"]}"));
    }
    
    return const Left(ErrorHandler(message: "Unkown error"));
  }

  @override
  Future<Either<ErrorHandler, User>> signup(String email, String password) async {
    try {
      final response = await dio.post(
        baseUrl + '/authentication/signup', 
        data: jsonEncode({'email': email, 'password': password}),
        options: Options(
          headers: {
              "Accept": "application/json",
              "Access-Control-Allow-Origin": "*",
              "Access-Control-Allow-Headers": "*",
              "Access-Control-Allow-Methods": "*",
              // "Access-Control-Allow-Credentials": "true"
          }
        )
      );

      if (response.statusCode == 200) {
        if (response.data != null) {
          return Right(
            User(
              firstName: "", 
              secondName: "", 
              email: email, 
              password: password, 
              type: response.data["data"]["type"]),
          );
        }
      }
    } on DioError catch (error) {
      return Left(ErrorHandler(message: "Error: ${error.response!.data["errorMessage"]}"));
    }
    
    return const Left(ErrorHandler(message: "Unkown error"));
  }
  

}