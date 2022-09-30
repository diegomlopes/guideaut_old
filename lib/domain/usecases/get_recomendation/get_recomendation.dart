import 'package:dartz/dartz.dart';
import 'package:guidealt/domain/entities/recomendation.dart';
import 'package:guidealt/domain/repositories/recomendation_repository.dart';
import 'package:guidealt/domain/usecases/get_recomendation/params/get_recomendation_params.dart';
import 'package:guidealt/domain/usecases/usecase.dart';

class GetRecomendation extends UseCase<Recomendation, GetRecomendationParams> {

  final RecomendationRepository repository;

  GetRecomendation({
    required this.repository
  });

  @override
  Future<Either<Exception, Recomendation>> call(GetRecomendationParams params) async {
    final result = await repository.getRecomendation(params.recomendation);
    return result;
  }

}