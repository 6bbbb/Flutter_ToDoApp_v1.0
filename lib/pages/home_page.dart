import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoapp_practice/data/date_base.dart';
import 'package:todoapp_practice/util/dialog_box.dart';
import 'package:todoapp_practice/util/main_drawe.dart';
import 'package:todoapp_practice/util/my_navigation_bar.dart';
import 'package:todoapp_practice/util/todo_tile.dart';
import 'package:audioplayers/audioplayers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Referance hive DB
  final _myBox = Hive.box("myBox");
  //----Variables[+]----
  List todos = [
    ["Firs task eat an apple!", false],
  ];
  //for To Do App
  String title = "To Do App";
  final controller = TextEditingController();
  ToDoDataBase db = ToDoDataBase();

  //Functions
  @override
  //initiaize the data (ToDosDB);
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.creatInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

//Play an audio
  Future<void> _PlaySound(String path) async {
    final player = AudioPlayer();
    await player.play(AssetSource(path));
  }

//Change CheckBox
  void ChangeCheckBox(bool? value, int index) async {
    _PlaySound("click.mp3");
    setState(() {
      db.todos[index][1] = !db.todos[index][1];
    });
    db.updateDB();
  }

//Save
  void onSave() {
    setState(() {
      Navigator.of(context).pop();
      if (controller.text.isNotEmpty) {
        db.todos.add([controller.text, false]);
        controller.clear();
      }
    });
    db.updateDB();
  }

//Cancel
  void onCancel() {
    setState(() {
      Navigator.of(context).pop();
    });
  }

//Delete
  void onDelete(int index) {
    setState(() {
      db.todos.removeAt(index);
      print("Remove!");
    });
    db.updateDB();
  }

//Creat Task
  void CreatNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: controller,
            onSave: () => onSave(),
            onCancel: () => onCancel(),
            DialogTitle: "Create New Task",
          );
        });
  }

//Edit
  void onEdit(int index) {
    setState(() {
      showDialog(
          context: context,
          builder: (context) {
            return DialogBox(
              controller: controller,
              onSave: () {
                setState(() {
                  if (controller.text.isNotEmpty) {
                    db.todos[index][0] = controller.text;
                    controller.clear();
                  }
                  Navigator.of(context).pop();
                });
              },
              onCancel: () {
                Navigator.of(context).pop();
              },
              DialogTitle: "Edit Task",
            );
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      drawer: MainDrawe(),
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      //floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () => CreatNewTask(),
        child: Icon(
          Icons.add_circle_outline_outlined,
          color: Colors.black,
        ),
        backgroundColor: Colors.green[200],
      ),

      //body
      body: ListView.builder(
        itemCount: db.todos.length,
        itemBuilder: (context, index) {
          return TodoTile(
            TaskName: db.todos[index][0],
            ChangeCheckBox: (bool? value) {
              ChangeCheckBox(value, index);
            },
            taskCompleted: db.todos[index][1],
            onDelete: () => onDelete(index),
            onEdit: () => onEdit(index),
          );
        },
      ),
      // bottomNavigationBar: MyNavigationBar(),
    ));
  }
}
