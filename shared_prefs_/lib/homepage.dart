import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedprefs/notesscreen.dart';

class MyHomePage1 extends StatefulWidget {
  const MyHomePage1({Key? key, required String title}) : super(key: key);

  @override
  State<MyHomePage1> createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {
  final notesController = TextEditingController();
  List<String> notesList = [];

  Future<void> setNotesData(List<String> notes) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList('notesList', notes);
  }

  Future<void> loadStoredNotes() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final List<String>? storedNotes = pref.getStringList('notesList');
    if (storedNotes != null) {
      setState(() {
        notesList = storedNotes;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadStoredNotes(); // Load stored notes when the app starts
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared preferences'),
      ),
      body: Container(
        child: Column(children: [
          TextField(
            controller: notesController,
            decoration: const InputDecoration(hintText: 'Enter Notes'),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                notesList.add(notesController.text);
                setNotesData(notesList);
                notesController.clear();
                print('saved');
              });
            },
            child: const Text('Save'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NoteList()),
              );
            },
            child: const Text('View notes'),
          ),
        ]),
      ),
    );
  }
}
