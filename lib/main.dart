import 'package:flutter/material.dart';
import 'package:todolist/screens/add_page.dart';

void main(){
  runApp(MyApp());
}

 class MyApp extends StatelessWidget {
   const MyApp({super.key});
 
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       home: TodoListPage(),
     );
   }
 }
 