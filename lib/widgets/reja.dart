import 'package:flutter/material.dart';
import 'package:to_do_app/models/reja_modeli.dart';

class Reja extends StatelessWidget {
  final RejaModeli reja;
  final Function bajarilganDebBelgila;
  final Function deletePlan;

  Reja(this.reja, this.bajarilganDebBelgila, this.deletePlan);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // ignore: prefer_const_constructors
      contentPadding: EdgeInsets.symmetric(horizontal: 6.0),
      leading: IconButton(
        onPressed: () {
          bajarilganDebBelgila(reja.id);
        },
        icon: Icon(
          reja.isDone ? Icons.check_circle_outline : Icons.circle_outlined,
          color: reja.isDone ? Colors.green : Colors.grey,
        ),
      ),
      title: Text(
        reja.nomi,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          decoration:
              reja.isDone ? TextDecoration.lineThrough : TextDecoration.none,
          color: reja.isDone ? Colors.grey : Colors.black,
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          deletePlan(reja.id);
        },
        // ignore: prefer_const_constructors
        icon: Icon(
          Icons.delete_forever,
          size: 22,
        ),
      ),
    );
  }
}
