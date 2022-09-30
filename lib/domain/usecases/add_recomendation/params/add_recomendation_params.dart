import 'package:equatable/equatable.dart';
import 'package:guidealt/domain/entities/recomendation.dart';

class AddRecomendationParams extends Equatable {
  final Recomendation recomendation;

  const AddRecomendationParams({
    required this.recomendation
  });

  @override
  List<Object> get props => [recomendation];
}