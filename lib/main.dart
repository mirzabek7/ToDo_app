import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import './widgets/plans_date.dart';
import './widgets/about_plans.dart';
import './widgets/list_of_plans.dart';
import './models/reja_modeli.dart';
import './widgets/new_plan_window.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      theme: ThemeData(fontFamily: GoogleFonts.aldrich().fontFamily),
      debugShowCheckedModeBanner: false,
      home: ToDoApp(),
    );
  }
}

class ToDoApp extends StatefulWidget {
  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  // ignore: prefer_final_fields
  Rejalar _ruyxat = Rejalar();
  DateTime _belgilanganSana = DateTime.now();

  void dateChooser(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2017),
      lastDate: DateTime(2077),
    ).then((tanlanganSana) {
      if (tanlanganSana != null) {
        setState(() {
          _belgilanganSana = tanlanganSana;
        });
      }
    });
  }

  void _prevDay() {
    setState(() {
      _belgilanganSana = DateTime(_belgilanganSana.year, _belgilanganSana.month,
          _belgilanganSana.day - 1);
    });
  }

  void _nextDay() {
    setState(() {
      _belgilanganSana = DateTime(_belgilanganSana.year, _belgilanganSana.month,
          _belgilanganSana.day + 1);
    });
  }

  void bajarilganDebBelgila(String rejaId) {
    setState(() {
      _ruyxat
          .todoByDay(_belgilanganSana)
          .firstWhere((reja) => reja.id == rejaId)
          .changeDone();
    });
  }

  void _deletePlan(String rejaId) {
    setState(() {
      _ruyxat.removeToDo(rejaId);
    });
  }

  void _openAddWindow(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (ctx) {
          return NewPlan(_addPlan);
        });
  }

  int get _numberOfPlans {
    return _ruyxat.todoByDay(_belgilanganSana).length;
  }

  int get _completedPlans {
    return _ruyxat
        .todoByDay(_belgilanganSana)
        .where((reja) => reja.isDone)
        .length;
  }

  void _addPlan(String RejaNomi, DateTime RejaKuni) {
    setState(() {
      _ruyxat.addToDo(RejaNomi, RejaKuni);
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("To Do App")),
      body: Column(children: [
        PlansDate(dateChooser, _belgilanganSana, _prevDay, _nextDay),
        AboutPlans(_numberOfPlans, _completedPlans),
        ListOfPlans(_ruyxat.todoByDay(_belgilanganSana), bajarilganDebBelgila,
            _deletePlan),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openAddWindow(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
