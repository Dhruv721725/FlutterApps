import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // get collection of notes
  final CollectionReference notes= 
    FirebaseFirestore.instance.collection("notes");

  // create: add a new note
  Future <void> addNote(String note){
    return notes.add({
      'note':note,
      'timestamp':Timestamp.now(),
    });
  }
  // read: reading all notes
  Stream <QuerySnapshot> getNotesStream(){
    final notesStream = notes.orderBy("timestamp", descending: true).snapshots();
    return notesStream;
  }
  // update: updating note at given index
  Future <void> updateNote(String docId, String newNote){
    return notes.doc(docId).update({
      'note':newNote,
      'timestamp':Timestamp.now()
      }
    );
  }

  // delete: deleting note at given index
  Future <void> deleteNote(String docId){
    return notes.doc(docId).delete();
  }

}