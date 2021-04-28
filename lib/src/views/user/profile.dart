import 'dart:io';

import 'package:flutter/material.dart';

import 'package:profile_view/src/views/user/components/app_bar.dart';
import 'package:profile_view/src/views/user/components/user_data_form.dart';
import 'package:profile_view/src/views/user/components/home_location_preview.dart';
import 'package:profile_view/src/views/user/components/home_location_form.dart';
class Profile extends StatefulWidget {
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  // functions
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade900,
        elevation: 0,
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: HomeLocationForm(onSubmit: (data){
        print(data);
      }),
          // body: ListView(
          //   children: [
          // ProfileAppBar(
          //   onSubmitImage: (File image){}, // submit image function
          // ),
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 30),
          //   child: UserDataForm(
          //     username: '',
          //     email: 'damian.cardenas.developer@gmail.com',
          //     onSubmit: (Map<String,dynamic> data) {
          //       print(data); // submit form function
          //     },
          //   ),
          // ),
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 30),
          //   child: HomeLocationPreview(
          //     data: {
          //       HomeLocation.latitude: 1.0,
          //       HomeLocation.longitude: 1.0,
          //       HomeLocation.milesAround: 1.0
          //     },
          //     onEdit: (){
          //       print('edit'); // edit function
          //     }
          //   )
          // ),
          // ],
          // ),
    );
  }
}
