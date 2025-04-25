class Subscription {
  final String name;
  final String price;
  final String billingPeriod;
  final String description;
  final DateTime lastRenewal;
  final DateTime nextRenewal;
  final bool isFreeTrial;

  Subscription({
    required this.name,
    required this.price,
    required this.billingPeriod,
    required this.description,
    required this.lastRenewal,
    required this.nextRenewal,
    required this.isFreeTrial,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      name: json['name'] as String,
      price: json['price'] as String,
      billingPeriod: json['billingPeriod'] as String,
      description: json['description'] as String,
      lastRenewal: DateTime.parse(json['lastRenewal']),
      nextRenewal: DateTime.parse(json['nextRenewal']),
      isFreeTrial: json['isFreeTrial'] as bool,
    );
  }

  factory Subscription.fromMap(Map<String, dynamic> map) {
    return Subscription(
      name: map['name'],
      price: map['price'],
      billingPeriod: map['billingPeriod'],
      description: map['description'],
      lastRenewal: DateTime.parse(map['lastRenewal']),
      nextRenewal: DateTime.parse(map['nextRenewal']),
      isFreeTrial: map['isFreeTrial'] == 1, // SQLite stores booleans as 0/1
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'billingPeriod': billingPeriod,
      'description': description,
      'lastRenewal': lastRenewal.toIso8601String(), // store as string
      'nextRenewal': nextRenewal.toIso8601String(),
      'isFreeTrial': isFreeTrial ? 1 : 0, // convert bool to int
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'billingPeriod': billingPeriod,
      'description': description,
      'lastRenewal': lastRenewal.toIso8601String(),
      'nextRenewal': nextRenewal.toIso8601String(),
      'isFreeTrial': isFreeTrial,
    };
  }
}
