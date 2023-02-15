import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewPlan extends StatefulWidget {
  final Function addPlan;
  NewPlan(this.addPlan);
  @override
  State<NewPlan> createState() => _NewPlanState();
}

class _NewPlanState extends State<NewPlan> {
  DateTime? _newModalDate;
  final _rejaNomiController = TextEditingController();

  void _modalDateChooser(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2077),
    ).then((newDate) {
      setState(() {
        if (newDate != null) {
          _newModalDate = newDate;
        }
      });
    });
  }

  void submit() {
    if (_rejaNomiController.text.isEmpty || _newModalDate == null) {
      return;
    }
    widget.addPlan(_rejaNomiController.text, _newModalDate);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            top: 16.0,
            left: 16.0,
            right: 16.0,
            bottom: MediaQuery.of(context).viewInsets.bottom > 0
                ? MediaQuery.of(context).viewInsets.bottom + 16
                : 150),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: _rejaNomiController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_newModalDate != null
                    ? DateFormat("EEEE d.MM.yyyy").format(_newModalDate!)
                    : "Kun tanlanmagan..."),
                TextButton(
                    onPressed: () {
                      _modalDateChooser(context);
                    },
                    child: Text("KUNNI TANLASH"))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "BEKOR QILISH",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      submit();
                    },
                    child: Text("KIRITISH")),
              ],
            )
          ],
        ),
      ),
    );
    ;
  }
}
