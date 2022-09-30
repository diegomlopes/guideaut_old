import 'package:guidealt/domain/entities/recomendation.dart';
import 'package:dartz/dartz.dart';
import 'package:guidealt/domain/repositories/recomendation_repository.dart';

class RecomendationRepositoryImpl implements RecomendationRepository {
  @override
  Future<Either<Exception, Recomendation>> addRecomendation(Recomendation recomendation) {
    // TODO: implement addRecomendation
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, bool>> deleteRecomendation(Recomendation recomendation) {
    // TODO: implement deleteRecomendation
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, Recomendation>> getRecomendation(Recomendation recomendation) {
    // TODO: implement getRecomendation
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, Recomendation>> updateRecomendation(Recomendation recomendation) {
    // TODO: implement updateRecomendation
    throw UnimplementedError();
  }
  

}