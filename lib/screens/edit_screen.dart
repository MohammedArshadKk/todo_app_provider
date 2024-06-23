import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_provider/providers/todo_provider.dart';
import 'package:todo_app_provider/screens/widgets/customtextfield.dart';

class EditNote extends StatelessWidget {
  const EditNote({required this.todos, super.key});
final Map todos;
  @override
  Widget build(BuildContext context) {
    final pro=Provider.of<TodoProvider>(context);
    TextEditingController titleTextController = TextEditingController(text: todos['title']);
    TextEditingController descriptionController = TextEditingController(text:todos['description']);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Center(
          child: Text(
            'Add Todo',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        toolbarHeight: 100,
      ),
      body: Center(
        child: SingleChildScrollView( 
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Customtextfield(
                    controller: titleTextController, hintText: 'Title'),
                const SizedBox(
                  height: 30,
                ),
                Customtextfield(
                    controller: descriptionController, hintText: 'Description'),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        log('${todos['_id']}');
                        
                        pro.editData(titleTextController.text, descriptionController.text ,todos['_id'] ); 
                        Navigator.pop(context); 
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.deepPurpleAccent)),
                      child: const Text(
                        'submit',
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
