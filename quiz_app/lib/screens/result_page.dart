import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screens/greeting.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:delayed_display/delayed_display.dart';


class ResultPage extends StatefulWidget{

  String resultString;
  String resultDescription = '';

  ResultPage({Key? key, required this.resultString}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  static const textStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'Yeseva',
    fontSize: 20.0,
  );

  late String resultString;
  late String resultDescription;

  @override
  void initState() {
    this.resultString = widget.resultString;
    this.resultDescription = getText(resultString);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 70),
              Text(
                'Your result is...',
                style: textStyle,
              ),
              SizedBox(height: 20),
              DelayedDisplay(
                delay: Duration(seconds: 1),
                child: DefaultTextStyle(
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 60.0,
                    fontFamily: 'Yeseva',
                    color: Colors.white,
                  ),
                  child: AnimatedTextKit(
                    totalRepeatCount: 1,
                    pause: Duration(milliseconds: 500),
                    animatedTexts: [
                      TypewriterAnimatedText(resultString)],
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 250,
                child: Image(
                    image: AssetImage('assets/result2.png')
                ),
              ),
              DelayedDisplay(
                delay: Duration(seconds: 2),
                fadingDuration: Duration(seconds: 1),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                    resultDescription,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              DelayedDisplay(
                delay: Duration(seconds: 2),
                fadingDuration: Duration(seconds: 1),
                child: RichText(
                    text: new TextSpan(
                      children: [
                        new TextSpan(
                          text: 'Personalities descriptions provided by myersbriggs.org. ',
                          style: new TextStyle(
                              color: Colors.purple,
                            fontSize: 10,
                            fontFamily: 'Montserrat'
                          ),
                        ),
                        new TextSpan(
                          text: 'Learn more',
                          style: new TextStyle(
                              color: Colors.purple[700],
                              fontSize: 10,
                              fontFamily: 'Montserrat'
                          ),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () {
                              _launchURL();
                            },
                        ),
                      ],
                    ),
                ),
              ),
              SizedBox(height: 60),
              DelayedDisplay(
                delay: Duration(seconds: 3),
                child: RawMaterialButton(
                  onPressed: (){
                    Navigator.popUntil(context, ModalRoute.withName('greeting'));
                    //Navigator.pop(context, Greeting());
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Greeting()));
                  },
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.purple,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  fillColor: Colors.white,
                  elevation: 4,
                  splashColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 60, top: 15, right: 60, bottom: 15),
                    child: Text("Repeat quiz",
                      style: TextStyle(
                        color: Colors.purple,
                        fontFamily: 'Yeseva',
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );


  }

  String getText(String resultString){
    switch(resultString){
      case 'ISTJ':
        return 'Quiet, serious, earn success by thoroughness and dependability. '
            'Practical, matter-of-fact, realistic, and responsible. '
            'Decide logically what should be done and work toward it steadily, regardless of distractions. '
            'Take pleasure in making everything orderly and organized - their work, their home, their life. '
            'Value traditions and loyalty.';
      case 'ISFJ':
        return 'Quiet, friendly, responsible, and conscientious. '
            'Committed and steady in meeting their obligations. '
            'Thorough, painstaking, and accurate. '
            'Loyal, considerate, notice and remember specifics about people who are important to them, '
            'concerned with how others feel. Strive to create an orderly and harmonious environment at work and at home.';
      case 'INFJ':
        return 'Seek meaning and connection in ideas, relationships, and material possessions. '
            'Want to understand what motivates people and are insightful about others. '
            'Conscientious and committed to their firm values. '
            'Develop a clear vision about how best to serve the common good. '
            'Organized and decisive in implementing their vision.';
      case 'INTJ':
        return 'Have original minds and great drive for implementing their ideas and achieving their goals. '
            'Quickly see patterns in external events and develop long-range explanatory perspectives. '
            'When committed, organize a job and carry it through. '
            'Skeptical and independent, have high standards of competence and performance - for themselves and others.';
      case 'ISTP':
        return 'Tolerant and flexible, quiet observers until a problem appears, then act quickly to find workable solutions.'
            ' Analyze what makes things work and readily get through large amounts of data '
            'to isolate the core of practical problems.'
            ' Interested in cause and effect, organize facts using logical principles, value efficiency.';
      case 'ISFP':
        return 'Quiet, friendly, sensitive, and kind. Enjoy the present moment, what\'s going on around them. '
            'Like to have their own space and to work within their own time frame. '
            'Loyal and committed to their values and to people who are important to them.'
            ' Dislike disagreements and conflicts, do not force their opinions or values on others.';
      case 'INFP':
        return 'Idealistic, loyal to their values and to people who are important to them. '
            'Want an external life that is congruent with their values. '
            'Curious, quick to see possibilities, can be catalysts for implementing ideas. '
            'Seek to understand people and to help them fulfill their potential. '
            'Adaptable, flexible, and accepting unless a value is threatened.';
      case 'INTP':
        return 'Seek to develop logical explanations for everything that interests them. '
            'Theoretical and abstract, interested more in ideas than in social interaction. '
            'Quiet, contained, flexible, and adaptable. '
            'Have unusual ability to focus in depth to solve problems in their area of interest. '
            'Skeptical, sometimes critical, always analytical.';
      case 'ESTP':
        return 'Flexible and tolerant, they take a pragmatic approach focused on immediate results. '
            'Theories and conceptual explanations bore them - they want to act energetically to solve the problem. '
            'Focus on the here-and-now, spontaneous, enjoy each moment that they can be active with others. '
            'Enjoy material comforts and style. Learn best through doing.';
      case 'ESFP':
        return 'Outgoing, friendly, and accepting. Exuberant lovers of life, people, and material comforts. '
            'Enjoy working with others to make things happen. '
            'Bring common sense and a realistic approach to their work, and make work fun. '
            'Flexible and spontaneous, adapt readily to new people and environments. '
            'Learn best by trying a new skill with other people.';
      case 'ENFP':
        return 'Warmly enthusiastic and imaginative. See life as full of possibilities. '
            'Make connections between events and information very quickly, '
            'and confidently proceed based on the patterns they see. '
            'Want a lot of affirmation from others, and readily give appreciation and support. '
            'Spontaneous and flexible, often rely on their ability to improvise and their verbal fluency.';
      case 'ENTP':
        return 'Quick, ingenious, stimulating, alert, and outspoken. Resourceful in solving new and challenging problems.'
            ' Adept at generating conceptual possibilities and then analyzing them strategically. '
            'Good at reading other people. Bored by routine, will seldom do the same thing the same way, '
            'apt to turn to one new interest after another.';
      case 'ESTJ':
        return 'Practical, realistic, matter-of-fact. Decisive, quickly move to implement decisions. '
            'Organize projects and people to get things done, focus on getting results in the most efficient way possible.'
            ' Take care of routine details. Have a clear set of logical standards, '
            'systematically follow them and want others to also. Forceful in implementing their plans.';
      case 'ESFJ':
        return 'Warmhearted, conscientious, and cooperative. Want harmony in their environment, '
            'work with determination to establish it. Like to work with others to complete tasks accurately and on time.'
            ' Loyal, follow through even in small matters.'
            ' Notice what others need in their day-by-day lives and try to provide it. '
            'Want to be appreciated for who they are and for what they contribute.';
      case 'ENFJ':
        return 'Warm, empathetic, responsive, and responsible. '
            'Highly attuned to the emotions, needs, and motivations of others. '
            'Find potential in everyone, want to help others fulfill their potential. '
            'May act as catalysts for individual and group growth. Loyal, responsive to praise and criticism. '
            'Sociable, facilitate others in a group, and provide inspiring leadership.';
      case 'ENTJ':
        return 'Frank, decisive, assume leadership readily. '
            'Quickly see illogical and inefficient procedures and policies, develop and implement'
            ' comprehensive systems to solve organizational problems. '
            'Enjoy long-term planning and goal setting. Usually well informed, well read, '
            'enjoy expanding their knowledge and passing it on to others. Forceful in presenting their ideas.';
    }
    return 'Type not found!';
  }

  _launchURL() async {
    const url = 'https://www.myersbriggs.org';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
