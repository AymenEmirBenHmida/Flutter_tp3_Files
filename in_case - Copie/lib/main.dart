//@dart=2.9
import 'dart:convert';
import 'dart:io';
 import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';



import 'package:flutter/material.dart';

void main() {
 runApp(MyApp());
}
class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
 return MaterialApp(
 title: 'Flutter JSON Demo',
 theme: ThemeData(
 primarySwatch: Colors.blue,
 visualDensity: VisualDensity.adaptivePlatformDensity,
 ),
 home: MyHomePage(),
 );
 }
}
class MyHomePage extends StatefulWidget {
 @override
 _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
String documentsPath='';
String tempPath='';
var databasesPath;
String databasePath ;
Future getPaths() async {
 final docDir = await getApplicationDocumentsDirectory();
 final tempDir = await getTemporaryDirectory();
Directory appDocDir = await getApplicationDocumentsDirectory();
 databasePath = join(appDocDir.path, 'scol.db');
 setState(() {
 documentsPath = docDir.path;
 tempPath = tempDir.path;
 });
}
@override
void initState() {

 getPaths();
 super.initState();
}
@override
Widget build(BuildContext context) {
 return Scaffold(
 appBar: AppBar(title: Text('Path Provider')),
 body: Padding(
 padding: const EdgeInsets.all(15.0),
 child: Container(
 child: Column(
 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
 children: [
 Text('Doc path: ' + documentsPath,
 style: TextStyle(fontSize: 20.0)),
 Text('Temp path' + tempPath, style: TextStyle(fontSize: 20.0)),
 Text('database path : '+databasePath),
 ],
 ),
 ),
 ),
 );
}}