import 'package:flutter_modular/flutter_modular.dart';
import 'package:musik/app/repositories/artist_repository.dart';
import 'package:musik/app/repositories/album_repository.dart';
import 'package:dio/dio.dart';

import './artist_controller.dart';
import './pages/search_page.dart';
import './pages/artist_page.dart';

class ArtistModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ArtistController(
            i.get<ArtistRepository>(), i.get<AlbumRepository>())),
        Bind((i) => ArtistRepository(i.get<Dio>())),
        Bind((i) => AlbumRepository(i.get<Dio>())),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => SearchPage()),
        Router('/:id', child: (_, args) => ArtistPage(id: args.params['id'])),
      ];
}
