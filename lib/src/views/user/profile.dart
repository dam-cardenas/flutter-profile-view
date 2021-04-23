import 'package:flutter/material.dart';

import 'package:profile_view/src/views/user/components/app_bar.dart';
import 'package:profile_view/src/views/user/components/user_data_form.dart';

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
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: UserDataForm(),
          ),
        ],
      ),
    );
  }
}
