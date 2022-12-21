import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc/controllers/methods.dart';
import '../models/user.dart';

//Contains all the code for building the UI of a page
//Anywhere that code logic is required, a method from this page's controller dart file is called and executed

//This is a small example application to demonstrate the MVC structure working together
//A default 'user' is created in the code, and the user can press a button to increment the age attribute up by one,
//and the user can be replaced entirely by entering a new name and age into the textfields below

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //Default user object is generated
  User newUser = User(name: 'Harry', age: 27,);

  Widget textFields() {
    //This method builds a UI feature, as such it is written in the view, not the controllers
    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(48, 153, 117, 1))),
              labelText: 'Name:',
            ),
          ),
          TextFormField(
            controller: ageController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(48, 153, 117, 1))),
              labelText: 'Age:',
            ),
          ),
          TextButton(
            onPressed: () {
              //Set state is called here to rebuild the view with the updated information obtained from a method in the
              //controllers files
              setState(() {
                newUser = createUser(nameController.text, int.parse(ageController.text));
              });
            },
            child: const Text('Create User'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Any code written here in the build function will be executed everytime the page is rebuilt
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //Elements of the UI are arranged in the widget tree here
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('User Information:'),
            Text(newUser.name!),
            Text('${newUser.age!}'),
            const SizedBox(height: 24,),
            TextButton(
              onPressed: () {
                setState(() {
                  increaseAge(newUser);
                });
              },
              child: const Text('Increase age'),
            ),
            const Divider(),
            textFields(),
          ],
        ),
      ),
    );
  }
}
