import 'package:flutter/material.dart';

import 'message_page.dart';

void main() {
  runApp(MaterialApp(
    home: Messenger(),
  ));
}

class Messenger extends StatefulWidget {
  const Messenger({Key? key}) : super(key: key);

  @override
  _MessengerState createState() => _MessengerState();
}

class _MessengerState extends State<Messenger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        leading: Icon(
          Icons.add,
        ),
        title: Text(
          'MessageMe',
            style: TextStyle(
              fontFamily: 'Chakra Petch',
              fontSize: 24.0,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                'assets/profile.png'
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            InkWell(
              child: _profileCard('assets/model2.jpeg',
                  'Tyler Oaks',
                  'Hey bro',
                  false,
                  '11:12'),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MessagePage(name: 'Tyler Oaks', img: 'assets/model2.jpeg',
                        lastMessage:'Hey bro'),
                ));
              },
            ),
            _profileCard('assets/model1.jpeg',
                'Jana Burns',
                'Thanks for hearing me out! I really appreciate that!',
                true,
              '10:50'
            ),
            _profileCard('assets/model3.jpeg',
                  'Kate White',
                  'You: I am so glad we could finally catch up!',
                  true,
                  '09:19'),
          ],
        ),
      ),
    );
  }
}

_profileCard(String imagePath, String name, String lastMessage, bool isRead, String time){
  return Card(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage(
                imagePath
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Chakra Petch',
                        fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        color: isRead ? Colors.grey[500] : Colors.red[300],
                        fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                          lastMessage,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                    Icon(
                      isRead ? Icons.messenger_outline : Icons.messenger,
                      color: Colors.grey[500],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

_activePerson(String imagePath, String name){
  return Container(
    child: Column(
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundImage: AssetImage(
              imagePath
          ),
        ),
        Text(name),
      ],
    ),
  );
}
