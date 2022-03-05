import 'dart:math';

import 'package:flutter/material.dart';

class Tree {
  Node? root;
  // Size? size;
  List<Node> nodes = [];

  // Tree(this.size);
  // {
  // insert(50);
  // insert(80);
  // insert(17);
  // insert(9);
  // insert(30);
  // insert(75);
  // insert(40);
  // insert(60);
  // insert(55);
  // insert(62);
  // insert(100);
  // insert(20);
  // insert(41);
  // insert(54);
  // insert(56);
  // insert(39);
  // insert(11);
  // insert(5);
  // insert(7);
  // insert(4);
  // insert(12);
  // insert(10);
  // insert(21);
  // insert(19);
  // insert(101);
  // insert(99);
  // insert(76);
  // insert(74);
  // insert(63);
  // insert(61);

  //   traverse();
  // }

  Node? insert(int value, Size size) {
    Node node = Node.value(value);

    if (root == null) {
      root = node;
      root!.x = size.width / 2;
      root!.y = size.height - (size.height - 40);
      // nodes.add(root!);
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
          // current.left!.x = current.x! / 2;
          // current.left!.x =
          //     (current.x! + current.x!) + (min(current.x!, current.x!));
          // current.left!.y = current.y! + 100;
          // nodes.add(current.left!);
          // break;
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
          // current.right!.x = current.x! + (current.x! / 2);
          // current.right!.y = current.y! + 100;
          // nodes.add(current.right!);
          // break;
          return current.right;
        }
        current = current.right!;
      }
    }
  }

  void traverse() {
    root!.visit(root!);
  }

  // void visit(Node node, Node parent) {
  //   if (node.left != null) visit(node.left!, node);
  //   nodes.add(node);
  //   if (node.right != null) visit(node.right!, node);
  // }
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
