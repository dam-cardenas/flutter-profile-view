import 'package:flutter/material.dart';

import 'package:profile_view/src/views/user/components/app_bar.dart';

class Profile extends StatefulWidget {
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  // functions
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProfileAppBar(
            title: 'Profile', 
            profileImage: '', 
            userName: 'Damian'
          ).render(context)
        ],
      ),
    );
  }
}
