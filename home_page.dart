import 'package:flutter/material.dart';
import 'package:ui_demo/modules/employee.dart';
import 'package:ui_demo/pages/add_employee.dart';
import 'package:ui_demo/pages/edit_employee.dart';
import 'package:ui_demo/services/emp_operations.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Employee App'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => AddEmployee(),
              ),
            );

            setState(() {
              //
            });
          },
        ),
        body: employeeList.length == 0
            ? Center(
                child: Text('No Employee'),
              )
            : ListView.builder(
                itemCount: employeeList.length,
                itemBuilder: (BuildContext context, int index) {
                  Employee e = employeeList[index];
                  // Employee e =
                  //     Employee(name: 'Neha', post: 'CLerk', salary: 25000);
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(e.name[0]),
                    ),
                    title: Text(e.name),
                    subtitle: Text('${e.post}(${e.salary})'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            EmpOperations.deleteEmployee(index);

                            setState(() {
                              //
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => EditEmployee(
                                  employee: e,
                                  index: index,
                                ),
                              ),
                            );

                            setState(() {
                              //
                            });
                          },
                        )
                      ],
                    ),
                  );
                },
              ));
  }
}
