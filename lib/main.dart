

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDemo(),
    );
  }
}

class GestureDemo extends StatefulWidget {
  const GestureDemo({super.key});

  @override
  State<GestureDemo> createState() => _GestureDemoState();
}

class _GestureDemoState extends State<GestureDemo> {
  // Row move
  double xRow = 0;

  // Column move
  double yCol = 0;

  // Free move
  double xFree = 0;
  double yFree = 0;

  // Color change box
  Color boxColor = Colors.orange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("4 Gesture Containers")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            // ✅ 1. ROW MOVE (Only horizontal)
            GestureDetector(
              onHorizontalDragUpdate: (details) {
                setState(() {
                  xRow += details.delta.dx;
                });
              },
              child: Transform.translate(
                offset: Offset(xRow, 0),
                child: Container(
                  height: 80,
                  width: 200,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: const Text("Row Move"),
                ),
              ),
            ),
            const SizedBox(height: 15),




            // ✅ 2. COLUMN MOVE (Only vertical)
            GestureDetector(
              onVerticalDragUpdate : (details) {
                setState(() {
                  yCol = yCol + details.delta.dy;
                });
              },
              child: Transform.translate(
                offset: Offset(0, yCol),
                child: Container(
                  height: 80,
                  width: 200,
                  color: Colors.green,
                  alignment: Alignment.center,
                  child: const Text("Column Move"),
                ),
              ),
            ),
            const SizedBox(height: 15),


            // ✅ 3. FREE MOVE (Row + Column)
            GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  xFree += details.delta.dx;
                  yFree += details.delta.dy;
                });
              },
              child: Transform.translate(
                offset: Offset(xFree, yFree),
                child: Container(
                  height: 80,
                  width: 200,
                  color: Colors.purple,
                  alignment: Alignment.center,
                  child: const Text("Free Move"),
                ),
              ),
            ),
            const SizedBox(height: 15),




            // ✅ 4. CLICK TO CHANGE COLOR
            GestureDetector(
              onTap: () {
                setState(() {
                  boxColor = boxColor == Colors.orange ? Colors.red : Colors.orange;
                });
              },

              child: Container(
                height: 80,
                width: 200,
                color: boxColor,
                alignment: Alignment.center,
                child: const Text(
                  "Click Me (Color Change)",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}