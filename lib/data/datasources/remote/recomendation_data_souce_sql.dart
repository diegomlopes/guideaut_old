import 'package:guidealt/data/datasources/firebase/recomendation_data_source.dart';
import 'package:guidealt/domain/entities/recomendation.dart';

class RecomendationDataSourceSql implements RecomendationDataSource {
  @override
  Future<bool> addRecomendation(Recomendation recomendation) {
    // TODO: implement addRecomendation
    throw UnimplementedError();
  }

  @override
  Future<Recomendation> getRecomendation(String id) {
    // TODO: implement getRecomendation
    throw UnimplementedError();
  }

}





// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:guidealt/data/datasources/mysql/config/configs.dart';
// import 'package:guidealt/data/datasources/mysql/reference_data_source_sql.dart';
// import 'package:guidealt/entities/recomendation.dart';

// class RecomendationDataSourceSql {

//   ReferenceDataSourceSql referenceDataSourceSql;

//   RecomendationDataSourceSql({
//     required this.referenceDataSourceSql,
//   });

//   Future<bool> addRecomendation(Recomendation recomendation) async {
//     var body = recomendation.toSqlJson();

//     print(body);
//     // var response = await Dio().post(
//     //   '$baseUrl/categories/',
//     //   data: jsonEncode(body),
//     //   options: Options(
//     //     headers: {
//     //         "Accept": "application/json",
//     //         "Access-Control-Allow-Origin": "*",
//     //         // "Access-Control-Allow-Headers": "*",
//     //         // "Access-Control-Allow-Methods": "*",
//     //         // "Access-Control-Allow-Credentials": "true"
//     //     }
//     //   )
//     // );

//     // if (response.statusCode == 200 && response.data is int) {
//     //   recomendation.id = (response.data as int);
//     //   return true;
//     // }

//     // return false;

//     return Future(() => true);
//   }

// }
