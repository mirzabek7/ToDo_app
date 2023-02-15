import 'package:flutter/material.dart';
import 'package:to_do_app/models/reja_modeli.dart';

class AboutPlans extends StatelessWidget {
  final int numberOfPlans;
  final int completedPlans;
  AboutPlans(this.numberOfPlans, this.completedPlans);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                numberOfPlans < 10
                    ? "0$numberOfPlans"
                    : numberOfPlans.toString(),
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                "Barcha rejalaringiz",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                completedPlans < 10
                    ? "0$completedPlans"
                    : completedPlans.toString(),
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                "Bajarilgan rejalaringiz",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              )
            ],
          ),
        ],
      ),
    );
  }
}
