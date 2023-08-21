import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  List<String> notesList = [];

  @override
  void initState() {
    super.initState();
    getNotes();
  }

  Future<void> getNotes() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final List<String>? storedNotes = pref.getStringList('notesList');
    if (storedNotes != null) {
      setState(() {
        notesList = storedNotes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes list'),
      ),
      body: Center(
        child: notesList.isEmpty
            ? Text('No data found')
            : ListView.builder(
                itemCount: notesList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.note),
                    tileColor: Colors.amberAccent,
                    title: Text(notesList[index]),
                  );
                },
              ),
      ),
    );
  }
}
