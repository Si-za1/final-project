import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:search/pages/result.dart';
import 'package:audioplayers/audio_cache.dart';

AudioCache audioCache = new AudioCache();


class GetJson extends StatelessWidget{
  final langName;

  GetJson(this.langName);

  @override 
  Widget build(BuildContext context){
      return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString("assets/"+this.langName.toLowerCase()+".jSON"),
        builder: (context,snapshot){
          List mydata=json.decode(snapshot.data.toString());
          if(mydata==null){
            return Scaffold(
              body: Center(
                child:Text(
                  "Loading",
                ),
              ),
            );
        }else{
           return Quizpage(mydata:mydata);
        }
      },
      );
} 
}

class Quizpage extends StatefulWidget {
  final mydata;
 Quizpage({Key key, @required this.mydata}) :super(key : key); 

  @override
  __QuizpageState createState() => __QuizpageState(mydata);
}

class __QuizpageState extends State<Quizpage> {

  var mydata;
  __QuizpageState(this.mydata); 

  Color colortoshow = Colors.indigoAccent;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks=0;
  int i=1;
  int timer=15;
  String showtimer="15";

Map<String, Color> btncolor={
    "a": Colors.indigoAccent,
    "b": Colors.indigoAccent,
    "c": Colors.indigoAccent,
    "d": Colors.indigoAccent,
   };

   bool canceltimer = false;
   @override
   void initState(){
     starttimer();
     super.initState();
   }

   void starttimer() async{
     const onesec = Duration(seconds: 1);
     Timer.periodic(onesec,(Timer t){
       setState(() {
         if (timer < 1){
           audioCache.play('wrong.mp3');
           t.cancel();

           nextquestion();
         }else if(canceltimer== true){
           t.cancel();
         }else{
           timer = timer-1;
         }
         showtimer = timer.toString();
       });
     });
}

   void nextquestion(){
     canceltimer = false;
     timer=15;
     setState(() {
       
     if(i<6){
       i++;
     }else{
       Navigator.of(context).pushReplacement(MaterialPageRoute(
         builder:(context) => Result(marks : marks),
       ));
     }
     btncolor['a']=Colors.indigoAccent;
     btncolor['b']=Colors.indigoAccent;
     btncolor['c']=Colors.indigoAccent;
     btncolor['d']=Colors.indigoAccent;
   });
    starttimer();
   }

 void checkanswer(String k, int index){
    if(mydata[2][index.toString()].toString().trim() == mydata[1][index.toString()][k].toString().trim()){
    marks= marks +5; 
    colortoshow = right;
    audioCache.play('correct.mp3');
  }else{
    colortoshow = wrong;
    audioCache.play('wrong.mp3');
  }

  setState((){
    btncolor[k] = colortoshow; 
    canceltimer = true;  
  });
   
  Timer(Duration(seconds: 2),nextquestion);

 }

  Widget choicebutton(String k){
    return Padding(
    padding:EdgeInsets.symmetric(
      vertical:10.0,
      horizontal:20.0,
      ),
     child: MaterialButton(
       onPressed: ()=> checkanswer(k,i),
       child: Text(
         mydata[1][i.toString()][k],
       style:TextStyle(
         color:Colors.white,
         fontSize:16.0,
        ),
        maxLines: 1,
       ),
       color: btncolor[k],
       splashColor:Colors.indigo[700] ,
       highlightColor: Colors.indigo[700 ],
       minWidth: 200.0,
       height:40.0 ,   
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),     
     ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
      ]);
    return WillPopScope(
      onWillPop: (){
        return showDialog(
          context: context,
          builder:(context)=> AlertDialog(
            title: Text(
              "SEARCH",
            ),
            content: Text(
              "YOU cant go back at this stage."
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: (){
                  Navigator.of(context).pop();
              }, 
              child: Text(
                "OK",
              ),
              ),
            ],
            ),
            );
      },
      child: Scaffold(
      body: Column(
        children:<Widget>[
          Expanded(
            flex:3,
            child:Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                mydata[0][i.toString()],
              style:TextStyle(
                fontSize:16.0,
              ),
              ),
          ),
            ),
           Expanded(
            flex:6,
            child:Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  choicebutton('a'),
                  choicebutton('b'),
                  choicebutton('c'),
                  choicebutton('d'),
                ],
              ), 
             ),
            ),  
            Expanded(
            flex:1,
            child:Container(
              child: Center(
                child: Text(
                  showtimer,
                  style: TextStyle(
                    fontSize:35.0,
                    fontWeight:FontWeight.w700,
                    fontFamily:'Times New Roman',
                  ),
                ),
                 ),
            ),
            ), 
        ]
      ),
       ),
    );
  }
}