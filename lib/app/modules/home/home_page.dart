import 'package:flutter/material.dart';
import 'package:musik/app/utils/constants.dart';
import './widgets/SectionCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APP_NAME),
        centerTitle: true,
      ),
      body: Center(
        child: _buildGrid(context),
      ),
    );
  }

  Widget _buildGrid(BuildContext context) {
    return GridView(
      children: _sections(),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }

  List<Widget> _sections() {
    return <Widget>[
      SectionCard(
          name: 'Artistas', icon: Icons.person, routeSection: '/artists'),
    ];
  }
}
