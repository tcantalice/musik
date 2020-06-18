import 'package:flutter_modular/flutter_modular.dart';
import './home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
      ];

  @override
  List<Bind> get binds => [];
}
