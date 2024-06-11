import "package:flutter/material.dart";
import 'package:hive_flutter/hive_flutter.dart';
import 'put.dart';
import 'todoList.dart';
import 'package:knowt/database/todoDataB.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  void initState() {
    if (_myBox.get("TODO") == null) {
      db.createIni();
    } else {
      db.load();
    }
    super.initState();
  }

  final _myBox = Hive.box('myBox');
  final _controller = TextEditingController();
  Function(BuildContext)? delFunc;
  todoDabaB db = todoDabaB();
  // todoList tl=

  void checkChange(bool? value, int index) {
    setState(() {
      // db.toDo[index][1] = !db.toDo[index][1];
      if (db.toDo[index][1] == false) {
        var temp = db.toDo.removeAt(index)[0];
        db.toDo.add([temp, true]);
      } else {
        var temp = db.toDo.removeAt(index)[0];
        db.toDo.insert(0, [temp, false]);
      }
    });
    db.update();
  }

  void saveNew() {
    setState(() {
      db.toDo.insert(0, [_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.update();
  }

  void newTask() {
    showDialog(
        context: context,
        builder: (context) {
          return put(
            controller: _controller,
            onSave: saveNew,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.toDo.removeAt(index);
    });
    db.update();
  }

  void starNow() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        title: const Center(child: Text('knoWt')),
        backgroundColor: Colors.black,
        foregroundColor: Colors.green,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.large(
              backgroundColor: Colors.amber,
              onPressed: newTask,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
      body: AnimatedContainer(
        duration: const Duration(seconds: 1),
        child: ListView.builder(
          itemCount: db.toDo.length,
          itemBuilder: (context, index) {
            return todoList(
              delFunc: (context) => deleteTask(index),
              taskName: db.toDo[index][0],
              onChanged: (value) => checkChange(value, index),
              taskComplete: db.toDo[index][1],
            );
          },
        ),
      ),
    );
  }
}
