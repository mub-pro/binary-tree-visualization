import 'package:binary_tree_visualization/tree.dart';
import 'package:flutter/material.dart';

class NodeWidget extends StatelessWidget {
  final Node? node;
  const NodeWidget({Key? key, this.node}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double x = 30.0;
    const double y = 50.0;
    return Stack(
      fit: StackFit.loose,
      children: [
        if (node!.parent != null)
          Positioned(
            // left: node!.x,
            // top: node!.y,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: CustomPaint(
                foregroundPainter: LinePainter(
                  p1: Offset(node!.parent!.x! + x, node!.parent!.y! + y),
                  p2: Offset(node!.x! + x, node!.y!),
                ),
              ),
            ),
          ),
        Positioned(
          left: node!.x,
          top: node!.y,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              border: Border.all(color: Colors.blue.shade200, width: 2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '${node!.value}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LinePainter extends CustomPainter {
  Offset p1;
  Offset p2;

  LinePainter({required this.p1, required this.p2});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      p1,
      p2,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
