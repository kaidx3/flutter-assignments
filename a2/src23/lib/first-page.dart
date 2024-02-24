// ignore_for_file: avoid_print, use_key_in_widget_constructors, file_names, todo, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:robbinlaw/widgets/mysnackbar.dart';

// Do not change the structure of this files code.
// Just add code at the TODO's.

final formKey = GlobalKey<FormState>();

// We must make the variable firstName nullable.
String? firstName;
final TextEditingController textEditingController = TextEditingController();

class MyFirstPage extends StatefulWidget {
  @override
  MyFirstPageState createState() => MyFirstPageState();
}

class MyFirstPageState extends State<MyFirstPage> {
  bool enabled = false;
  int timesClicked = 0;
  String msg1 = '';
  String msg2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A2 - User Input'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Enable Buttons'),
              Switch(
                value: enabled,
                onChanged: (bool value) {
                  setState(() {
                    enabled = value;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Visibility(
                visible: enabled,
                child: ElevatedButton(
                  onPressed: () => {
                    setState(() {
                      timesClicked++;
                    })
                  },
                  child:
                      Text("Click Me ${timesClicked == 0 ? '' : timesClicked}"),
                ),
              ),
              SizedBox(width: 8.0),
              Visibility(
                visible: enabled,
                child: ElevatedButton(
                  onPressed: () => {
                    setState(() {
                      timesClicked = 0;
                    })
                  },
                  child: Text("Reset"),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                        helperText: "Min 1, Max 20",
                        icon: Icon(Icons.hourglass_top),
                        labelText: 'first name',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        suffixIcon: Icon(Icons.check_circle)),
                    maxLength: 20,
                    validator: (value) {
                      return value!.isEmpty
                          ? 'First name must be at least 1 character'
                          : null;
                    },
                    onSaved: (value) {
                      firstName = value;
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () => {
                        if (formKey.currentState!.validate())
                          {
                            formKey.currentState!.save(),
                            MySnackBar(text: "Hey $firstName").show(),
                            textEditingController.clear(),
                          }
                      },
                      child: Text('Submit'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
