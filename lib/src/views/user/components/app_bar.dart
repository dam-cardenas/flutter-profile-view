import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

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
  
  /// This function  makes the action of get and crop an image 
  /// 
  /// @param {ImageSource} source
  Future<bool> getImage(ImageSource source) async {
    PickedFile image = await picker.getImage(source: source);
    if (image != null) {
      try {
        File cropped = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(
            ratioX: 1,
            ratioY: 1
          ),
          compressQuality: 100,
          maxWidth: 700,
          maxHeight: 700,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
            toolbarColor: Colors.deepOrange,
            toolbarTitle: 'Adjust your profile image',
            statusBarColor: Colors.deepOrange.shade900,
            backgroundColor: Colors.white,
          )
        );
        this.setState(() {
          imageFile = cropped;
        });
        return true;
      } catch (err) {
        return false;
      }
    } else {
      return false;
    }
  }
  

  Future<dynamic> submitImage() {

  }

  /// This function asks the user the place to take the image
  Future<ImageSource> picFromWhere() async {
    return showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Take a pic from:'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () { 
                Navigator.pop(
                  context,
                  ImageSource.camera
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
                  ImageSource.gallery
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
                        .then(( ImageSource source) {
                          getImage(source);
                        }).catchError((error) {
                          print(error.toString());
                        });
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
