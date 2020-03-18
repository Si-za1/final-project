import 'dart:io';

import 'package:flutter/material.dart';

enum DialogAction{yes, abort}

class Dialogs{
  static Future<DialogAction> yesAbortDialog(
    BuildContext context,
    String title,
    String body,
  )async{
    final action = await showDialog(
      
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          backgroundColor: Colors.purple[50],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(title),
          actions:  <Widget>[
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),),
              color: Colors.purple,
              onPressed: ((){ 
                Navigator.of(context).pop(DialogAction.abort);}),
              child: const Text('No'),
            
            ),
            RaisedButton(
               shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),),
              color: Colors.purple,
              onPressed: ((){
                exit(0);
              }),
              child: const Text('Yes'),
            
            ),
          ],
        );
      },
    );
    return (action!=null) ? action: DialogAction.abort;
  }
  
}