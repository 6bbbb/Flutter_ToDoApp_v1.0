import 'package:hive/hive.dart';
// import 'package:todoapp_1/util/todo_tile.dart';

class ToDoDataBase {
  List todos = [];
  // refrence the box
  final _myBox = Hive.box("myBox");

  //first time run app
  void creatInitialData() {
    todos = [
      ["Slide me from right to left to delete me!", false],
      ["اللهم صل على محمد", false],
    ];
  }

  void loadData() {
    todos = _myBox.get("TODOLIST");
  }

  void updateDB() {
    _myBox.put("TODOLIST", todos);
  }
}
