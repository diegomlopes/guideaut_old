import 'package:dartz/dartz.dart';
import 'package:guidealt/domain/entities/recomendation.dart';

abstract class RecomendationRepository {

  Future<Either<Exception, Recomendation>> addRecomendation(Recomendation recomendation);
  Future<Either<Exception, Recomendation>> getRecomendation(Recomendation recomendation);
  Future<Either<Exception, Recomendation>> updateRecomendation(Recomendation recomendation);
  Future<Either<Exception, bool>> deleteRecomendation(Recomendation recomendation);

}