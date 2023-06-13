import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    // var user;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hello, ${user?.displayName ?? 'User'}',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          Text('${user!.email}'),
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
    );
  }
}
