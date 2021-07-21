import 'dart:core';

import 'package:dont_let_me_go/models/food.dart';
import 'package:dont_let_me_go/services/database_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'loading.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //categories of food to choose
  List<String> foodTypes = ['dairy', 'fruits', 'vegetables', 'meat', 'beverages', 'other'];
  //?
  DateTime datePick = DateTime.now();
  //index of categories to choose
  int index = 0;
  //first string of categories to choose
  String categoryChooser = 'dairy';
  //initialization of selected date
  DateTime selectedDate = DateTime.now();
  //controller of product name
  TextEditingController _controller = TextEditingController();
  //list of food from database
  Future<List<Food>> foodFromDB = DatabaseService.db.listOfFood();
  //formatter of dates
  DateFormat formatter = DateFormat("dd-MM-yyyy");
  //controller of expiration date field
  TextEditingController dateCtl = new TextEditingController(text: DateFormat("dd-MM-yyyy").format(DateTime.now()));

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Color(0xff74a651),
        title: Text('Don\'t let me go',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Mulish',
            fontSize: 22.0,
          ),
        ),
        centerTitle: true,
      ),
      //LISTVIEW OF DATABASE OF FOODS AND THEIR EXPIRATION DATES
      body: FutureBuilder(
        future: DatabaseService.db.listOfFood(),
        builder: (BuildContext context, AsyncSnapshot<List<Food>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loading();
          }else {
            if (snapshot.error != null) {
              return Center(
                child: Text('An error occured'),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  //FORMATTER OF DATETIME BECAUSE IF WE RETRIEVE IT, WE PARSE IT TO DATETIME OBJECT
                  return _foodTile(snapshot.data![index].name, snapshot.data![index].type, formatter.parse(snapshot.data![index].expirationDate));
                },
              );
            }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff74a651),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Add',
              style: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 10,
              ),
            ),
            Icon(
              Icons.add,
              color: Colors.white,
            ),
          ],
        ),
        onPressed: (){
          //NEW FOOD ON CLICK OF ADD BUTTON (NEED TO DISPOSE AND CAN'T BE NULL???)
          //FORMATTER.FORMAT RETURNS STRING?
          Food newFood = new Food(name: '', type: foodTypes[index], expirationDate: formatter.format(selectedDate));
          showModalBottomSheet <dynamic>(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(35.0)),
              ),
              backgroundColor: Colors.white,
              context: context,
              builder: (context){
                return StatefulBuilder (
                    builder: (BuildContext context, StateSetter setMyState){
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Text('Add product',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Mulish',
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('Select category:',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Mulish',
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage(getImgPath(foodTypes[index])),
                              height: 40,
                              width: 40,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                if (index == 0) {
                                  index = foodTypes.length - 1;
                                } else {
                                  index = index - 1;
                                }
                                setMyState(() {});
                                newFood.type = foodTypes[index];
                              },
                              child: Icon(Icons.chevron_left,
                                color: Color(0xffa9d962),
                              ),
                              shape: CircleBorder(),
                            ),
                            Container(
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.green[50],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    10, 15, 10, 15),
                                child: Text(
                                  foodTypes[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Mulish',
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                if (index == foodTypes.length - 1) {
                                  index = 0;
                                } else {
                                  index = index + 1;
                                }
                                setMyState(() {});
                                newFood.type = foodTypes[index];
                              },
                              child: Icon(Icons.chevron_right,
                                color: Color(0xffa9d962),
                              ),
                              shape: CircleBorder(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('Choose expiration date:',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Mulish',
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialButton(
                            onPressed: () => _selectDate(context),
                            child: Icon(Icons.calendar_today,
                              color: Color(0xffa9d962),
                            ),
                          ),
                          Container(
                            width: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                  color: Colors.black,
                                  width: 1
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  20, 0, 20, 0),
                              child: TextFormField(
                                style: TextStyle(
                                  fontFamily: 'Mulish',
                                  fontSize: 15,
                                ),
                                readOnly: true,
                                textAlign: TextAlign.center,
                                controller: dateCtl,
                                onChanged: (value){
                                  selectedDate = formatter.parse(value);
                                  setState(() {
                                    newFood.expirationDate = value;
                                  });
                                  print(newFood.expirationDate);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text('Add name:',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Mulish',
                          fontSize: 20.0,
                        ),
                      ),
                      Container(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery
                                  .of(context)
                                  .viewInsets
                                  .bottom),
                          child: TextField(
                            controller: _controller,
                            onSubmitted: (String value){
                              newFood.name = value;
                            },
                            decoration: InputDecoration(
                              fillColor: Colors.green[50],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      RawMaterialButton(
                        onPressed: () {
                          newFood.expirationDate = dateCtl.text;
                          if(newFood.name != ''){
                            DatabaseService.db.insertFood(newFood);
                            _controller.clear();
                            print(newFood.name);
                            print(newFood.type);
                            print(newFood.expirationDate);
                            Navigator.pop(context);
                          }else{
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content:
                            Text(
                                "Fill all data!")
                            ));
                          }
                          setState(() {});
                        },
                        fillColor: Color(0xff74a651),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                          child: Text('Add',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Mulish',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)
                        ),
                      ),
                    ],
                  );
                }
              );
            },
          );
        },
      ),
    );
  }

  String getImgPath(String foodType){
    switch (foodType){
      case 'dairy':
        return 'assets/dairy_products.png';
      case 'fruits':
        return 'assets/apple.png';
      case 'vegetables':
        return 'assets/corn.png';
      case 'meat':
        return'assets/sirloin_steak.png';
      case 'beverages':
        return 'assets/drink.png';
      case 'other':
        return 'assets/shopping.png';
      default:
        return 'assets/shopping.png';
    }
  }

  _foodTile(String name, String foodType, DateTime expirationDate){
    String formattedDate = DateFormat('dd-MM-yyyy').format(expirationDate);
    String imgPath = getImgPath(foodType);
    print(imgPath);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image(
                image: AssetImage(getImgPath(foodType)),
                height: 40,
                width: 40,
              ),
            ),
            Expanded(
              flex: 9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Mulish',
                      fontSize: 20.0,
                    ),
                  ),
                  Text(formattedDate,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: isExpired(expirationDate) ? Colors.red : Colors.grey,
                      fontFamily: 'Mulish',
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex:2,
              child: RawMaterialButton(
                  onPressed: (){
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        content: const Text('Are you sure you want to delete this item?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Mulish',
                            color: Colors.black,
                            fontSize: 20.0
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () async{
                              DatabaseService.db.deleteFood(Food(name: name, type: foodType, expirationDate: formatter.format(expirationDate)));
                              Navigator.pop(context);
                              setState(() {

                              });
                            },
                            child: const Text('Yes',
                              style: TextStyle(
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffa9d962),
                                  fontSize: 20.0
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('No',
                              style: TextStyle(
                                  fontFamily: 'Mulish',
                                  color: Color(0xffa9d962),
                                  fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                child: Icon(
                  Icons.delete,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isExpired(DateTime expirationDate){
    if(DateTime.now().isAfter(expirationDate)){
      return true;
    }else{
      return false;
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        dateCtl.text = formatter.format(selectedDate);
        print(selectedDate);
      });
  }

  bool checkIfExpired(DateTime dateTime){
    if(dateTime.isBefore(DateTime.now())){
      return true;
    }
    return false;
  }
}
