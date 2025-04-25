import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:subwise/widgets/subscription_widget.dart';

class SubscriptionDrawer extends StatelessWidget {
  final SubscriptionWidget widget;

  const SubscriptionDrawer({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min, // important for bottom sheets
        children: [
          Container(
            height: 5,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.subscription.name,
                    style: const TextStyle(
                      fontFamily: "Aeonik",
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    )),
                Text(
                  "\$${widget.subscription.price} / ${widget.subscription.billingPeriod}",
                  style: TextStyle(
                    fontFamily: "Aeonik",
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    softWrap: true,
                    maxLines: 3,
                    widget.subscription.description,
                    style: TextStyle(
                      fontFamily: "Aeonik",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey[300],
                  thickness: 3,
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Last Renewal ",
                      style: TextStyle(
                        fontFamily: "Aeonik",
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      "${DateFormat('MMM dd').format(widget.subscription.lastRenewal)}",
                      style: TextStyle(
                        fontFamily: "Aeonik",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Next Renewal ",
                      style: TextStyle(
                        fontFamily: "Aeonik",
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      "${DateFormat('MMM dd').format(widget.subscription.nextRenewal)}",
                      style: TextStyle(
                        fontFamily: "Aeonik",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF3939),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      minimumSize: Size(double.infinity, 0), // Makes the button fill the width
                    ),
                    onPressed: () {},
                    child: Text(
                      "Remove Subscription",
                      style: TextStyle(
                          fontFamily: "Aeonik",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
