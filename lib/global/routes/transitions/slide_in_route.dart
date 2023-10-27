// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

class SlideInRoute extends CustomTransitionPage {
  SlideInRoute({
    required Widget child,
    Duration duration = const Duration(milliseconds: 300),
  }) : super(
          child: child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(
                animation,
              ),
              child: child,
            );
          },
          transitionDuration: duration,
        );
}
