import 'package:flutter/material.dart';

enum MenuEnum {
  cosyArea(Icons.security, 'Cosy areas'),
  price(Icons.wallet, 'Price'),
  infrastructure(Icons.shopping_basket, 'Infrastructure'),
  withoutAnyLayer(Icons.layers, 'Without any layer');

  const MenuEnum(this.icon, this.label);
  final IconData icon;
  final String label;
}
