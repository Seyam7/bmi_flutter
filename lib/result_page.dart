import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {

  Color bgColor = Color(0xff0A0E21);
  Color cardColor = Color(0xff111328);
  Color buttonColor = Color(0xffEB1555);

  late final double result;
  ResultPage(this.result);

  @override
  Widget build(BuildContext context) {
    String status = 'Unknown';
    if(result < 18.5){
      status='Underweight';
    }
    else if(result>=18.5 && 25>result){
      status='Normal';
    }
    else if(result>=25){
      status='Overweight';
    }
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Center(child: Text('Your result',style: TextStyle(fontSize: 60,color: Colors.white),)),
          ),
          Expanded(
            flex: 10,
            child: Card(
              color: cardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('$status',style: TextStyle(color: Colors.green,fontSize: 30),),
                  Text('$result',style: TextStyle(color: Colors.white,fontSize: 55),),
                  Text('You have a normal body weight',style: TextStyle(color: Colors.white,),),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                color: Color(0xffEB1555),
                child: Center(child: Text('RE-CALCULATE',style: TextStyle(fontSize: 20,color: Colors.white),),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
