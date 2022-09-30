import 'package:equatable/equatable.dart';
import 'package:guidealt/domain/entities/recomendation.dart';

class DeleteRecomendationParams extends Equatable {
  final Recomendation recomendation;

  const DeleteRecomendationParams({
    required this.recomendation
  });

  @override
  List<Object> get props => [recomendation];
}