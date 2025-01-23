import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  //Requireds
  final controller;

  final VoidCallback onSave;
  final VoidCallback onCancel;
  final String DialogTitle;
  const DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel,
      required this.DialogTitle});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(DialogTitle, textAlign: TextAlign.center),
        content: SizedBox(
          width: 150,
          height: 150,
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
                controller: controller,
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => onSave(),
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(Colors.green[200]),
                        padding: WidgetStateProperty.all(EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15))),
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () => onCancel(),
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(Colors.red[200]),
                        padding: WidgetStateProperty.all(EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15))),
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
