import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/notes_home_page.dart';
import 'controllers/note_controller.dart';
import 'package:provider/provider.dart';
import 'package:easy_design_system/easy_design_system.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NoteController()..fetchNotes(), // load notes initially
      child: MaterialApp(
        title: 'Notes App',
        theme: ComicThemeData.of(context),
        home: const NotesHomePage(),
      ),
    );
  }
}
