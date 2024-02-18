class TopPicksModel{
  String? url;
  double? rating;
  String? title;

  TopPicksModel({this.url, this.rating, this.title});
}
final List<TopPicksModel> topPicksList=[
  TopPicksModel(url:'https://i.ibb.co/XVYT7M7/movie1.jpg', rating:8.5, title:'OMG'),
  TopPicksModel(url:'https://i.ibb.co/QCT5fMF/movie2.jpg', rating:7.3, title:'Barry'),
  TopPicksModel(url:'https://i.ibb.co/TbJ9cwZ/movie3.jpg', rating:5.2, title:'Breaking Bad')
];