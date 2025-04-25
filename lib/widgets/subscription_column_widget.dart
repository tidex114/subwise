import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subwise/widgets/subscription_widget.dart';
import 'package:subwise/providers/subscription_provider.dart';
import '../models/subscription.dart';

class SubscriptionColumnWidget extends StatefulWidget {
  const SubscriptionColumnWidget({super.key});


  @override
  State<SubscriptionColumnWidget> createState() =>
      _SubscriptionColumnWidgetState();
}

class _SubscriptionColumnWidgetState extends State<SubscriptionColumnWidget> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<SubscriptionProvider>(context, listen: false)
          .loadSubscriptions();
    });

  }
  @override
  Widget build(BuildContext context) {
    final subscriptions = Provider.of<SubscriptionProvider>(context).subscriptions;

    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: subscriptions.isEmpty
          ? const Center(child: Text('Loading...'))
          : Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25), // 👈 margin inside scroll view
            child: Column(
              children: subscriptions.map((sub) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0), // 👈 space between items
                  child: SubscriptionWidget(sub),
                );
              }).toList(),
            ),
          ),
    );
  }

}
