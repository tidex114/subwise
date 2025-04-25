import 'package:flutter/material.dart';
import '../models/subscription.dart';
import '../services/db_service.dart';

class SubscriptionProvider with ChangeNotifier {
  List<Subscription> _subscriptions = [];
  double _total = 0;
  bool _isLoading = false;
  List<Subscription> get subscriptions => _subscriptions;
  double get total => _total;

  // Load subscriptions from local DB
  Future<void> loadSubscriptions() async {
    _subscriptions = await DBService.instance.getAllSubscriptions();
    _total = 0;
    if (_subscriptions.isNotEmpty)
      {
        for (final sub in _subscriptions) {
          final price = double.parse(sub.price);
          if (sub.billingPeriod.toLowerCase() == 'yearly') {
            _total += (price / 12).toDouble();
          } else if (sub.billingPeriod.toLowerCase() == 'weekly') {
            _total += (price * 4).toDouble();
          } else if (sub.billingPeriod.toLowerCase() == 'daily') {
            _total += (price * 30).toDouble();
          } else {
            _total += price.toDouble();
          }
        }
      }
    notifyListeners(); // Tell UI to rebuild
  }

  // Add a new subscription
  Future<void> addSubscription(Subscription sub) async {
    await DBService.instance.insertSubscription(sub);
    _subscriptions.add(sub);
    notifyListeners();
  }

  // Remove a subscription
  Future<void> deleteSubscription(int index) async {
    final sub = _subscriptions[index];
    await DBService.instance.deleteSubscription(sub.name!);
    _subscriptions.removeAt(index);
    notifyListeners();
  }

  // Optional: clear all (for dev testing)
  Future<void> clearAll() async {
    for (final sub in _subscriptions) {
      await DBService.instance.deleteSubscription(sub.name!);
    }
    _subscriptions.clear();
    notifyListeners();
  }
}
