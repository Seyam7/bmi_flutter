import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {

  Color bgColor =  const Color(0xff0A0E21);
  Color cardColor =  const Color(0xff111328);
  Color buttonColor =  const Color(0xffEB1555);

  late final double result;
  ResultPage(this.result, {super.key});

  @override
  Widget build(BuildContext context) {
    String status = 'Unknown';
    String comment='';
    if(result < 18.5){
      status='Underweight';
      comment='You\'re underweight. It might be helpful to include more nutritious meals in your diet and consult a healthcare provider for personalized advice.';
    }
    else if(result>=18.5 && 25>result){
      status='Normal';
      comment='Great job! Your BMI is within the normal range. Keep maintaining a balanced diet and an active lifestyle for optimal health!';
    }
    else if(result>=25){
      status='Overweight';
      comment='You are slightly overweight. Regular exercise and a healthy diet can help you maintain a balanced weight. Consider making small lifestyle changes for long-term benefits.';
    }
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
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
                  Text(status,style: const TextStyle(color: Colors.green,fontSize: 30),),
                  Text(result.toStringAsFixed(1),style: const TextStyle(color: Colors.white,fontSize: 55),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      comment,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(color: Colors.greenAccent,),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                color: const Color(0xffEB1555),
                child: const Center(child: Text('RE-CALCULATE',style: TextStyle(fontSize: 20,color: Colors.white),),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
