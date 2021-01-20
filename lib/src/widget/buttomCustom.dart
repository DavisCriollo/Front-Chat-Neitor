
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:neitorvet/src/utils/responsive.dart';

class BottonCustom extends StatelessWidget {
  final title;
  final Widget child;
  // final Function onPress;

  BottonCustom({
    @required this.title,
    @required this.child,
    // @required this.onPress,
  });
  @override
  Widget build(BuildContext context) {
    final Responsive size = Responsive.of(context);
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFF9c27b0),
          borderRadius: BorderRadius.circular(size.iScreen(1))),
      width: size.wScreen(60.0),
      child: FlatButton(
        child: Text(
          this.title,
          style: TextStyle(
              fontSize: size.hScreen(2.5),
              color: Colors.white,
              letterSpacing: 1.0),
        ),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  FadeIn(duration: Duration(seconds: 2), child: child),
            ),
          );
        },
      ),
    );
  }
}
