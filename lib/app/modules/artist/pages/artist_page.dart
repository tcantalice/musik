import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:musik/app/models/Artist.dart';
import 'package:musik/app/models/Album.dart';

import '../artist_controller.dart';

class ArtistPage extends StatefulWidget {
  final id;
  final String pageName = 'Artista';

  ArtistPage({Key key, this.id}) : super(key: key);

  @override
  _ArtistPageState createState() => _ArtistPageState();
}

class _ArtistPageState extends ModularState<ArtistPage, ArtistController> {
  Artist _getArtist() {
    if (controller.artist != null && controller.artist.value != null) {
      return controller.artist.value;
    }
    return null;
  }

  List<Album> _getAlbums() {
    if (controller.artistAlbums != null &&
        controller.artistAlbums.value != null) {
      return controller.artistAlbums.value;
    }
    return null;
  }

  @override
  void initState() {
    controller.getArtist(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.pageName),
          centerTitle: true,
        ),
        body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      Artist artist = _getArtist();
      List<Album> albums = _getAlbums();
      if (artist == null || albums == null) {
        return Center(child: CircularProgressIndicator());
      } else {
        return SizedBox.expand(
            child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildSectionArtist(artist),
              Container(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'Álbuns',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(child: _buildListAlbums(albums))
            ],
          ),
        ));
      }
    });
  }

  Widget _buildSectionArtist(Artist artist) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        height: 150,
        color: Colors.grey[300],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              artist.name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text('Popularidade ${artist.rating}%',
                style: TextStyle(
                  color: Colors.grey[850],
                )),
            FlatButton(
              color: Colors.blue,
              child: Text('Twitter do artista'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListAlbums(List<Album> albums) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: albums.map((album) => _buildAlbumItem(album)).toList(),
    );
  }

  Widget _buildAlbumItem(Album album) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        child: ListTile(
          title: Text(album.name),
          subtitle: Text('Ano de lançamento: ${album.release.year}'),
        ),
      ),
    );
  }
}
