import 'package:mobx/mobx.dart';

import 'package:musik/app/models/Artist.dart';
import 'package:musik/app/models/Album.dart';
import 'package:musik/app/repositories/artist_repository.dart';
import 'package:musik/app/repositories/album_repository.dart';

part 'artist_controller.g.dart';

class ArtistController = _ArtistControllerBase with _$ArtistController;

abstract class _ArtistControllerBase with Store {
  final ArtistRepository _artistRepository;
  final AlbumRepository _albumRepository;

  _ArtistControllerBase([this._artistRepository, this._albumRepository]);

  @observable
  ObservableFuture<List<Artist>> artists;

  @observable
  ObservableFuture<Artist> artist;

  @observable
  ObservableFuture<List<Album>> artistAlbums;

  @action
  searchArtist(String query) {
    if (query.length == 0) {
      this.artists = null;
    } else {
      this.artists = _artistRepository.search(query).asObservable();
    }
  }

  @action
  getArtist(artistId) {
    this.artist = _artistRepository.find(artistId).asObservable();
    this.artistAlbums = _albumRepository.allByArtist(artistId).asObservable();
  }
}
