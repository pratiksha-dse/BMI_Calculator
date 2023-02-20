import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutputPage extends StatefulWidget {
  const OutputPage({super.key, required this.result, required this.idx});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String result;
  final double idx;

  @override
  State<OutputPage> createState() => _OutputPageState();
}

class _OutputPageState extends State<OutputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(25, 106, 218, 1),
        title: Text("BMI Calculator Result",
            style: GoogleFonts.lato(fontSize: 20)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.width * 0.1),
            Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  'Result From',
                  style: GoogleFonts.lato(
                      fontSize: 27,
                      fontWeight: FontWeight.w900,
                      color: const Color.fromRGBO(101, 100, 100, 1)),
                  textAlign: TextAlign.center,
                )),
            Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  'BMI Calculator!',
                  style: GoogleFonts.lato(
                      fontSize: 27,
                      fontWeight: FontWeight.w900,
                      color: const Color.fromRGBO(25, 106, 218, 1)),
                  textAlign: TextAlign.center,
                )),
            Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7.0),
                  child: Image.asset("assets/images/bmi.jpg")
                )),
            Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  "BMI: ${widget.idx}",
                  style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: const Color.fromRGBO(101, 100, 100, 1)),
                  textAlign: TextAlign.center,
                )),
            Divider(
                indent: MediaQuery.of(context).size.width * .2,
                thickness: 2,
                endIndent: MediaQuery.of(context).size.width * .2),
            Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  'You are',
                  style: GoogleFonts.lato(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: const Color.fromRGBO(101, 100, 100, 1)),
                  textAlign: TextAlign.center,
                )),
            Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  widget.result,
                  style: GoogleFonts.lato(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: const Color.fromRGBO(25, 106, 218, 1)),
                  textAlign: TextAlign.center,
                )),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
