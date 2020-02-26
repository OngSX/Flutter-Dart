import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _acont = TextEditingController();
  final TextEditingController _bcont = TextEditingController();
  final TextEditingController _ccont = TextEditingController();
  final TextEditingController _dcont = TextEditingController();
  double a = 0.0, b = 0.0, c = 0.0, d = 0.0, result = 0.0;
  int aInt = 0, bInt = 0, cInt = 0, dInt = 0, resultA = 0, resultB = 0;
  var _choice = ['+', '-', '*', '/'];
  var _currentItemSelected = '+';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fraction Calculator',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fraction Calculator'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            controller: _acont,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0))),
                          ),
                        ),
                        Divider(
                          indent: 10,
                          endIndent: 10,
                          thickness: 2.5,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            controller: _bcont,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(color: Colors.grey[600]),
                      ),
                      child: Column(
                        children: <Widget>[
                          DropdownButton<String>(
                            items: _choice.map((String dropDownStringItem) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringItem,
                                child: Text(dropDownStringItem),
                              );
                            }).toList(),
                            onChanged: (String newValueSelected) {
                              _dropDownItemSelected(newValueSelected);
                            },
                            value: _currentItemSelected,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            controller: _ccont,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0))),
                          ),
                        ),
                        Divider(
                          indent: 10,
                          endIndent: 10,
                          thickness: 2.5,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            controller: _dcont,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text("= "),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Text("$result"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: () => _onPress(_currentItemSelected),
                      child: Text("Calculate"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: () {
                        _acont.clear();
                        _bcont.clear();
                        _ccont.clear();
                        _dcont.clear();
                      },
                      child: Text('Reset'),
                    ),
                  ),
                ],
              ),
              Text('Result in fraction: '),
              Text('$resultA'),
              Flexible(
                child: Container(
                  height: 10,
                  width: 35,
                  child: Divider(
                    indent: 10,
                    endIndent: 10,
                    thickness: 2.5,
                    color: Colors.white,
                  ),
                ),
              ),
              Text('\t$resultB'),
            ],
          ),
        ),
      ),
    );
  }

  void _dropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }

  void _onPress(String _currentItemSelected) {
    setState(() {
      a = double.parse(_acont.text);
      b = double.parse(_bcont.text);
      c = double.parse(_ccont.text);
      d = double.parse(_dcont.text);

      aInt = a.round();
      bInt = b.round();
      cInt = c.round();
      dInt = d.round();

      if (_currentItemSelected == '+') {
        result = ((a * d) + (b * c)) / (b * d);
        resultA = (aInt * dInt) + (bInt * cInt);
        resultB = (bInt * dInt);
      }
      if (_currentItemSelected == '-') {
        result = ((a * d) - (b * c)) / (b * d);
        resultA = (aInt * dInt) - (bInt * cInt);
        resultB = (bInt * dInt);
      }
      if (_currentItemSelected == '*') {
        result = (a * c) / (b * d);
        resultA = aInt * cInt;
        resultB = bInt * dInt;
      }
      if (_currentItemSelected == '/') {
        result = (a * d) / (b * c);
        resultA = aInt * dInt;
        resultB = bInt * cInt;
      }
      for (int i = 2; i <= 99999; i++) {
        if (resultA % i == 0 && resultB % i == 0) {
          resultA = (resultA / i).round();
          resultB = (resultB / i).round();
        }
      }
    });
  }
}
