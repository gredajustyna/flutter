import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mood_app/src/config/themes/colors.dart';
import 'package:mood_app/src/domain/entities/mood.dart';
import 'package:mood_app/src/injector.dart';
import 'package:mood_app/src/presentation/blocs/moods_bloc.dart';
import 'package:mood_app/src/presentation/widgets/mood_widget.dart';

class MoodDetailsView extends StatelessWidget {
  final Mood? mood;

  const MoodDetailsView({Key? key, this.mood}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => injector<MoodsBloc>(),
      child: Scaffold(
        appBar: _buildAppbar(),
        body: _buildBody(context),
      ),
    );
  }

  AppBar _buildAppbar(){
    return AppBar(
      centerTitle: true,
      backgroundColor: violet2,
      title: Text(
        'Mood Details',
        style: GoogleFonts.montserrat(
          letterSpacing: 2,
          color: pink1,
        ),
      ),
      leading: Builder(
          builder: (context){
            return GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(
                Ionicons.arrow_back,
                color: pink1,
              ),
            );
          }
      ),
    );
  }

  Widget _buildBody(BuildContext context){
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/bgimage.jpg'),
            fit: BoxFit.fill
        ),
      ),
      child: Column(
        children: [
          _buildContainer(context),
        ],
      ),
    );
  }

  Widget _buildHeader(){
    return Padding(
      padding: const EdgeInsets.only(top:10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(),
          _buildNameAndDate(),
        ],
      ),
    );
  }

  Widget _buildContainer(BuildContext context){
    double height = MediaQuery.of(context).size.height -200;
    print(height);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: pink1.withOpacity(0.4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildDescriptionText(),
            _buildDescriptionBody(context, height),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(){
    return RawMaterialButton(
        padding: EdgeInsets.all(5),
        onPressed: (){
        },
        splashColor: Colors.transparent,
        shape: CircleBorder(),
        fillColor: getImgColor(mood!.name),
        elevation: 0,
        child: Image(
          image: AssetImage(mood!.pathToImg),
          width: 50,
        ),
      );
  }

  Widget _buildNameAndDate(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('date: ',
              style: GoogleFonts.montserrat(
                color: violet2,
                fontSize: 20,
              ),
            ),
            Text(mood!.date!,
              style: GoogleFonts.montserrat(
                color: dark1,
                fontSize: 20,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('mood: ',
              style: GoogleFonts.montserrat(
                color: violet2,
                fontSize: 20,
              ),
            ),
            Text(mood!.name,
              style: GoogleFonts.montserrat(
                color: dark1,
                fontSize: 20,
              ),
            )
          ],
        ),
      ],
    );
  }


  Widget _buildDescriptionText(){
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
      child: Text(
        'description: ',
        textAlign: TextAlign.left,
        style: GoogleFonts.montserrat(
          color: violet2,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _buildDescriptionBody(BuildContext context, double height){
    print(height);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: Container(
        height: height-135,
        child: Scrollbar(
          radius: Radius.circular(15),
          showTrackOnHover: true,
          isAlwaysShown: true,
          child: SingleChildScrollView(
            child: Text(
              mood!.description!,
              textAlign: TextAlign.justify,
              style: GoogleFonts.raleway(
                color: dark1,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color getImgColor(String moodName){
    switch(moodName){
      case 'Very sad':
        return verySad;
      case 'Sad':
        return sad;
      case 'Neutral':
        return neutral;
      case 'Happy':
        return happy;
      case 'Very happy':
        return veryHappy;
      default:
        return Colors.grey;
    }
  }
}
