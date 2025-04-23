import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/note_controller.dart';
import '../models/note.dart';

class NotesHomePage extends StatelessWidget {
  const NotesHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final noteController = Provider.of<NoteController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notes'),
      ),
      body: noteController.notes.isEmpty
          ? const Center(child: Text('No notes yet.'))
          : ListView.builder(
              itemCount: noteController.notes.length,
              itemBuilder: (context, index) {
                final note = noteController.notes[index];
                return ListTile(
                  title: Text(note.title),
                  subtitle: Text(note.content),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          _showNoteDialog(context, noteController, note: note);
                        },
                      ),
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

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(note == null ? 'Add Note' : 'Edit Note'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
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
