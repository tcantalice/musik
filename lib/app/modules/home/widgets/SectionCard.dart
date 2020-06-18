import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SectionCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final String routeSection;

  const SectionCard({Key key, this.name, this.icon, this.routeSection})
      : super(key: key);

  _toSection() {
    Modular.to.pushNamed(routeSection);
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      // padding: EdgeInsets.all(2),
      shape: RoundedRectangleBorder(),
      onPressed: _toSection,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon(icon, size: 80, color: Colors.white),
          ),
          Container(
            child: Text(
              name,
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
