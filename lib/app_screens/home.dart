import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Container(
          padding: EdgeInsets.only(left: 10.0, top: 40.0),
            alignment: Alignment.center,
            color: Colors.deepPurple,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                          "Air Jamaica",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 25.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        )),
                    Expanded(
                      child: Text(
                        "From Jamaica to United States",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 15.0,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ) ,
                    )

                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                          "Air India",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 25.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        )),
                    Expanded(
                      child: Text(
                        "From India to Mexico",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 15.0,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ) ,
                    )
                  ],
                ),

                FlightImageAsset(),
                FlightBookButton()

              ],
            )

           ));
  }
}

class FlightImageAsset extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/flights.png');
    Image image = Image(image: assetImage, width: 450.0, height: 450.0);
    return Container(child: image,);
  }
}

class FlightBookButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      width: 250.0,
      child: RaisedButton(
        color: Colors.deepOrange,
        child: Text(
          "Book Your Flight",
          style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 20.0,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
              color: Colors.white),),
        elevation: 6.0,
        onPressed: () {
          bookFlight(context);
        },
      ),
    );
  }

  void bookFlight(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Flight Booked Successfully"),
      content: Text("Have a pleasant flight"),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        }
    );
  }
}
