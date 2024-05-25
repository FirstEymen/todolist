import "package:flutter/material.dart";
import 'package:hexcolor/hexcolor.dart';
import 'package:todolist/constants/color.dart';
import 'package:todolist/screens/add_new_task.dart';
import 'package:todolist/todoitem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> todo = ["Study Lessons", "Run 5k", "Go to party"];
  List<String> completed = ["Game meetup", "Take out trash"];
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Column(
            children: [
              //Header
              Container(
                width: deviceWidth,
                height: deviceHeight / 3,
                color: Colors.brown,
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "October 20, 2022",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        "My Todo List",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              //Top Column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: todo.length,
                      itemBuilder: (context, index) {
                        return TodoItem(title: todo[index]);
                      },
                    ),
                  ),
                ),
              ),
              //Completed Text
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Completed",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )),
              ),
              //Bottom Column
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: completed.length,
                      itemBuilder: (context, index) {
                        return TodoItem(title: completed[index]);
                      },
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AddNewTaskScreen(),
                  ));
                },
                child: const Text("Add New Task"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
