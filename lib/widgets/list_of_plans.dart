import 'package:flutter/material.dart';

import '../models/reja_modeli.dart';
import 'reja.dart';

class ListOfPlans extends StatelessWidget {
  final List<RejaModeli> rejalar;
  final Function bajarilganDebBelgila;
  final Function deletePlan;
  ListOfPlans(this.rejalar, this.bajarilganDebBelgila, this.deletePlan);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: rejalar.length > 0
            ? ListView.builder(
                itemBuilder: (ctx, index) {
                  return Reja(rejalar[index], bajarilganDebBelgila, deletePlan);
                },
                itemCount: rejalar.length,
              )
            : Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Hozircha rejalar yo'q",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    "assets/images/empty.png",
                    fit: BoxFit.cover,
                    width: 200,
                  ),
                ],
              ));
  }
}
