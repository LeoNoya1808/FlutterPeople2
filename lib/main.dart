import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'People.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget 
{const MyApp({Key key}):super(key:key);

 @override

 Widget build (BuildContext context){
   return MaterialApp(
title: "App image",
home:Inicio(),
); //MaterialApp
 }
}

class Inicio extends StatefulWidget{
  Inicio({Key key}): super(key: key);
  @override

  _InicioState createState()=>_InicioState();
}

class _InicioState extends State<Inicio>{
  List data;
  Future <List<String>> getData () async {
    var response= await http.get(
          Uri.encodeFull("https://webapipersonasq.azurewebsites.net/api/people"),
          headers: {"Accept":"application/json"}
    );
    if(response.statusCode == 200 ){
    data= json.decode(response.body);
    print(data);
    //return data.map((people)-> new People.fromJson(people)).toList();
    }
   /* else {
      throw Exception("Fallo al llamar a la Api !");
    }*/
    return "Satisfactorio";
  }
  @override
  void initState(){

  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title:Text("Mi app con imagen"),
    ),
   /* body: ListView( 
      children:<Widget>[  
          Container(
            padding: EdgeInsets.all(20.0),
            child: Image.network("https://i.pinimg.com/originals/53/43/49/5343498957d9cfad45244d1ffef56c7f.jpg"),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Image.network("https://www.infobae.com/new-resizer/uhTXyFFtH_Phxp34OJkcmhmA9sc=/420x236/filters:format(jpg):quality(85)/s3.amazonaws.com/arc-wordpress-client-uploads/infobae-wp/wp-content/uploads/2017/04/14104549/NegroPensante10-1024x576.jpg"),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtH9ueHxEGfveQaOZei98GTo1OvC-DXTSNTg&usqp=CAU"),
          ),
          new Center(
            child:new RaisedButton(
              child:new Text("Obtener datos"),
              onPressed: getData) 
          ),

      ]/*
    ),
  );
}  
}