import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/subscription.dart';
import '../providers/subscription_provider.dart';

class AddSubButton extends StatelessWidget {
  const AddSubButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
        backgroundColor: const Color(0xFF59FF91),
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) {
            final nameController = TextEditingController();
            final priceController = TextEditingController();
            final periodController = TextEditingController();

            return Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  TextField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Price'),
                  ),
                  TextField(
                    controller: periodController,
                    decoration: InputDecoration(labelText: 'Billing Period'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final name = nameController.text;
                      final price = priceController.text;
                      final period = periodController.text;

                      if (name.isNotEmpty &&
                          price.isNotEmpty &&
                          period.isNotEmpty) {
                        Provider.of<SubscriptionProvider>(context,
                                listen: false)
                            .addSubscription(
                          Subscription(
                            name: name,
                            price: price,
                            billingPeriod: period,
                            description: '',
                            lastRenewal: DateTime.now(),
                            nextRenewal: DateTime.now().add(Duration(days: 30)),
                            isFreeTrial: false,
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Add Subscription'),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: const Icon(
        Icons.add,
        weight: 1000,
        color: Colors.black87,//Color(0xFF15A64C),
        size: 32,
      ),
    );
  }
}
