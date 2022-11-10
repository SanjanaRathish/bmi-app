import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class SecondPage extends StatefulWidget {
  SecondPage({required this.bmi});

  double bmi;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue[900],
        title: Text("Result",style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold
        ),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.popAndPushNamed(context,'/');
                Navigator.pop(context);
              },//onPressed
              child: Text('Re-calculate',
                style: TextStyle(
                  fontSize: 20,
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
            Text("Your BMI is: ${widget.bmi.floor()}",style:TextStyle(
              fontSize: 50,
              color: Colors.white60
            )),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            Image.network(
                "https://fitnessvolt.com/wp-content/uploads/2022/07/BMI-Charts.jpg",
                height: 400,
                width: 1200),


          ],
        ),




      )
    );
  }
}
