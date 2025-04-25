import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/subscription_provider.dart';

class MonthlySpendCardWidget extends StatefulWidget {
  const MonthlySpendCardWidget({super.key});

  @override
  State<MonthlySpendCardWidget> createState() => _MonthlySpendCardWidgetState();
}

class _MonthlySpendCardWidgetState extends State<MonthlySpendCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              "Monthly Spend",
              style: TextStyle(
                fontFamily: "Aeonik",
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),
            Row(
              children: [
                Text(
                  "≈",
                  style: TextStyle(
                    fontFamily: "Aeonik",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  "\$${Provider.of<SubscriptionProvider>(context).total.toString()}",
                  style: TextStyle(
                    fontFamily: "Aeonik",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 50, // or double.infinity inside a Card
          child: VerticalDivider(
            color: Colors.grey[300],
            thickness: 1.5,
            width: 20,
          ),
        ),
        Column(
          children: [
            Text(
              "Next Renewal",
              style: TextStyle(
                fontFamily: "Aeonik",
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),
            Text(
              "Apr 20",
              style: TextStyle(
                fontFamily: "Aeonik",
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
