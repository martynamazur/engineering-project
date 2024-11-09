import 'dart:async';

import 'package:flutter/material.dart';

class TimerButton extends StatefulWidget {
  final String text;
  final Duration cooldownDuration;
  final VoidCallback onPressed;

  const TimerButton({
    Key? key,
    required this.text,
    required this.cooldownDuration,
    required this.onPressed,
  }) : super(key: key);

  @override
  _TimerButtonState createState() => _TimerButtonState();
}

class _TimerButtonState extends State<TimerButton> {
  late Timer _timer;
  bool _isCooldownActive = false;
  late int _remainingSeconds;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.cooldownDuration.inSeconds;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startCooldown() {
    setState(() {
      _isCooldownActive = true;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _timer.cancel();
          _isCooldownActive = false;
        }
      });
    });
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _isCooldownActive ? null : _startCooldown,
      style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(double.infinity, 48)),),
      child: _isCooldownActive
          ? Text('Send it again after: $_remainingSeconds seconds')
          : Text(widget.text),
    );
  }
}
