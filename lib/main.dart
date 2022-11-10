import 'package:flutter/material.dart';
import 'package:my1stapp/SecondPage.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/',
      // routes: {
      //   '/':(context)=>MyHomePage(),
      // },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double height = 170;
  double weight = 58;
  double bmi = 0;
  void _bnmi() {
    bmi= ((weight / (height * height)) * 10000);}

  void _dec() {
    setState(() {
      weight--;
    });
  }

  void _inc() {
    setState(() {
      weight++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Calculate your BMI:",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
              height: 80,
              width: 300,
              color: Colors.purpleAccent[100],
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Weight in kg:',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 8),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
    //                   IconButton(
    //                       iconSize: 50,
    //                       icon: const Icon(
    //                     Icons.add,
    //                 ),
    //                       onPressed:(){
    //                         setState(() {
    //                           weight++;
    //                         });
    // },),
                      ElevatedButton(
                          child: Text("+", style: TextStyle(fontSize: 10)),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(15)),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      side: BorderSide(color: Colors.red)))),
                          onPressed: () => (_inc())),
                      SizedBox(width: 10),
                      Text(
                        "${weight.round()}",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 8),
          //             IconButton(
          //                 iconSize:50,
          //                 icon: const Icon(
          //                   Icons.add,
          //                 ),
          //                 onPressed:(){
          //                   setState(() {
          //                     weight--;
          //                   });
          // })
                      ElevatedButton(
                        child: Text("-", style: TextStyle(fontSize: 10)),
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    side: BorderSide(color: Colors.red)))),
                        onPressed: () => (_dec()),
                      )
                    ])
                  ])),
          Container(
            height: 80,
            width: 300,
            color: Colors.blueGrey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Height in cm: ${height.round()}",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Slider(
                    value: height,
                    min: 50,
                    max: 300,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    })
              ],
            ),
          ),
            // GestureDetector(
            //   onTap:() {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => SecondPage()));
            //   },
            // ),
          Container(
              height: 80,
              width: 300,
              color: Colors.deepPurpleAccent,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, '/second',arguments: Argument(bmi: bmi));
                        _bnmi();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SecondPage(bmi:bmi)),
                        ); //navigator.push
                      },//onPressed
                      child: Text('Calculate',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff000000),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // <-- Radius
                        ),
                      ),
                    ),
                  ])),
          Image.network(
              "https://possible.in/wp-content/uploads/2020/11/Chart.jpg",
              height: 200,
              width: 1000),
        ],
      ),
    );
  }
}
