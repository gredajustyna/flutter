import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  String name;
  String img;
  String lastMessage;

  MessagePage({Key? key, required this.name, required this.img, required this.lastMessage}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  late String name;
  late String img;
  late String lastMessage;
  final myController = TextEditingController();


  @override
  void initState() {
    name = widget.name;
    img = widget.img;
    lastMessage = widget.lastMessage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        title: Text(
          name,
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
                  img
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: ListView(
                  children: <Widget>[
                    _myMessage('Heyyyy did you like your trip to the beach last weekend!'),
                    _senderMessage('Yeah this place was really cool!', img),
                    _myMessage('Idk I must admit I liked being there? Like for real man,'
                        'I wish we went there together again!'),
                    Divider(
                      color: Colors.grey[300],
                      height: 4.0,
                    ),
                    Text('11:19',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                    textAlign: TextAlign.center,
                    ),
                    _senderMessage(lastMessage, img),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextField(
                      controller: myController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        labelText: 'Write a message',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: RawMaterialButton(
                    onPressed: () {

                    },
                    shape: CircleBorder(),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.red[200],
                    ),
                  ),
                ),
                Expanded(
                  flex:2,
                  child: RawMaterialButton(
                    onPressed: () {

                    },
                    fillColor: Colors.red[200],
                    shape: CircleBorder(),
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

_senderMessage(String message, String imgPath){
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: AssetImage(
              imgPath
          ),
        ),
        SizedBox(width: 10.0),
        Container(
          width: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey[300],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              message,
            ),
          ),
        ),
        SizedBox(height: 50.0),
      ],
    ),
  );
}


_myMessage(String message){
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          width: 200.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.red[200],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              message,
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ],
    ),
  );
}