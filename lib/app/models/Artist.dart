import './Album.dart';

class Artist {
  int _id;
  String _name;
  String _country;
  int _rating;
  String _twitter;

  Artist.fromJson(Map<String, dynamic> json) {
    _id = json['artist_id'];
    _name = json['artist_name'];
    _country = json['artist_country'];
    _rating = json['artist_rating'];
    _twitter = json['artist_twitter'];
  }

  String get name => this._name;

  int get id => this._id;

  int get rating => this._rating;

  String get twitter => this._twitter;

  String get country => this._country;
}
