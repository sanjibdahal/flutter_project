import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
    Fluttertoast.showToast(
      msg: 'Signed out successfully!',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey[700],
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  int currentindex = 0;
  // static const List pages = [
  //   Icon(Icons.home, size: 100),
  //   Icon(Icons.photo, size: 100),
  //   Icon(Icons.person, size: 100),
  // ];

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // pages.elementAt(currentindex),
            Text('Hello, ${user?.displayName}'),
            user?.photoURL != null
                ? ClipOval(
                    child: Material(
                      color: Colors.lightBlue,
                      child: Image.network(
                        user!.photoURL!,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  )
                :
            ClipOval(
              child: Material(
                color: Colors.lightBlue,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
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
