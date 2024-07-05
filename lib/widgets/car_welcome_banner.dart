import 'package:flutter/material.dart';

class CarWelcomeBanner extends StatelessWidget {
  const CarWelcomeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 72.0,
          width: 72.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36.0),
            gradient: const LinearGradient(
              colors: <Color>[
                Color(0xFFFD297B),
                Color(0xFF1B06A6),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
        ),
        const SizedBox(width: 15.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'John Doe',
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 2.0),
            Text('Switch profile',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.textTheme.labelLarge?.color?.withOpacity(0.6),
                )),
          ],
        ),
      ],
    );
  }
}
