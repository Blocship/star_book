import 'package:hive/hive.dart';

// Files
import '../utils/constant.dart';

part 'brightness.g.dart';

/// Enumeration - To keep check on Brightness Level of Application
@HiveType(typeId: kBrightnessTypeId)
enum BrightnessOption {
  @HiveField(0)
  light,
  @HiveField(1)
  dark,
  @HiveField(2)
  auto,
}
