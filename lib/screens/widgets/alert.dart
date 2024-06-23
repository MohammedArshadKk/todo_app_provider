import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_provider/providers/todo_provider.dart';

Future<void> showMyDialog(BuildContext context , id ,) async {
  final provider=Provider.of<TodoProvider>(context ,listen: false);
  return showDialog<void>(
    context: context,
    barrierDismissible: false, 
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Are you sure'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Would you like to delete this note?'),
            ],
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: const Text('cancel'), 
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('delete'), 
                onPressed: () {
                   provider.delete(id);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ],
      );
    },
  );
}