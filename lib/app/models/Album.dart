class Album {
  int _id;
  String _name;
  int _rating;
  DateTime _release;

  Album.fromJson(Map<String, dynamic> json) {
    _id = json['album_id'];
    _name = json['album_name'];
    _rating = json['album_rating'];
    _release = DateTime.parse(json['album_release_date'].replaceAll('-', ''));
  }

  String get name => this._name;
  DateTime get release => this._release;
}
