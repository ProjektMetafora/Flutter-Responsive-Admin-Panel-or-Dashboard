import 'package:flutter/material.dart';

/// Padding extension
extension CustomExtension on Widget {
  Widget padAll(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);

  Widget padSym(double v, double h) => Padding(
      padding: EdgeInsets.symmetric(vertical: v, horizontal: h), child: this);

  Widget padT(double top) =>
      Padding(padding: EdgeInsets.only(top: top), child: this);

  Widget padL(double left) =>
      Padding(padding: EdgeInsets.only(left: left), child: this);

  Widget padR(double right) =>
      Padding(padding: EdgeInsets.only(right: right), child: this);

  Widget padB(double bottom) =>
      Padding(padding: EdgeInsets.only(bottom: bottom), child: this);

  Widget padOnly(double t, double l, double b, double r) =>
      Padding(padding: EdgeInsets.fromLTRB(l, t, r, b), child: this);
}
