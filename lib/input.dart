import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bmi_calculator/output.dart';
import 'package:bmi_calculator/model.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _formKey = GlobalKey<FormState>();
  Model model = Model(
    age: 0,
    height: 0,
    weight: 0,
  );

  String result = '';
  double idx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(25, 106, 218, 1),
        title: Text("Submit Details", style: GoogleFonts.lato(fontSize: 20)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.width * .22),
            Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  'Enter Details to calculate',
                  style: GoogleFonts.lato(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: const Color.fromRGBO(101, 100, 100, 1)),
                  textAlign: TextAlign.center,
                )),
            Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  'Body Mass Index!',
                  style: GoogleFonts.lato(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: const Color.fromRGBO(25, 106, 218, 1)),
                  textAlign: TextAlign.center,
                )),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.asset("assets/images/img1.png", height: 55))),
            Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 20),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter Age',
                                labelStyle: TextStyle(
                                  color: Color.fromRGBO(179, 177, 177, 1),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                )),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some value';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              model.age = double.parse(value!);
                            },
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 20),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter Height in cm',
                                labelStyle: TextStyle(
                                  color: Color.fromRGBO(179, 177, 177, 1),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                )),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some value';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              model.height = double.parse(value!);
                            },
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 20),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter Weight in Kg',
                                labelStyle: TextStyle(
                                  color: Color.fromRGBO(179, 177, 177, 1),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                )),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some value';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              model.weight = double.parse(value!);
                            },
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState?.save();
                              double idxval = model.weight /
                                  ((model.height) * (model.height) * (0.0001));
                              idxval = double.parse(idxval.toStringAsFixed(2));
                              setState(() {
                                idx = idxval;
                                print(idx);
                              });
                              if (idx < 18.5 && idx > 0) {
                                setState(() {
                                  result = "Under Weight!";
                                });
                              } else if (idx <= 24.9 && idx >= 18.5) {
                                setState(() {
                                  result = "Normal!";
                                });
                              } else if (idx >= 25 && idx <= 29.9) {
                                setState(() {
                                  result = "Over Weight!";
                                });
                              } else if (idx >= 30 && idx <= 34.9) {
                                setState(() {
                                  result = "at Obesity (Class I)!";
                                });
                              } else if (idx >= 35 && idx <= 39.9) {
                                setState(() {
                                  result = "at Obesity (Class II)!";
                                });
                              } else if (idx >= 40) {
                                setState(() {
                                  result = "at Extreme Obesity!";
                                });
                              }
                              if (result != '') {
                                print(result);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          OutputPage(result: result, idx: idx)),
                                );
                              }
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  const MaterialStatePropertyAll<Color>(
                                Color.fromRGBO(25, 106, 218, 1),
                              ),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ))),
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                'Submit Details',
                                style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800),
                                textAlign: TextAlign.center,
                              )),
                        ),
                      )
                    ]))
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
