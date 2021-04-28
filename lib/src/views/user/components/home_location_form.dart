import 'package:flutter/material.dart';
import 'custom_slider.dart';

class HomeLocationForm extends StatefulWidget {
  final Function onSubmit;
  final double zoom;
  final double radius;
  final double latitude;
  final double longitude;
  final double minzoom = 3;
  final double maxzoom = 18;
  final double minRadius = 1609;
  final double maxRadius = 48280;
  final double mileInMeters = 1609.34;

  HomeLocationForm(
    {
      @required this.onSubmit,
      this.zoom = 3,
      this.radius = 1609,
      this.latitude = 0.0,
      this.longitude = 0.0,
    }
  );
  @override
  _HomeLocationForm createState() => _HomeLocationForm();
}
class _HomeLocationForm extends State<HomeLocationForm> {
  double _zoom;
  double _radius;
  double _longitude;
  double _latitude;
  @override
  void initState() { 
    super.initState();
    this._zoom = widget.zoom;
    this._radius = widget.radius;
    this._latitude = widget.latitude;
    this._longitude = widget.longitude;
  }

  // TODO: Add a vertical slider
  // add bottom menu with a slider and a custom icon
  Widget build(context) {
    return Stack(
      children: [
        Positioned(
          right: 15,
          top:  MediaQuery.of(context).size.height * 0.1,
          width: 30,
          height: MediaQuery.of(context).size.height * 0.5,
          child: RotatedBox(
            quarterTurns: -1,
            child: Container(
              width: MediaQuery.of(context).size.height * 0.5,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1.0,
                    spreadRadius: 0.1,
                    offset: Offset.zero,
                    color: Colors.grey[400],
                  )
                ]
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Icon(
                        Icons.remove,
                        color: Colors.amber[900],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.grey[400],
                        inactiveTrackColor: Colors.grey[400],
                        thumbColor: Colors.amber[900],
                      ),
                      child: Slider(
                        min: widget.minzoom,
                        max: widget.maxzoom,
                        value: this._zoom?? widget.minzoom,
                        label: this._zoom.toString(),
                        onChanged: (double value){
                          setState(() {
                            this._zoom = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Icon(
                      Icons.add,
                      color: Colors.amber[900],
                    ),
                  ),
                ],
              )   
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 1.0,
                  spreadRadius: 0.1,
                  offset: Offset.zero,
                  color: Colors.grey[400],
                )
              ]
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Icon(
                          Icons.track_changes_rounded,
                          color: Colors.amber[900],
                        ),
                      ),
                      Expanded(
                        flex: 9,
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: Colors.white,
                            valueIndicatorColor: Colors.white,
                            thumbShape: CustomSliderThumbCircle(
                              thumbRadius: 15.0,
                              min: 1,
                              max: 30,
                            ),
                          ),
                          child: Slider(
                            min: widget.minRadius,
                            max: widget.maxRadius,
                            activeColor: Colors.amber[900],
                            inactiveColor: Colors.grey[400],
                            divisions: 29,
                            value: this._radius?? widget.radius,
                            onChanged: (double value) {
                              setState(() {
                                print((value/widget.mileInMeters).round());
                                this._radius = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),  
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 19.0,
                  ),
                  child: Row(
                    children: [ 
                      Expanded(
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
                            final Map<String,dynamic> response = {
                              'radius': (this._radius/widget.mileInMeters).round(),
                              'zoom': this._zoom.round(),
                              'latitude': this._latitude,
                              'longitude': this._longitude,
                            };
                            widget.onSubmit(response);
                          },
                          child: Text("Save"),
                        ),
                      ),
                    ],
                  ),
                ),  
              ],
            ),
          ),
        )
      ],
    );
  }
}
