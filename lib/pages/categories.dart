

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:search/pages/facts.dart';
import 'package:audioplayers/audio_cache.dart';

AudioCache audioCache = new AudioCache();

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List <String> images =[
    "images/4.png",
    "images/5.png",
    "images/6.png",
    
  ];
   


  Widget customcard( String langname, String image, String imageInfo){
    return Padding(
      padding: EdgeInsets.all(20.0,
      ),
      child: InkWell(
        onTap: (){
          audioCache.play('click.mp3');
         Navigator.of(context).push(MaterialPageRoute(
          builder:(context)=>Getfactjson(langname),
         // builder: (context ,' /facts')
            ));
        },

                    child: Material(
                      color: Colors.orangeAccent,
                      elevation:10.0,
                      borderRadius: BorderRadius .circular(20.0),
                      child:Container(
                        child:Column(
                          children:<Widget>[
                            Padding(padding:EdgeInsets.symmetric(
                              vertical:10.0,
                            ),
                            child: Material(
                              elevation: 5.0,
                               borderRadius: BorderRadius .circular(100.0),
                             child:Container(
                                height: 200.0,
                                width: 200.0,
                                child: ClipOval(
                                  child:Image(
                                    fit:BoxFit.contain,
                                    image: AssetImage(
                                      image,
                                      ),
                                    ),
                             ),
                              ),
                            ),
                            ),
                            Center( 
                              child:Text(
                              langname,
                              style:TextStyle(
                                fontSize:24.0,
                                color:Colors.white,
                            ),
                            ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20.0),
                              child:Text(
                              
                                imageInfo,
                               
                             style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                            maxLines: 5,
                            textAlign: TextAlign.justify,
                              ),
                            ),  
                          ]
                        ),
                      )
                    )
                  )
                );
             }
              @override
              Widget build(BuildContext context) {
                SystemChrome.setPreferredOrientations(
                  [
                    DeviceOrientation.portraitDown,DeviceOrientation.portraitUp
                  ]
                );

                return Scaffold(
                  appBar: AppBar(
                    title: Text("Categories"
                    ),
                   backgroundColor:Colors.purple,
                   actions: <Widget>[
                     IconButton(
                  icon: Icon(
                    Icons.settings,
                  ),
                  onPressed: () {
                    audioCache.play('click.mp3');
                    Navigator.pushNamed(context, '/settings');
                    print('settings');
                  },
                ),
                   ],
                  ),
            
                body:ListView(
                  children: <Widget>[
                    customcard("EYES",images[0],"It helps us see."),
                    customcard("NOSE",images[1],"It helps us smell."),
                    customcard("HEART", images[2],"It pumps blood through the body. "),
                  ],
                ),
              );
              }
            }
            
          