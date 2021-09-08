import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mood_app/src/config/themes/colors.dart';
import 'package:mood_app/src/domain/entities/mood.dart';

class MoodWidget extends StatelessWidget {
  final Mood mood;

  const MoodWidget({Key? key, required this.mood}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
        height: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: pink1.withOpacity(0.4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildImage(),
            _buildDateAndDescription(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(){
    return Expanded(
      flex: 1,
      child: RawMaterialButton(
        padding: EdgeInsets.all(5),
        onPressed: (){
        },
        splashColor: Colors.transparent,
        shape: CircleBorder(),
        fillColor: getImgColor(mood.name),
        elevation: 0,
        child: Image(
          image: AssetImage(mood.pathToImg),
          width: 50,
        ),
      ),
    );
  }

  Widget _buildDateAndDescription(){
    return Expanded(
      flex: 3,
      child: Padding(
      padding: EdgeInsets.symmetric(vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mood.date!,
              style: GoogleFonts.montserrat(
                color: violet2,
                fontSize: 20,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  mood.description!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.raleway(
                    color: dark1,
                    fontSize: 15
                  ),
                ),
              ),
            ),

          ],
        ),
      )
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
