// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ArtistController on _ArtistControllerBase, Store {
  final _$artistsAtom = Atom(name: '_ArtistControllerBase.artists');

  @override
  ObservableFuture<List<Artist>> get artists {
    _$artistsAtom.reportRead();
    return super.artists;
  }

  @override
  set artists(ObservableFuture<List<Artist>> value) {
    _$artistsAtom.reportWrite(value, super.artists, () {
      super.artists = value;
    });
  }

  final _$_ArtistControllerBaseActionController =
      ActionController(name: '_ArtistControllerBase');

  @override
  dynamic searchArtist(String query) {
    final _$actionInfo = _$_ArtistControllerBaseActionController.startAction(
        name: '_ArtistControllerBase.searchArtist');
    try {
      return super.searchArtist(query);
    } finally {
      _$_ArtistControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
artists: ${artists}
    ''';
  }
}
