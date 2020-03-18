
import 'package:flutter/material.dart';
import 'package:search/pages/dialogs.dart';
import 'package:audioplayers/audio_cache.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  AudioCache audioCache = new AudioCache();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[100],    
        body: Column(
          children: <Widget>[       
            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,              
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.settings,
                  ),
                  onPressed: () {
                    //SystemSound.play(SystemSoundType.click);
                    audioCache.play('click.mp3');
                    Navigator.pushNamed(context, '/settings');
                    print('settings');
                  },
                ),
              ],
            ),

            Image(
              image: AssetImage('images/bg.png'),
              height: 400.0,
              width: 250.0,
            ),    

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  padding: EdgeInsets.all(10.0),
                  elevation: 10.0,
                  shape: StadiumBorder(),
                  minWidth: 200.0,
                  color: Colors.amber[200],
                  child: Text(
                    'START!',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'IndieFlower',
                      letterSpacing: 2.0,
                      color: Colors.black54,
                    ),
                  ),
                  onPressed: (){
                    audioCache.play('click.mp3');
                    Navigator.pushNamed(context, '/categories');
                   // if (setSound() == true) audioCache.play('click.mp3');
                  },
                ),
              ],
            ),   

            SizedBox(height: 10.0),

            RaisedButton(
              elevation: 10.0,
              color: Colors.purple,
              padding: EdgeInsets.all(7.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text('Exit',
                style: TextStyle(
                  color: Colors.grey[50],
                  fontSize: 20.0,
                  letterSpacing: 1.5,
                  fontFamily: 'IndieFlower',
                ),
              ),
              onPressed: (()async{
                print('exit');
                audioCache.play('click.mp3');
                await Dialogs.yesAbortDialog(context, 'Do you want to exit?', '', );
              }),
            ),    
            
            
          ],
        ),
      ),
    );
  }
}