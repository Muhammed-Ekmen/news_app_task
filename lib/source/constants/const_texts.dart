class IConstTexts {
  IConstTexts._();
  static final IConstTexts _constTexts = IConstTexts._();
  static IConstTexts get shared => _constTexts;
  final String newsApplication = "News Application";
  final String newsAppTitle = "News App";
  final String none = "------";
  final String favorites = "Favorites";
  final String searchTextFieldHint = "Search key word to titles...";
  final String newsSource = "News Source";
  final String noFavorite = "No Favorite";
}
