import 'package:flutter/material.dart';
import 'package:inqcar/constants/design_constants.dart';
import 'package:inqcar/models/car_application.dart';
import 'package:inqcar/widgets/car_navigation_bar.dart';
import 'package:inqcar/widgets/car_status_bar.dart';
import 'package:inqcar/widgets/car_tap_handler.dart';
import 'package:sprung/sprung.dart';

class CarScaffold extends StatefulWidget {
  const CarScaffold({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<CarScaffold> createState() => _CarScaffoldState();
}

class _CarScaffoldState extends State<CarScaffold> with SingleTickerProviderStateMixin {
  CarApplication? _currentApplication;
  CarApplication? get currentApplication => _currentApplication;
  set currentApplication(CarApplication? value) {
    if (value != null) {
      _currentApplication = value;
      if (mounted) {
        setState(() {});
      }
    }
  }

  late AnimationController _drawerAnimationController;
  late Animation<double> _drawerAnimation;
  bool _isDrawerOpen = false;

  @override
  void initState() {
    super.initState();
    _drawerAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    _drawerAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _drawerAnimationController, curve: Sprung.overDamped),
    );
  }

  @override
  void dispose() {
    _drawerAnimationController.dispose();
    super.dispose();
  }

  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
      if (_isDrawerOpen) {
        _drawerAnimationController.forward();
      } else {
        _drawerAnimationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Material(
      type: MaterialType.transparency,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: <Color>[
              AppTheme.current.greyPalette[3],
              AppTheme.current.greyPalette[5],
            ],
            center: Alignment.center,
            radius: 1.5,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned.fill(child: widget.child),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: CarTapHandler(
                onTap: _toggleDrawer,
                child: const CarStatusBar(),
              ),
            ),
            Positioned(
              bottom: AppTheme.current.paddingSmall,
              left: AppTheme.current.paddingSmall,
              right: AppTheme.current.paddingSmall,
              child: CarNavigationBar(
                currentApplication: currentApplication,
                onApplicationTapped: (CarApplication app) {
                  currentApplication = app;
                },
              ),
            ),
            AnimatedBuilder(
              animation: _drawerAnimation,
              builder: (context, child) {
                return Positioned(
                  top: -screenHeight + (screenHeight * _drawerAnimation.value),
                  left: 0,
                  right: 0,
                  height: screenHeight,
                  child: _buildDrawer(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Container(
      color: Colors.black.withOpacity(0.8),
      child: Column(
        children: [
          const SizedBox(height: 40), // Space for status bar
          const Text(
            'Quick Settings',
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          // Add your quick settings here
          ElevatedButton(
            onPressed: _toggleDrawer,
            child: const Text('Close Drawer'),
          ),
        ],
      ),
    );
  }
}
