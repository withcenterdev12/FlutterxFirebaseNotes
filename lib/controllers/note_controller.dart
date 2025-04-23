import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../models/note.dart';

class NoteController with ChangeNotifier {
  // Gives instance to FirebaseDatabase
  final _db = FirebaseDatabase.instance.ref("notes"); // Firebase "notes" node

  // Initial notes list
  List<Note> _notes = [];
  // Getter for notes
  List<Note> get notes => _notes;

  // Read all notes from Firebase
  Future<void> fetchNotes() async {
    // gets a snapshot of the database
    final snapshot = await _db.get();
    // Maps data to snapshot values like Python Dictionary
    final data = snapshot.value as Map?;
    if (data != null) {
      _notes = data.entries.map((e) => Note.fromJson(e.key, Map<String, dynamic>.from(e.value))).toList();
      notifyListeners();
    }
  }

  // Create a new note
  Future<void> addNote(String title, String content) async {
    final newNoteRef = _db.push(); // generates a unique ID
    await newNoteRef.set({
      'title': title,
      'content': content,
    });
    fetchNotes(); // refresh notes
  }

  // Update a note
  Future<void> updateNote(String id, String title, String content) async {
    await _db.child(id).update({
      'title': title,
      'content': content,
    });
    fetchNotes();
  }

  // Delete a note
  Future<void> deleteNote(String id) async {
    await _db.child(id).remove();
    fetchNotes();
  }
}
