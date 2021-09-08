
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mood_app/src/config/themes/colors.dart';
import 'package:mood_app/src/domain/entities/mood.dart';
import 'package:mood_app/src/presentation/blocs/moods_bloc.dart';
import 'package:mood_app/src/presentation/widgets/mood_widget.dart';

import '../../injector.dart';
class MoodListView extends StatefulWidget {
  const MoodListView({Key? key}) : super(key: key);

  @override
  _MoodListViewState createState() => _MoodListViewState();
}

class _MoodListViewState extends State<MoodListView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => injector<MoodsBloc>()..add(const GetMoodList()),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _buildAppbar(),
        body: _buildBody(),
      ),
    );
  }


  AppBar _buildAppbar(){
    return AppBar(
      centerTitle: true,
      backgroundColor: violet2,
      title: Text(
        'My Diary',
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

  Widget _buildBody(){
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bgimage.jpg'),
            fit: BoxFit.fill
          ),
        ),
        child: BlocBuilder<MoodsBloc, MoodsState>(
          builder: (_, state){
            if(state is MoodsListDone){
              return _buildMood(state.moodsList!);
            }else{
              return Center(
                child: CupertinoActivityIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildMood(List<Mood> moods){
    return Scrollbar(
      showTrackOnHover: true,
      radius: Radius.circular(15),
      child: ListView.builder(
        itemCount: moods.length,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/details', arguments: moods[index]);
              print(moods[index].name);
              print(moods[index].date);
              print(moods[index].pathToImg);
              print(moods[index].description);
            },
            child: MoodWidget(mood: moods[index]),
          );
        },
      ),
    );
  }

}
