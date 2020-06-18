import 'package:dio/dio.dart';
import 'package:musik/app/models/Album.dart';
import './repository.dart';

class AlbumRepository extends Repository {
  const AlbumRepository(Dio dio) : super(dio);

  Future<List<Album>> allByArtist(artistId) async {
    final data = await get('artist.albums.get', {
      'artist_id': artistId,
      's_release_date': 'desc',
      'page_size': 10,
      'g_album_name': 1
    });

    List<Album> albums = [];
    for (final item in (data['album_list'] as List)) {
      albums.add(Album.fromJson(item['album']));
    }

    return albums;
  }
}
