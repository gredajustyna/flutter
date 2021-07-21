import 'package:dont_let_me_go/shared/big_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('We are checking your fridge...',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 30.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            SpinKitFadingCircle(
              color: Colors.white,
              size: 70.0,
            ),
          ],
        ),
      ),
    );
  }
}
