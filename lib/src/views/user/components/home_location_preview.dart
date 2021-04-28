
import 'package:flutter/material.dart';

enum HomeLocation {latitude, longitude, milesAround}

class HomeLocationPreview extends StatefulWidget {
  final Map<HomeLocation,dynamic> data;
  final Function onEdit;
  
  HomeLocationPreview(
    {
      this.data,
      @required this.onEdit
    }
  );
  @override
  _HomeLocationPreview createState() => _HomeLocationPreview();
}
class _HomeLocationPreview extends State<HomeLocationPreview> {
 
  @override
  void initState() { 
    super.initState();
  }

  // TODO: Remove map preview
  Widget build(context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(
            'Home location',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 20,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.grey[100]
          ),
          child: Column(
            children: [
              Container( 
                width: MediaQuery.of(context).size.width,
                child: 
                Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 1.0,
                        horizontal: 30.0, 
                      ),
                      dense: true,
                      title: Text(
                        'Latitude',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Text('${widget.data[HomeLocation.latitude]}'),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 1.0,
                        horizontal: 30.0, 
                      ),
                      dense: true,
                      title: Text(
                        'Longitude',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Text('${widget.data[HomeLocation.longitude]}'),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 1.0,
                        horizontal: 30.0, 
                      ),
                      dense: true,
                      title: Text(
                        'Miles Around',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Text('${widget.data[HomeLocation.milesAround].round()}'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20,),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 47.0,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.amber[900],
              onPrimary: Colors.white,
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(6.0),
                ),
              ),
            ),
            onPressed: (){
            },
            child: Text("Edit"),
          ),
        ),
        SizedBox(height: 60,),
      ],
    );
  }
}
