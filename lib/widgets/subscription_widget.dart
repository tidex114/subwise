import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:subwise/models/subscription.dart';
import 'package:subwise/widgets/subscription_drawer.dart';

class SubscriptionWidget extends StatefulWidget {
  final Subscription subscription;

  const SubscriptionWidget(this.subscription, {super.key});

  @override
  State<SubscriptionWidget> createState() => _SubscriptionWidgetState();
}

class _SubscriptionWidgetState extends State<SubscriptionWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SubscriptionDrawer(
                widget: widget), // 👈 You pass your data here
          ),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5.0,
              spreadRadius: 2.0,
              offset: const Offset(0.0, 2.5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      widget.subscription.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontFamily: "Aeonik",
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10), // spacing between text and badge
                  if (widget.subscription.isFreeTrial)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent[200],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: const Text(
                        'FREE TRIAL',
                        style: TextStyle(
                          fontFamily: "Aeonik",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF4CAF50),
                        ),
                      ),
                    ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "\$${widget.subscription.price} / ${widget.subscription.billingPeriod}",
                    style: TextStyle(
                      fontFamily: "Aeonik",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Divider(
                  color: Colors.grey[300],
                  thickness: 1.5,
                  height: 20,
                ),
              ),
              Row(
                children: [
                  Text(
                    DateFormat('MMM d').format(widget.subscription.lastRenewal),
                    style: TextStyle(
                      fontFamily: "Aeonik",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                  ),
                  Expanded(
                    child: Icon(
                      Icons.arrow_forward,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    DateFormat('MMM d').format(widget.subscription.nextRenewal),
                    style: TextStyle(
                      fontFamily: "Aeonik",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
