import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subwise/widgets/add_sub_button.dart';
import 'package:subwise/widgets/monthly_spend_card_widget.dart';
import 'package:subwise/widgets/navigation_bar.dart';

import '../providers/subscription_provider.dart';
import '../widgets/subscription_column_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<SubscriptionProvider>(context, listen: false).loadSubscriptions();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SizedBox(
            height: 45, // Adjust the height as needed
            child: Image.asset("assets/images/title_logo.png"),
          ),
        ),
        toolbarHeight: 80,
        backgroundColor: Color(0xFF031609),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.menu,
              size: 32,
              color: Colors.white,
            ),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100), // prevent scroll under button
            child: Column(
              children: [
                SizedBox(height: 25),
                MonthlySpendCardWidget(),
                SubscriptionColumnWidget(),
                SizedBox(height: 60),
              ],
            ),
          ),

          // Bottom-centered navbar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: CustomNavigationBar(), // your FAB or custom button widget
            ),
          ),
        ],
      ),
    );
  }
}
