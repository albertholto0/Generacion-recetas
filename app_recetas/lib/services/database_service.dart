import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Función para guardar todas las respuestas del cuestionario en el documento del usuario correspondiente
  Future<void> saveQuestionnaireResults(
    String uid,
    Map<String, dynamic> results,
  ) async {
    await _db.collection('users').doc(uid).update({
      'questionnaireCompleted': true,
      'preferences': results,
      'updateAt': FieldValue.serverTimestamp(),
    });
  }

  // Función que verifica si el usuario ya respondió el cuestionario
  Future<bool> hasCompletedQuestionnaire(String uid) async {
    try {
      DocumentSnapshot doc = await _db.collection('users').doc(uid).get();
      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return data['questionnaireCompleted'] ?? false;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
