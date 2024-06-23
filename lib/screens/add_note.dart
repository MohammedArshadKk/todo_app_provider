import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_provider/providers/todo_provider.dart';
import 'package:todo_app_provider/screens/widgets/customtextfield.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    final pro=Provider.of<TodoProvider>(context);
    TextEditingController titleTextController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
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
                        log('${titleTextController.text}');
                        pro.postData(titleTextController.text, descriptionController.text); 
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
