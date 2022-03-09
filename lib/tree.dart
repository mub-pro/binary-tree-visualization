import 'dart:math';

import 'package:flutter/material.dart';

class Tree {
  Node? root;
  List<Node> nodes = [];

  Node? insert(int value, Size size) {
    Node node = Node.value(value);

    if (root == null) {
      root = node;
      root!.x = size.width / 2;
      root!.y = size.height - (size.height - 40);
      return root;
    }

    Node current = root!;

    while (true) {
      if (value < current.value!.toInt()) {
        if (current.left == null) {
          current.left = node;

          current.left!.distance = current.distance! + 1;
          current.left!.x =
              current.x! - (size.width / pow(2, current.left!.distance!)) - 5;
          current.left!.y = current.y! + (size.height / 5);
          current.left!.parent = current;

          return current.left;
        }
        current = current.left!;
      } else {
        if (current.right == null) {
          current.right = node;

          current.right!.distance = current.distance! + 1;
          current.right!.x =
              current.x! + (size.width / pow(2, current.right!.distance!)) + 5;
          current.right!.y = current.y! + (size.height / 5);
          current.right!.parent = current;

          return current.right;
        }
        current = current.right!;
      }
    }
  }

  void traverse() {
    root!.visit(root!);
  }
}

class Node {
  int? value;
  Node? left;
  Node? right;
  double? x;
  double? y;
  int? distance = 2;
  Node? parent;

  Node();

  Node.value(this.value);

  void visit(Node parent) {
    if (left != null) left!.visit(parent);
    if (right != null) right!.visit(parent);
  }
}
