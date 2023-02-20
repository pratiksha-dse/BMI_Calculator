import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bmi_calculator/input.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(25, 106, 218, 1),
        title: Text(widget.title,style:GoogleFonts.lato(fontSize: 20)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.width * 0.22),
            // Padding(
            //     padding: const EdgeInsets.only(right: 15),
            //     child: ClipRRect(
            //       borderRadius: BorderRadius.circular(7.0),
            //       child: Image.network(
            //         "https://raw.githubusercontent.com/pratiksha-dse/BMI_Calculator/main/assets/images/img1.png",
            //         // height: 45.0,
            //       ),
            //     )),
        Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  'Welcome to',
                  style:GoogleFonts.lato(
                      fontSize: 27,
                      fontWeight: FontWeight.w900,
                      color: const Color.fromRGBO(101, 100, 100, 1)),
                  textAlign: TextAlign.center,
                )),
             Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  'BMI Calculator!',
                  style:GoogleFonts.lato(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color:const Color.fromRGBO(25, 106, 218, 1)),
                  textAlign: TextAlign.center,
                )),
                 Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7.0),
                  child: Image.network(
                    "https://raw.githubusercontent.com/pratiksha-dse/BMI_Calculator/main/assets/images/img1.png",
                    // height: 45.0,
                  ),
                )),
                Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InputPage()),
                        );
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll<Color>(
                               Color.fromRGBO(25, 106, 218, 1),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ))),
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              'Start',
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800),
                              textAlign: TextAlign.center,
                            )),
                      ),
                    )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
