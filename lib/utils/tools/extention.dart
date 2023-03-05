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
        return const Color(0xFFe9edf0);
      case IColors.corduroy:
        return const Color(0xFF567189);
      case IColors.fiord:
        return const Color(0xFF3f5270);
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
        return Icon(Icons.favorite, color: IColors.athenaGrey.apply);
      default:
        return const Icon(Icons.error);
    }
  }
}

extension IMeasuresExt on IMeasures {
  EdgeInsetsGeometry get adjust {
    switch (this) {
      case IMeasures.screenOrientation:
        return EdgeInsets.only(top: Get.height / 50, left: Get.width / 25, right: Get.width / 25, bottom: Get.height / 75);
      default:
        return EdgeInsets.zero;
    }
  }
}
