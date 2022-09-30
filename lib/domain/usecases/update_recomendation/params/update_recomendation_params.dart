import 'package:equatable/equatable.dart';
import 'package:guidealt/domain/entities/recomendation.dart';

class UpdateRecomendationParams extends Equatable {
  final Recomendation recomendation;

  const UpdateRecomendationParams({
    required this.recomendation
  });

  @override
  List<Object> get props => [recomendation];
}