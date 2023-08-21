import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'dart:io';




class MyHomepage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  List<Map<String, dynamic>>? usersdata;
  bool isLoading = true;
  final String url = "https://randomuser.me/api/?results=50";
  final String sharedPrefKey = "user_data_key";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? storedData = prefs.getStringList(sharedPrefKey);

    if (storedData != null && storedData.isNotEmpty) {
      setState(() {
        usersdata = storedData.map((jsonString) {
          return jsonDecode(jsonString);
        }).cast<Map<String, dynamic>>().toList();
        isLoading = false;
      });
    } else {
      await fetchData();
    }
  }

  Future<void> fetchData() async {
    var response = await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    List data = jsonDecode(response.body)['results'];

    setState(() {
      usersdata = List<Map<String, dynamic>>.from(data);

      isLoading = false;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> jsonStrings = usersdata!.map((user) {
      return jsonEncode(user);
    }).toList();
    prefs.setStringList(sharedPrefKey, jsonStrings);

    await saveToLocalFile(jsonStrings);
  }

  Future<void> saveToLocalFile(List<String> jsonStrings) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/userdata.txt');

    if (!file.existsSync()) {
      file.createSync();
    }

    await file.writeAsString(jsonStrings.join('\n'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Random Users'),
      ),
      body: Container(
        child: isLoading
            ? const Center(child:CircularProgressIndicator())
            : ListView.builder(
                itemCount: usersdata == null ? 0 : usersdata!.length,
                itemBuilder: (context, index) {
                  String dateStr = usersdata![index]['dob']['date'];
                  DateTime dob = DateTime.parse(dateStr);
                  DateFormat dateFormat = DateFormat('MM/dd/yyyy');
                  String formattedDob = dateFormat.format(dob);

                  return Card(
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(20.0),
                          child: InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserDetailsPage(
                                  userDataIndex: index,
                                  dob: formattedDob,
                                ),
                              ),
                            ),
                            child: Image(
                              width: 70,
                              height: 70,
                              image: NetworkImage(
                                  usersdata![index]['picture']['thumbnail']),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                usersdata![index]['name']['first'] +
                                    " " +
                                    usersdata![index]['name']['last'],
                                style: TextStyle(fontSize: 20.0),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.phone),
                                  Text("Phone: ${usersdata![index]['phone']}"),
                                ],
                              ),
                              Text("Gender: ${usersdata![index]['gender']}"),
                              Text("Dob: $formattedDob"),
                              Text(usersdata![index]['id']['name']),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}

class UserDetailsPage extends StatelessWidget {
  final int userDataIndex;
  final String dob;

  const UserDetailsPage({Key? key, required this.userDataIndex, required this.dob})
      : super(key: key);

  Future<List<String>> _readLocalFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/userdata.txt');
    if (file.existsSync()) {
      return await file.readAsLines();
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _readLocalFile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasData) {
          List localUserData = snapshot.data!.map((jsonString) {
            return jsonDecode(jsonString);
          }).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('User Details'),
            ),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Image(
                      image: NetworkImage(localUserData[userDataIndex]['picture']['thumbnail']),
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    localUserData[userDataIndex]['name']['first'] + " " + localUserData[userDataIndex]['name']['last'],
                    style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.phone),
                      Text("Phone: ${localUserData[userDataIndex]['phone']}"),
                    ],
                  ),
                  Text("Gender: ${localUserData[userDataIndex]['gender']}"),
                  Text("Dob: ${dob}"),
                  Text("Age: ${localUserData[userDataIndex]['dob']['age']}"),
                  Text("ID name: ${localUserData[userDataIndex]['id']['name']}"),
                  Text("ID value: ${localUserData[userDataIndex]['id']['value']}"),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: Text('Error reading data.'),
            ),
          );
        }
      },
    );
  }
}
