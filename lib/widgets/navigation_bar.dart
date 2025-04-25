import 'package:flutter/material.dart';
import 'package:subwise/widgets/add_sub_button.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // 👈 allows overflow outside the Stack
      children: [
        Container(
          height: 70,
          decoration: BoxDecoration(
            color: const Color(0xFF031609),
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
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.list_rounded, size: 35),
                  color: Colors.white,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.person, size: 35),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),

        // 👇 AddSubButton overflow at the top
        Positioned(
          top: -25, // adjust this to control how far it floats above the nav
          left: 0,
          right: 0,
          child: Center(
            child: AddSubButton(),
          ),
        ),
      ],
    );
  }

}
