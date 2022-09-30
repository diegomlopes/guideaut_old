import 'package:equatable/equatable.dart';
import 'package:guidealt/domain/entities/recomendation.dart';

class GetRecomendationParams extends Equatable {
  final Recomendation recomendation;

  const GetRecomendationParams({
    required this.recomendation
  });

  @override
  List<Object> get props => [recomendation];
}