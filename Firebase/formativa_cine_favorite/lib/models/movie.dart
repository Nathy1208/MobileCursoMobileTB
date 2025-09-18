//classe modelo de filmes

class Movie {
  //atrib.
  final int id;
  final String title;
  final String posterpath;

  double rating;

  //construc.
  Movie({
    required this.id,
    required this.title,
    required this.posterpath,
    this.rating = 0.0
  });

  Map<String,dynamic> toMap(){
    return{
      "id":id,
      "title":title,
      "posterPath":posterpath,
      "rating":rating
    };
  }

  factory Movie.fromMap(Map<String,dynamic> map) {
    return Movie(
      id: map ["id"], 
      title: map["title"], 
      posterpath: map["posterPath"]);
  }
}