import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyCalculations(),
    theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent),
  ));
}

class MyCalculations extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _myStateChange();
  }
}

class _myStateChange extends State<MyCalculations> {
  var _formKey = GlobalKey<FormState>();

  String selected = "Dollars";
  var _currencies = ['Dollars', 'Pounds', 'Euro'];
  String _outPutString = "";

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Simple Interest Calculator"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              bankImageAsset(),
              Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: textStyle,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter principal amount';
                      }
                    },
                    controller: principalController,
                    decoration: InputDecoration(
                        labelText: 'Principal',
                        labelStyle: textStyle,
                        errorStyle: TextStyle(
                          color: Colors.yellowAccent,
                          fontSize: 15.0
                        ),
                        hintText: 'Enter Princiapal e.g. 12000',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: textStyle,
                    controller: roiController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter interest';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'Rate of Interest',
                        hintText: 'In percent',
                        labelStyle: textStyle,
                        errorStyle: TextStyle(
                            color: Colors.yellowAccent,
                            fontSize: 15.0
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              Container(
                  child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(
                            top: 10.0, bottom: 10.0, right: 10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: textStyle,
                          controller: termController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter principal term';
                            }
                          },
                          decoration: InputDecoration(
                              labelText: 'Term',
                              hintText: 'Time in Years',
                              labelStyle: textStyle,
                              errorStyle: TextStyle(
                                  color: Colors.yellowAccent,
                                  fontSize: 15.0
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        )),
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                      value: selected,
                      items: _currencies.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      onChanged: (String newValueSelected) {
                        setState(() {
                          selected = newValueSelected;
                        });
                      },
                    ),
                  )
                ],
              )),
              Container(
                  child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Colors.green,
                      child: Text(
                        'Caculate',
                        style: textStyle,
                      ),
                      onPressed: () {
                        setState(() {
                          if(_formKey.currentState.validate()){
                            _outPutString = _calculateTotalReturns();
                          }
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Colors.red,
                      child: Text(
                        'Reset',
                        style: textStyle,
                      ),
                      onPressed: () {
                        setState(() {
                          _resetValues();
                        });
                      },
                    ),
                  )
                ],
              )),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  _outPutString,
                  style: textStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String _calculateTotalReturns() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable = principal + (principal * roi * term) / 100;

    String result =
        'After $term year, your investment will be worth $totalAmountPayable $selected';
    return result;
  }

  String _resetValues() {
    principalController.clear();
    roiController.clear();
    termController.clear();
    selected = 'Dollars';
    _outPutString = '';
  }
}

class bankImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/bank.png');
    Image image = Image(image: assetImage, width: 180.0, height: 180.0);
    return Container(
        child: Padding(
      padding: EdgeInsets.only(top: 40.0),
      child: image,
    ));
  }
}
