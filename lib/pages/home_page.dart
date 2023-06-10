import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: signUserOut,
              icon: Icon(Icons.logout),
            )
          ]),
      drawer: Drawer(
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.9),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: ListView(children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(children: [
                  user?.photoURL != null
                      ? ClipOval(
                          child: Material(
                            child: Image.network(
                              user!.photoURL!,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : ClipOval(
                          child: Material(
                              // borderRadius: BorderRadius.circular(5),
                              color: Colors.lightBlue,
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Icon(
                                  Icons.person,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user?.displayName ?? 'User',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${user?.email}',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  )
                ]),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              selectedColor: Colors.lightBlue,
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Alert'),
                        icon: Icon(Icons.info),
                        actions: [
                          Text(
                              'This is some random text to alert you! krglksjglksjl vsjnv dsjnvkj vsdjnvk vsjdnk sdn '),
                          Icon(Icons.handshake)
                        ],
                        backgroundColor: Colors.lightBlue,
                      );
                    });
              },
              leading: FaIcon(FontAwesomeIcons.houseChimney, size: 22),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.image, size: 22),
              title: Text(
                'Gallery',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.solidUser, size: 22),
              title: Text(
                'Profile',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.arrowRightFromBracket, size: 22),
              onTap: signUserOut,
              title: Text(
                'Logout',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ]),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // pages.elementAt(currentindex),
            // ignore: prefer_if_null_operators
            Text(
              'Hello, ${user?.displayName ?? 'User'}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
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
                : ClipOval(
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
