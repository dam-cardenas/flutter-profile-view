import 'package:flutter/material.dart';

class ProfileAppBar {
  final String profileImage;
  final String userName;
  final String title;
  ProfileAppBar(
    {
      this.title,
      this.profileImage,
      this.userName,
    }
  );
  Widget render(context) {
    return  Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.amber[900]
          ),
          height: MediaQuery.of(context).size.height * 0.2
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadiusDirectional.circular(500.0),

            ),
            margin: EdgeInsets.only(
              left: 15.0,
              right: 15.0,
              top: 100.0,
            ),
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.height * 0.15,
            child: Stack(
              children: [
                Positioned(
                  bottom: 1,
                  right: 1,
                  child: FloatingActionButton(
                    child: Icon(Icons.camera_alt, size: 15, color: Colors.amber[900],),
                    backgroundColor: Colors.grey[100],
                    elevation: 2,
                    mini: true, 
                    onPressed: (){print('Edit photo');}
                  ),
                ),
              ],
            ),
          )
        ),
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
            title: Text(this.title),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {},
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          )
        ),
      ],
    );
  }
}
