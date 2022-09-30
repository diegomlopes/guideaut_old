import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guidealt/domain/entities/recomendation.dart';

class RecomendationDataSource {
  
  Future<bool> addRecomendation(Recomendation recomendation) {
    CollectionReference recomendations = FirebaseFirestore.instance.collection('recomendations');

    return recomendations
          .add(recomendation.toJson())
          .then((value) => true)
          .catchError((error) => false);
  }

  Future<Recomendation> getRecomendation(String id) {
    late Recomendation recomendation;

    CollectionReference recomendations = FirebaseFirestore.instance.collection('recomendations');
     return recomendations.doc(id).get().then((DocumentSnapshot<Object?> snapshot) {
       if (snapshot.exists) {
         final data = snapshot.data();
         recomendation = Recomendation.fromJson(data as Map<String, dynamic>);
       } 

       return recomendation;
     });
  }

}