import 'package:hive_flutter/hive_flutter.dart';
import 'package:knowt/utils/home.dart';
import 'package:knowt/utils/todoList.dart';

class todoDabaB {
  List toDo = [];
  final _myBox = Hive.box('myBox');

  void createIni() {
    toDo = [
      ['this is your app', false],
      ['add to do...', false],
      ['check if done...', false],
      ["slide left when done...", false],
      ["hope it'll be useful", false],
    ];
  }

  void load() {
    toDo = _myBox.get("TODO");
  }

  void update() {
    _myBox.put("TODO", toDo);
  }
}
