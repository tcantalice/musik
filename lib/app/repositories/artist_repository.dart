import 'package:dio/dio.dart';
import './repository.dart';
import '../models/Artist.dart';

class ArtistRepository extends Repository {
  const ArtistRepository(Dio dio) : super(dio);

  Future<List<Artist>> search(String query) async {
    final data = await get('artist.search', {'q_artist': query});

    List<Artist> artists = List<Artist>();
    for (final item in (data['artist_list'] as List)) {
      artists.add(Artist.fromJson(item['artist']));
    }

    return artists;
  }

  Future<Artist> find(artistId) async {
    final data = await get('artist.get', {'artist_id': artistId});

    Artist artist = Artist.fromJson(data['artist']);
    return artist;
  }
}
