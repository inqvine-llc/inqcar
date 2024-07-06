import 'dart:async';

import 'package:flutter/material.dart';

class CarTapHandler extends StatefulWidget {
  const CarTapHandler({
    required this.child,
    required this.onTap,
    super.key,
  });

  final Widget child;
  final FutureOr<void> Function() onTap;

  @override
  State<CarTapHandler> createState() => _CarTapHandlerState();
}

class _CarTapHandlerState extends State<CarTapHandler> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: GestureDetector(
        onTapDown: (_) => setState(() => _opacity = 0.5),
        onTapUp: (_) => setState(() => _opacity = 1.0),
        onTapCancel: () => setState(() => _opacity = 1.0),
        onTap: () async {
          await widget.onTap();
          setState(() => _opacity = 1.0);
        },
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 100),
          opacity: _opacity,
          child: widget.child,
        ),
      ),
    );
  }
}
