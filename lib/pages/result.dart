import "package:flutter/material.dart";
import 'package:search/pages/categories.dart';
import 'package:search/pages/dialogs.dart';
import 'package:audioplayers/audio_cache.dart';

AudioCache audioCache = new AudioCache();


class Result extends StatefulWidget {
  final marks;
  Result({Key key, @required this.marks}) : super(key: key);
  @override
  _ResultState createState() => _ResultState(marks);
}

class _ResultState extends State<Result> {
  List<String> images = [
    "images/sucess.png",
    "images/good.png",
    "images/bad.png",
  ];

  String message;
  String image;

  @override
  void initState() {
    if (marks >= 25) {
      image = images[0];
      message = "You did very well \n" + "You Scored $marks";
      audioCache.play('smile.mp3');
    } else if (15 < marks && marks < 25) {
      image = images[1];
      message = "You Can Do Better..\n" + "You Scored $marks";
      audioCache.play('good.mp3');
    } else {
      image = images[2];
      message = "Better luck next time..\n" + "You Scored $marks";
      audioCache.play('bad.mp3');
    }
    super.initState();
  }

  int marks;
  _ResultState(this.marks);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Result",
        ),
        backgroundColor: Colors.purple,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Material(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      child: Container(
                        width: 300.0,
                        height: 300.0,
                        child: ClipRect(
                          child: Image(
                            image: AssetImage(
                              image,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 15.0,
                        ),
                        child: Center(
                          child: Text(
                            message,
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  onPressed: () {
                    audioCache.play('click.mp3');
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Categories(),
                    ));
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  borderSide: BorderSide(width: 3.0, color: Colors.purple),
                  splashColor: Colors.indigoAccent,
                ),
                SizedBox(width: 20.0),
                OutlineButton(
                  onPressed: (() async {
                    print('exit');
                    audioCache.play('click.mp3');
                    await Dialogs.yesAbortDialog(
                      context,
                      'Do you want to exit?',
                      '',
                    );
                  }),
                  child: Text(
                    "Exit",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  borderSide: BorderSide(width: 3.0, color: Colors.purple),
                  splashColor: Colors.indigoAccent,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
