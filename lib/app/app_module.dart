import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

import './modules/artist/artist_module.dart';
import './modules/home/home_module.dart';
import './app_widget.dart';
import './utils/constants.dart';

class AppModule extends MainModule {
  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [
        Bind(
            (i) => Dio(BaseOptions(
                baseUrl: API_URL, queryParameters: {'apikey': API_KEY})),
            singleton: true),
      ];

  // Provide all the routes for your module
  @override
  List<Router> get routers => [
        Router('/', module: HomeModule()),
        Router('/artists', module: ArtistModule())
      ];

  // Provide the root widget associated with your module
  // In this case, it's the widget you created in the first step
  @override
  Widget get bootstrap => AppWidget();
}
