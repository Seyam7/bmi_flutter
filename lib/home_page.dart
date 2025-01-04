import 'package:bmi_flutter/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color bgColor = Color(0xff0A0E21);
  Color cardColor = Color(0xff111328);
  Color buttonColor = Color(0xffEB1555);

  bool isMale=true;
  int weight=60;
  int age = 26;
  int height = 170;
  //bool isFemale=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Center(
          child: Text(
            'BMI Calculator',
            style: TextStyle(
                color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          isMale=true;
                        });
                      },
                      child: Card(
                        color: isMale==true? Colors.teal[700]:cardColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.male,size: 50,color: Colors.white,),
                            Text('Male',style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          isMale=false;
                        });
                      },
                      child: Card(
                        color: isMale==false? Colors.teal[700]:cardColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.female,size: 50,color: Colors.white,),
                            Text('Female',style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Card(
              color: cardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Height',style: TextStyle(color: Colors.white),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('$height',style: TextStyle(color: Colors.white,fontSize: 50),),
                      SizedBox(width: 5,),
                      Text('cm',style: TextStyle(color: Colors.white),),
                    ],
                  ),
                  Slider(
                    activeColor: buttonColor,
                    thumbColor: Colors.deepPurple,
                    inactiveColor: Colors.grey,
                    min: 90,
                      max: 220,
                      value: height.toDouble(),
                      onChanged: (value){
                        setState(() {
                          height=value.toInt();
                        });
                      }
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                    child: Card(
                      color: cardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Weight',style: TextStyle(color: Colors.white),),
                          Text('$weight',style: TextStyle(color: Colors.white,fontSize: 50),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  if(weight>1){
                                    setState(() {
                                      weight--;
                                    });
                                  }
                                },
                                shape: CircleBorder(),
                                mini: true,
                                backgroundColor: Colors.white12,
                                child: Icon(Icons.remove,color: Colors.white,),
                              ),
                              FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                mini: true,
                                shape: CircleBorder(),
                                backgroundColor: Colors.white12,
                                child: Icon(Icons.add,color: Colors.white,),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                ),
                Expanded(
                  flex: 5,
                  child: Card(
                    color: cardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Age',style: TextStyle(color: Colors.white),),
                        Text('$age',style: TextStyle(color: Colors.white,fontSize: 50),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: (){
                                if(age>1){
                                  setState(() {
                                    age--;
                                  });
                                }
                              },
                              mini: true,
                              shape: CircleBorder(),
                              backgroundColor: Colors.white12,
                              child: Icon(Icons.remove,color: Colors.white,),
                            ),
                            FloatingActionButton(
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                              shape: CircleBorder(),
                              mini: true,
                              backgroundColor: Colors.white12,
                              child: Icon(Icons.add,color: Colors.white,),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: InkWell(
              onTap: (){
                double h  = height/100;
                double hSquare = h*h;
                double result = weight/hSquare;
                //String res=result.toStringAsFixed(2);
                print('Our result is: ${result}');
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultPage(result)));
              },
              child: Container(
                color: buttonColor,
                child: Center(child: Text('CALCULATE',style: TextStyle(fontSize: 20,color: Colors.white),),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
