import 'package:dartz/dartz.dart';
import 'package:guidealt/domain/repositories/recomendation_repository.dart';
import 'package:guidealt/domain/usecases/delete_recomendation/params/delete_recomendation_params.dart';
import 'package:guidealt/domain/usecases/usecase.dart';

class DeleteRecomendation extends UseCase<bool, DeleteRecomendationParams> {

  final RecomendationRepository repository;

  DeleteRecomendation({
    required this.repository
  });

  @override
  Future<Either<Exception, bool>> call(DeleteRecomendationParams params) async {
    final result = await repository.deleteRecomendation(params.recomendation);
    return result;
  }

}