import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Sanjib Dahal'),
          SizedBox(height: 20,),
          Text('sanjibdahal04@gmail.com'),
          SizedBox(height: 20,),

        ],
      ),
    );
  }
}