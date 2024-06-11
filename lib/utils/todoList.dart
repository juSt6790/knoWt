import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";

class todoList extends StatelessWidget {
  final String taskName;
  final bool taskComplete;
  Function(bool?)? onChanged;
  Function(BuildContext)? delFunc;

  todoList({
    super.key,
    required this.taskName,
    required this.taskComplete,
    required this.onChanged,
    required this.delFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            onPressed: delFunc,
            icon: Icons.delete_outline_rounded,
            backgroundColor: Colors.green,
            spacing: 40,
          ),
        ]),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(100)),
          child: Row(
            children: [
              Checkbox(
                value: taskComplete,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                taskName,
                style: taskComplete
                    ? const TextStyle(
                        decoration: TextDecoration.lineThrough, fontSize: 15)
                    : const TextStyle(
                        decoration: TextDecoration.none, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
