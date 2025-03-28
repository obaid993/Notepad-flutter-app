import 'package:hive_flutter/hive_flutter.dart';
part 'darkmode.g.dart';

@HiveType(typeId: 1)
class DarkMode extends HiveObject {
  @HiveField(0)
  bool isDarkTheme = false;

  DarkMode({required this.isDarkTheme});
}
