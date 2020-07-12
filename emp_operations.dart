import 'package:ui_demo/modules/employee.dart';

class EmpOperations{

  static void addEmployee(Employee e){
    employeeList.add(e);
  }

  static void deleteEmployee(int index){
    employeeList.removeAt(index);
  }

  static void editEmployee(Employee employee, int index){
    employeeList.removeAt(index);
    employeeList.insert(index, employee);
  }
}