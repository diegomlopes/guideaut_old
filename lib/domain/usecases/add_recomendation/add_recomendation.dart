import 'package:dartz/dartz.dart';
import 'package:guidealt/domain/entities/recomendation.dart';
import 'package:guidealt/domain/repositories/recomendation_repository.dart';
import 'package:guidealt/domain/usecases/add_recomendation/params/add_recomendation_params.dart';
import 'package:guidealt/domain/usecases/usecase.dart';

class AddRecomendation extends UseCase<Recomendation, AddRecomendationParams> {

  final RecomendationRepository repository;

  AddRecomendation({
    required this.repository
  });

  @override
  Future<Either<Exception, Recomendation>> call(AddRecomendationParams params) async {
    final result = await repository.addRecomendation(params.recomendation);
    return result;
  }

}