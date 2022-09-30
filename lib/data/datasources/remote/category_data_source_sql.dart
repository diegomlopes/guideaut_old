import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:guidealt/data/datasources/remote/config/configs.dart';
import 'package:guidealt/domain/entities/category.dart';

class CategoryDataSourceSql {
  

  Future<bool> addCategory(Category category) async {
    var body = category.toSqlJson();

    var response = await Dio().post(
      '$baseUrl/categories/',
      data: jsonEncode(body),
      options: Options(
        headers: {
            "Accept": "application/json",
            "Access-Control-Allow-Origin": "*",
            // "Access-Control-Allow-Headers": "*",
            // "Access-Control-Allow-Methods": "*",
            // "Access-Control-Allow-Credentials": "true"
        }
      )
    );

    if (response.statusCode == 200 && response.data is int) {
      category.id = (response.data as int);
      return true;
    }

    return false;
  }

  Future<List<Category>> gellAllCategories() async {
    var response = await Dio().get(
      '$baseUrl/categories/',
      options: Options(
        headers: {
            "Accept": "application/json",
            "Access-Control-Allow-Origin": "*",
            // "Access-Control-Allow-Headers": "*",
            // "Access-Control-Allow-Methods": "*",
            // "Access-Control-Allow-Credentials": "true"
        }
      )
    );

    var categories = <Category>[];

    if (response.statusCode == 200 && response.data != null) {
      final map = response.data as Map;
      map.forEach((key, value) {
        final list = value as List<dynamic>;
        categories = list.map((e) => Category.fromSqlJson(e)).toList();
      });
    }

    return categories;
  }

}
