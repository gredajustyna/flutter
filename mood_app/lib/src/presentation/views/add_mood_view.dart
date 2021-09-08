
import 'dart:io';

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mood_app/src/config/themes/colors.dart';
import 'package:mood_app/src/core/bloc/bloc_with_state.dart';
import 'package:mood_app/src/domain/entities/mood.dart';
import 'package:mood_app/src/injector.dart';
import 'package:mood_app/src/presentation/blocs/default%20list/default_list_bloc.dart';
import 'package:mood_app/src/presentation/blocs/default%20list/default_list_event.dart';
import 'package:mood_app/src/presentation/blocs/moods_bloc.dart';
import 'package:mood_app/src/presentation/blocs/select_mood_bloc.dart';
import 'package:mood_app/src/presentation/blocs/select_mood_event.dart';

class AddMoodView extends StatefulWidget {
  const AddMoodView({Key? key}) : super(key: key);

  @override
  _AddMoodViewState createState() => _AddMoodViewState();
}

class _AddMoodViewState extends State<AddMoodView> {
  //MOOD TO BE ADDED TO THE DB
  late Mood mood;

  //LIST OF MOODS TO CHOOSE FROM
  late List<Mood> moodsToChooseFrom =[];

  //PATHS TO IMAGES WITH MOODS
  List<String> imgPaths = ['assets/faces5.png', 'assets/faces4.png', 'assets/faces1.png', 'assets/faces3.png', 'assets/faces2.png'];

  //COLORS OF FACES WITH MOODS
  List<Color> moodColors = [verySad, sad, neutral, happy, veryHappy];

  //CONTROLLER OF MOOD DESCRIPTION FIELD
  TextEditingController textEditingController = TextEditingController();

  //SELECTMOODBLOC TO SELECT THE MOOD
  SelectMoodBloc selectMoodBloc = SelectMoodBloc(injector());



  @override
  void initState() {
    //initialize the moodsToChooseFrom list
    moodsToChooseFrom.add(new Mood(name: 'Very sad', pathToImg: 'assets/faces5.png'));
    moodsToChooseFrom.add(new Mood(name: 'Sad', pathToImg: 'assets/faces4.png'));
    moodsToChooseFrom.add(new Mood(name: 'Neutral', pathToImg: 'assets/faces1.png'));
    moodsToChooseFrom.add(new Mood(name: 'Happy', pathToImg: 'assets/faces3.png'));
    moodsToChooseFrom.add(new Mood(name: 'Very happy', pathToImg: 'assets/faces2.png'));
    print("Length of list after initializing: ${moodsToChooseFrom.length}");

    //SET THE CURRENT DATE FOR THE MOOD
    String moodDate = DateTime.now().day.toString()
        + '-' + DateTime.now().month.toString()
        + '-' + DateTime.now().year.toString();

    //GENERATE NEW MOOD INSTANCE TO BE PUT TO THE DB
    mood = new Mood(name: moodsToChooseFrom[2].name, date: moodDate, pathToImg: imgPaths[2], description: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => injector<MoodsBloc>(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: _buildAppbar(),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody(){
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bgimage.jpg'),
            fit: BoxFit.fill
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            _buildFrontPic(),
            _buildGreetingText(),
            _buildSecondText(),
            SizedBox(height: 30,),
            _buildAskText(),
            SizedBox(height: 10,),
            _buildMoodsRow(),
            SizedBox(height: 10,),
            _buildDescriptionText(),
            SizedBox(height: 10,),
            _buildDescriptionBox(),
            SizedBox(height: 30,),
            _buildSaveButton(),
          ],
        ),
    );
  }

  AppBar _buildAppbar(){
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0,15, 0),
          child: Builder(
            builder: (context) {
              return GestureDetector(
                onTap: () => _onShowSavedMoodsViewTapped(context),
                child: Icon(
                    Ionicons.calendar_outline,
                  color: pink1,
                ),
              );
            },
          ),
        ),
      ],
      backgroundColor: Colors.transparent,
    );
  }

  Widget _buildFrontPic(){
    return DelayedDisplay(
      delay: Duration(milliseconds: 1000),
      slidingBeginOffset: Offset(-1,0),
      child: Container(
        child: CircleAvatar(
          radius: 60,
          backgroundColor: pink1,
          child: Image(
            image: AssetImage('assets/greetingFace.png'),
          ),
        )
      ),
    );
  }

  Widget _buildGreetingText(){
    return DelayedDisplay(
      delay: Duration(milliseconds: 1500),
      child: Text('Track your mood!',
        style: GoogleFonts.montserrat(
          letterSpacing: 2,
          color: pink1,
          fontSize: 30,
        ),
      ),
    );
  }

  Widget _buildSecondText(){
    return DelayedDisplay(
      delay: Duration(milliseconds: 2000),
      child: Text('All your feelings in one place',
        style: GoogleFonts.raleway(
          letterSpacing: 1,
          color: pink1,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _buildAskText(){
    return DelayedDisplay(
      delay: Duration(milliseconds: 2500),
      child: Text('Select how do you feel today:',
        style: GoogleFonts.montserrat(
          letterSpacing: 1,
          color: pink1,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _buildMoodsRow(){
    return DelayedDisplay(
      delay: Duration(milliseconds: 3000),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for(int i=0; i<moodsToChooseFrom.length; i++) _buildMoodButton(i),
          ],
        ),
      )
    );
  }

  Widget _buildMoodButton(int index){
    return Builder(
      builder: (context){
        return Expanded(
          child: GestureDetector(
            onTap: (){
              setState(() {
                _onMoodButtonPressed(context, index);
              });
            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
                border: Border.all(
                  width: 4,
                  color: imgPaths[index] == mood.pathToImg ? violet2 : Colors.transparent,
                ),
                color: moodColors[index],
              ),
              child: Image(
                image: AssetImage(imgPaths[index],),
                width: 50,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDescriptionText(){
    return DelayedDisplay(
      delay: Duration(milliseconds: 3500),
      child: Text('Provide a little description:',
        style: GoogleFonts.montserrat(
          letterSpacing: 1,
          color: pink1,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _buildDescriptionBox(){
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return DelayedDisplay(
      delay: Duration(milliseconds: 4000),
      child: Container(
        width: MediaQuery.of(context).size.width-50,
        decoration: BoxDecoration(
          color: pink1,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            scrollPadding: EdgeInsets.only(bottom:40),
            controller: textEditingController,
            onChanged: (val){
              mood.description = val;
            },
            maxLines: 6,
            style: GoogleFonts.raleway(
              color: violet2,
            ),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    color: violet2,
                    width: 2
                ),
              ),
              fillColor: pink1,
              hintText: "Enter your text here",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    color: violet1,
                    width: 5,
                ),
              ),

            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSaveButton(){
    return Builder(
      builder: (context) =>
      DelayedDisplay(
        delay: Duration(milliseconds: 4500),
        child: ElevatedButton(
          child: Text(
            'Save',
            style: GoogleFonts.montserrat(
              letterSpacing: 2,
              color: violet2,
              fontSize: 20,
            ),
          ),
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
                EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
            backgroundColor: MaterialStateProperty.all<Color>(pink1),
            elevation: MaterialStateProperty.all<double>(0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  side: BorderSide(color: violet2),
              ),
            ),
          ),
          onPressed: () => _onSaveButtonPressed(context),
        )
      ),
    );
  }

  void _onSaveButtonPressed(BuildContext context){
    BlocProvider.of<MoodsBloc>(context).add(AddMood(mood));
    Scaffold.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text('Mood added successfully!',
        ),
      ),
    );
    textEditingController.clear();
  }

  void _onMoodButtonPressed(BuildContext context, int index){
    selectMoodBloc.add(ButtonWithMoodClickedEvent(moodsToChooseFrom, index));
    mood.pathToImg = selectMoodBloc.state.pathToImg;
    setState(() {});
    mood.name = selectMoodBloc.state.name;
    print(moodsToChooseFrom[index].name);
  }

  void _onShowSavedMoodsViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/diary');
  }

}
