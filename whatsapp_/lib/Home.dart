import 'package:flutter/material.dart';
import 'package:whatsapp/community.dart';
import 'Calls.dart';
import 'Status.dart';
import 'Camera.dart';
import 'Chats.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 1, length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'WhatsApp',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_a_photo),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
            color: Colors.white,
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            const Tab(
              icon: Icon(Icons.people, color: Colors.white),
            ),
            Tab(
              child: Text(
                'CHATS',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Tab(
              child: Text(
                'STATUS',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Tab(
              child: Text(
                'CALLS',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(controller: _tabController,
      children:[
        Community(),
        Chats(),
        Status(),
        Calls(),
       
      ]),
      // floatingActionButton: FloatingActionButton(
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      //   backgroundColor: Theme.of(context).hintColor,
      //   onPressed: () {
      //     print('Button pressed');
      //   },
      //   child: Icon(
      //     Icons.message,
      //     color: Colors.white,
      //   ),
      // ),
    );
  }
}
