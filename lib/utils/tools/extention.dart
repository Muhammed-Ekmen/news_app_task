part of '../tools/enums.dart';

extension IRoutesExt on IRoutes {
  String get path {
    switch (this) {
      case IRoutes.splash:
        return "/";
      default:
        return "/$name";
    }
  }
}

extension ITextStyleExt on ITextStyles {
  TextStyle get apply {
    switch (this) {
      case ITextStyles.demi:
        return TextStyle(color: IColors.athenaGrey.apply, fontSize: 14);
      case ITextStyles.short:
        return TextStyle(color: IColors.athenaGrey.apply, fontSize: 16);
      case ITextStyles.tall:
        return TextStyle(color: IColors.athenaGrey.apply, fontSize: 20);
      case ITextStyles.venti:
        return TextStyle(color: IColors.athenaGrey.apply, fontSize: 32);
      default:
        return const TextStyle();
    }
  }
}

extension IColorsExt on IColors {
  Color get apply {
    switch (this) {
      case IColors.athenaGrey:
        return Colors.white;
      case IColors.corduroy:
        return Colors.black;
      case IColors.lavender:
        return Colors.pink;
      default:
        return Colors.black;
    }
  }
}

extension IDurationExt on IDuration {
  Duration get adjust {
    switch (this) {
      case IDuration.short:
        return const Duration(seconds: 2);
      default:
        return const Duration(seconds: 1);
    }
  }
}

extension LauncherTabsExt on LauncherTabs {
  Icon get getIcon {
    switch (this) {
      case LauncherTabs.home:
        return Icon(Icons.home, color: IColors.athenaGrey.apply);
      case LauncherTabs.favorite:
        return Icon(Icons.favorite, color: IColors.lavender.apply);
      default:
        return const Icon(Icons.error);
    }
  }
}
