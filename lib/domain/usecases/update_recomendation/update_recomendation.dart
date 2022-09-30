import 'package:dartz/dartz.dart';
import 'package:guidealt/domain/entities/recomendation.dart';
import 'package:guidealt/domain/repositories/recomendation_repository.dart';
import 'package:guidealt/domain/usecases/update_recomendation/params/update_recomendation_params.dart';
import 'package:guidealt/domain/usecases/usecase.dart';

class UpdateRecomendation extends UseCase<Recomendation, UpdateRecomendationParams> {

  final RecomendationRepository repository;

  UpdateRecomendation({
    required this.repository
  });

  @override
  Future<Either<Exception, Recomendation>> call(UpdateRecomendationParams params) async {
    final result = await repository.updateRecomendation(params.recomendation);
    return result;
  }

}