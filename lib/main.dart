import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class PalestinianFlagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset(0, 0) & size;

    // Define rectangles for the flag's stripes
    final topThirdRect = Rect.fromLTWH(0, 0, size.width, size.height / 3);
    final middleThirdRect =
        Rect.fromLTWH(0, size.height / 3, size.width, size.height / 3);
    final bottomThirdRect =
        Rect.fromLTWH(0, (size.height / 3) * 2, size.width, size.height / 3);

    final paint = Paint();

    // Black stripe
    paint.color = Colors.black;
    canvas.drawRect(topThirdRect, paint);

    // White stripe
    paint.color = Colors.white;
    canvas.drawRect(middleThirdRect, paint);

    // Green stripe
    paint.color = Colors.green;
    canvas.drawRect(bottomThirdRect, paint);

    // Red triangle on the left side
    paint.color = Colors.red;
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height)
      // Adjust the coordinates to control the shape of the triangle
      ..lineTo(size.width / 2.5, size.height / 2)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Palestinian Flag'),
        ),
        body: Center(
          child: CustomPaint(
            size: Size(400, 200), // Adjust the size as needed
            painter: PalestinianFlagPainter(),
          ),
        ),
        // Set the background color to match Discord
        backgroundColor: Color(0xFF36393f),
      ),
      theme: ThemeData(
        primaryColor: Colors.white, // Set the primary color to white
        hintColor: Colors.white, // Set the accent color to white
      ),
    );
  }
}
