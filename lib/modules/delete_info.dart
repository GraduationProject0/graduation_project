import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> deleteDocument(String docId) async {
  try {
    final CollectionReference collectionRef = FirebaseFirestore.instance.collection('users');
    await collectionRef.doc(docId).delete();
    print('Document with ID $docId deleted successfully!');
  } catch (e) {
    print('Error deleting document: $e');
  }
}