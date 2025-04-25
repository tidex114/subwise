class Subscription {
  final int? id;
  final String name;
  final double amount;
  final String billingCycle; // "Monthly" or "Yearly"
  final DateTime nextRenewal;
  final bool isTrial;

  Subscription({
    this.id,
    required this.name,
    required this.amount,
    required this.billingCycle,
    required this.nextRenewal,
    this.isTrial = false,
  });

// Add fromMap() and toMap() for DB
}
