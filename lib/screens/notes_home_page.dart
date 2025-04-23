import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/note_controller.dart';
import '../models/note.dart';

// Stateless widget for notes with controller

class NotesHomePage extends StatelessWidget {
  const NotesHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Provides noteController to this widget
    final noteController = Provider.of<NoteController>(context);

    // Main Structure
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notes'),
      ),
      // Ternary operator, if notes is empty it will simply return no notes yet
      // Else it returns a ListView
      body: noteController.notes.isEmpty
          ? const Center(child: Text('No notes yet.'))
          // Builds all notes as a list
          : ListView.builder(
              itemCount: noteController.notes.length,
              itemBuilder: (context, index) {
                // Returns data from controller's notes
                final note = noteController.notes[index];
                return ListTile(
                  title: Text(note.title),
                  subtitle: Text(note.content),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Shows note dialog for viewing or editing
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          _showNoteDialog(context, noteController, note: note);
                        },
                      ),
                      // Delete button which on press will do deleteNote
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          noteController.deleteNote(note.id);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
      // Note writer and editor
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showNoteDialog(context, noteController);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  // Helper to show dialog for creating or editing notes
  void _showNoteDialog(BuildContext context, NoteController controller, {Note? note}) {
    final titleController = TextEditingController(text: note?.title ?? '');
    final contentController = TextEditingController(text: note?.content ?? '');
    // Dart's Dialog function
    showDialog(
      context: context,
      // Alerts to add note, but if note not null, it will be on edite note
      builder: (context) => AlertDialog(
        title: Text(note == null ? 'Add Note' : 'Edit Note'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // TextFields given their respective controllers
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: contentController,
              decoration: const InputDecoration(labelText: 'Content'),
            ),
          ],
        ),
        // cancel button
        // closes dialog
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          // on press will submit addNote or update note
          ElevatedButton(
            onPressed: () {
              final title = titleController.text.trim();
              final content = contentController.text.trim();

              if (title.isEmpty || content.isEmpty) return;

              if (note == null) {
                controller.addNote(title, content);
              } else {
                controller.updateNote(note.id, title, content);
              }

              Navigator.pop(context); // Close dialog
            },
            child: Text(note == null ? 'Add' : 'Update'),
          ),
        ],
      ),
    );
  }
}
