import 'package:dont_let_me_go/screens/home.dart';
import 'package:dont_let_me_go/shared/big_text_style.dart';
import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:dont_let_me_go/services/database_service.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'loading.dart';


class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {



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
          children: [
            SizedBox(height: 100),
            DelayedDisplay(
              delay: Duration(milliseconds: 500),
              slidingBeginOffset: Offset(-1, 0),
              child: Padding(
                padding: const EdgeInsets.only(right: 100.0),
                child: Text('Go ECO!',
                style: bigTextStyle,
                ),
              ),
            ),
            DelayedDisplay(
              delay: Duration(milliseconds: 1000),
              slidingBeginOffset: Offset(1, 0),
              child: Container(
                height: 280,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/start_image.png'),
                  ),
                ),
              ),
            ),
            DelayedDisplay(
              delay: Duration(milliseconds: 1500),
              slidingBeginOffset: Offset(-1, 0),
              child: Padding(
                padding: const EdgeInsets.only(left: 100.0),
                child: Text('Track the expiration dates',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Mulish',
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 120),
            DelayedDisplay(
              delay: Duration(milliseconds: 2000),
              child: RawMaterialButton(
                onPressed: () async{
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => HomePage()));
                },
                fillColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                  child: Text('Get started',
                    style: TextStyle(
                        color: Color(0xff74a651),
                      fontFamily: 'Mulish',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              ),
            ),
          ],
        ),
      ),
    );
  }



}
