import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  int currentindex = 0;
  static const List pages = [
    Icon(Icons.home),
    Icon(Icons.photo_album),
    Icon(Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Dashboard'),
          foregroundColor: Colors.white,
          elevation: 1,
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          actions: [
            IconButton(
              onPressed: signUserOut,
              icon: Icon(Icons.logout),
            )
          ]),
      body: Center(
        child: pages.elementAt(currentindex),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.photo), label: 'Gallery'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedIndex: currentindex,
        onDestinationSelected: (int index) {
          setState(() {
            currentindex = index;
          });
        },
      ),
    );
  }
}
