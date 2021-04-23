import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

enum picOptions { fromCamera, fromGallery }
class ProfileAppBar extends StatefulWidget {
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
  @override
  _ProfileAppBar createState() => _ProfileAppBar();
}
class _ProfileAppBar extends State<ProfileAppBar> {
  File imageFile;
  AssetImage thumbnail;
  final picker = ImagePicker();
  @override
  void initState() { 
    super.initState();
    this.thumbnail = AssetImage(
      'assets/images/userThumbnail.png',
    );
  }

  Future<PickedFile> _openCamera() {
    return picker.getImage(source: ImageSource.camera);
  }
  
  Future<PickedFile> _openGallery() {
    return picker.getImage(source: ImageSource.gallery);
  }

  Future<picOptions> picFromWhere() async {
    return showDialog<picOptions>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Take a pic from:'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () { 
                Navigator.pop(
                  context,
                  picOptions.fromCamera
                ); 
              },
              child: ListTile(
                title: Text('Camera'),
                leading: Icon(Icons.camera_alt),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(
                  context, 
                  picOptions.fromGallery
                );
              },
              child: ListTile(
                title: Text('Gallery'),
                leading: Icon(Icons.image),
              ),
            ),
          ],
        );
      }
    );
    
  }

  Widget build(context) {
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
              image: DecorationImage(
                image: imageFile != null ? 
                  Image.file(
                      imageFile,
                    ).image
                  : thumbnail,
                fit: BoxFit.cover,
              )
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
                  bottom: -3.0,
                  right: -3.0,
                  child: FloatingActionButton(
                    child: Icon(
                      Icons.camera_alt, 
                      size: 15, 
                      color: Colors.amber[900],
                    ),
                    backgroundColor: Colors.grey[100],
                    elevation: 2,
                    mini: true,
                    onPressed: (){
                      picFromWhere()
                        .then((value) {
                          Future<PickedFile> response;
                          switch(value){
                            case picOptions.fromCamera:
                              response = this._openCamera();
                            break;
                            case picOptions.fromGallery:
                              response = this._openGallery();
                            break;
                          }
                          response.then((PickedFile value){
                            if (value != null) {
                              setState(() {
                                imageFile = File(value.path);
                              });
                            }
                            print(value.toString());
                          });
                        }).catchError((error) {
                          print(error.toString());
                        });
                      // Open a modal to select if take a pic from camera
                      // or get it from the media gallery
                    }
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
            title: Text(widget.title),
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
