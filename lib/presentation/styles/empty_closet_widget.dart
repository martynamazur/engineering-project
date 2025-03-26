import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class EmptyClosetWidget extends StatelessWidget {
  final String message;
  final TextStyle? style;

  const EmptyClosetWidget({
    Key? key,
    this.message = "Empty closet",
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => context.tabsRouter.setActiveIndex(2),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.lightGreenAccent,
            ),
            child: Icon(Icons.add),
          ),
        ),
        Center(
          child: Text(
            message,
            style: style ?? Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ],
    );
  }


}
