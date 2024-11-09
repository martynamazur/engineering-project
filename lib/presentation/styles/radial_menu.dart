import 'package:flutter/material.dart';

class RadialMenuExample extends StatefulWidget {
  @override
  _RadialMenuExampleState createState() => _RadialMenuExampleState();
}

class _RadialMenuExampleState extends State<RadialMenuExample> with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  void toggleMenu() {
    if (isOpen) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    setState(() {
      isOpen = !isOpen;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (isOpen) // Display radial menu options when menu is open
          Positioned(
            bottom: 100, // Adjust the position of the radial menu
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Circle icons
                buildOption(Icons.directions_car, 0),
                buildOption(Icons.directions_bike, 45),
                buildOption(Icons.directions_boat, 90),
                buildOption(Icons.directions_bus, 135),
                buildOption(Icons.directions_railway, 180),
              ],
            ),
          ),
        Positioned(
          bottom: 16, // Position the FloatingActionButton
          child: FloatingActionButton(
            onPressed: toggleMenu,
            child: Icon(isOpen ? Icons.close : Icons.add),
          ),
        ),
      ],
    );
  }

  Widget buildOption(IconData icon, double angle) {
    final radius = 100.0;
    final offset = Offset.fromDirection(angle * (3.1416 / 180), _animation.value * radius);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: offset,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue,
            child: IconButton(
              icon: Icon(icon, color: Colors.white),
              onPressed: () {},
            ),
          ),
        );
      },
    );
  }
}
