import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_devfest/agenda/cloud_screen.dart';
import 'package:flutter_devfest/agenda/mobile_screen.dart';
import 'package:flutter_devfest/agenda/web_screen.dart';
import 'package:flutter_devfest/home/index.dart';
import 'package:flutter_devfest/universal/dev_scaffold.dart';
import 'package:flutter_devfest/utils/tools.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AgendaPage extends StatelessWidget {
  static const String routeName = "/agenda";

  @override
  Widget build(BuildContext context) {
    var _homeBloc = HomeBloc();
    return DefaultTabController(
      length: 3,
      child: DevScaffold(
        title: "ຕາຕະລາງງານ",
        tabBar: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Tools.multiColors[Random().nextInt(4)],
          labelStyle: TextStyle(
            fontSize: 12,
          ),
          isScrollable: false,
          tabs: <Widget>[
            Tab(
              child: Text("ວິຊາການ"),
              icon: Icon(
                FontAwesomeIcons.code,
                size: 12,
              ),
            ),
            Tab(
              child: Text("ແຮງບັນດານໃຈ"),
              icon: Icon(
                FontAwesomeIcons.lightbulb,
                size: 12,
              ),
            ),
            Tab(
              child: Text("Panelist"),
              icon: Icon(
                FontAwesomeIcons.couch,
                size: 12,
              ),
            )
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            CloudScreen(
              homeBloc: _homeBloc,
            ),
            MobileScreen(
              homeBloc: _homeBloc,
            ),
            WebScreen(
              homeBloc: _homeBloc,
            ),
          ],
        ),
      ),
    );
  }
}
