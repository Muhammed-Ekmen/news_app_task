class IConstTexts {
  IConstTexts._();
  static final IConstTexts _constTexts = IConstTexts._();
  static IConstTexts get shared => _constTexts;
  final String newsApplication = "News Application";
  final String newsAppTitle = "News App";
  final String none = "None";
  final String favorites = "Favorites";
  final String searchTextFieldHint = "Please enter the any key word...";
  final String newsSource = "News Source";
}
