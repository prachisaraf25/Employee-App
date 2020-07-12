import 'package:flutter/material.dart';
import 'package:ui_demo/modules/employee.dart';
import 'package:ui_demo/services/emp_operations.dart';

class AddEmployee extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController postController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Employee'),
        ),
        body: Container(
            width: double.infinity,
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(hintText: 'Employee Name'),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: postController,
                  decoration: InputDecoration(hintText: 'Employee Post'),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: salaryController,
                  decoration: InputDecoration(hintText: 'Employee Salary'),
                ),
                SizedBox(height: 16),
                RaisedButton(
                  child: Text('Add Employee'),
                  onPressed: () {
                    String n = nameController.text;
                    String p = postController.text;
                    int s = int.parse(salaryController.text);

                    Employee e = Employee(name: n, post: p, salary: s);

                    EmpOperations.addEmployee(e);

                    Navigator.pop(context);
                  },
                ),
              ],
            )));
  }
}
