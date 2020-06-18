import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musik/app/models/Artist.dart';

import '../widgets/SearchBar.dart';
import '../artist_controller.dart';

class SearchPage extends StatefulWidget {
  final String namePage = 'Artistas';

  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends ModularState<SearchPage, ArtistController> {
  _getData() {
    if (controller.artists == null) {
      return <Artist>[];
    }

    return controller.artists.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.namePage),
          centerTitle: true,
        ),
        body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return Center(
        widthFactor: 5,
        heightFactor: 5,
        child: Column(children: <Widget>[
          _buildSearchBar(context),
          _buildResultArea(context)
        ]));
  }

  Widget _buildResultArea(BuildContext context) {
    return Expanded(child: Observer(builder: (BuildContext context) {
      List<Artist> artists = _getData();
      if (artists != null && artists.length > 0) {
        return _buildList(context, artists);
      } else if (artists != null && artists.length == 0) {
        return Center(child: Text('Sem resultado'));
      } else {
        return Center(child: CircularProgressIndicator());
      }
    }));
  }

  Widget _buildList(BuildContext context, List<Artist> artists) {
    return ListView(
        padding: const EdgeInsets.only(top: 20.0),
        children:
            artists.map((artist) => _buildListItem(context, artist)).toList());
  }

  Widget _buildListItem(BuildContext context, Artist artist) {
    return Padding(
        key: ValueKey(artist.id),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          child: ListTile(
            title: Text(artist.name),
            onTap: () {
              String route = '/artists/' + artist.id.toString();
              print(route);
              Modular.to.pushNamed(route);
            },
          ),
        ));
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      child: SearchBar(
        labelText: 'Buscar artista...',
        onChange: controller.searchArtist,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    );
  }
}
