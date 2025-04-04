import 'package:bmi_flutter/result_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color bgColor = const Color(0xff0A0E21);
  Color cardColor = const Color(0xff111328);
  Color buttonColor = const Color(0xffEB1555);

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
        title: const Center(
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
                      child: const Column(
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
                      child: const Column(
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
          Expanded(
            flex: 10,
            child: Card(
              color: cardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Height',style: TextStyle(color: Colors.white),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('$height',style: const TextStyle(color: Colors.white,fontSize: 50),),
                      const SizedBox(width: 5,),
                      const Text('cm',style: TextStyle(color: Colors.white),),
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
                          const Text('Weight',style: TextStyle(color: Colors.white),),
                          Text('$weight',style: const TextStyle(color: Colors.white,fontSize: 50),),
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
                                shape: const CircleBorder(),
                                mini: true,
                                backgroundColor: Colors.white12,
                                child: const Icon(Icons.remove,color: Colors.white,),
                              ),
                              FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                mini: true,
                                shape: const CircleBorder(),
                                backgroundColor: Colors.white12,
                                child: const Icon(Icons.add,color: Colors.white,),
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
                        const Text('Age',style: TextStyle(color: Colors.white),),
                        Text('$age',style: const TextStyle(color: Colors.white,fontSize: 50),),
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
                              shape: const CircleBorder(),
                              backgroundColor: Colors.white12,
                              child: const Icon(Icons.remove,color: Colors.white,),
                            ),
                            FloatingActionButton(
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                              shape: const CircleBorder(),
                              mini: true,
                              backgroundColor: Colors.white12,
                              child: const Icon(Icons.add,color: Colors.white,),
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultPage(result)));
              },
              child: Container(
                color: buttonColor,
                child: const Center(child: Text('CALCULATE',style: TextStyle(fontSize: 20,color: Colors.white),),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
