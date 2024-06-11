import 'package:flutter/material.dart';

class put extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  put({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Type it here',
        style: TextStyle(color: Colors.green),
      ),
      backgroundColor: const Color.fromARGB(255, 39, 39, 39),
      content: Container(
          height: 200,
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your task',
                style: TextStyle(
                    fontSize: 20, color: Colors.green.withOpacity(0.5)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: const TextStyle(color: Colors.green),
                  cursorColor: Colors.green,
                  controller: controller,
                  maxLines: null,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      hintText: '.......',
                      hintStyle: TextStyle(color: Colors.blue)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: onCancel,
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.green),
                      )),
                  TextButton(
                      onPressed: onSave,
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.green),
                      )),
                ],
              )
            ],
          )),
    );
  }
}
