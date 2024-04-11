// import 'dart:io';

// import 'package:device_info_plus/device_info_plus.dart';
// import 'dart:async';

// import 'package:get_it/get_it.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// final getIt = GetIt.instance;

// class Di {
//   static final Di _singleton = Di._internal();

//   factory Di() {
//     return _singleton;
//   }

//   Di._internal();

//   Future<void> init() async {
//     final prefs = await SharedPreferences.getInstance();
//     getIt.registerSingletonGuarded(prefs);
//   }
// }

// extension GetItExtension on GetIt {
//   void registerSingletonGuarded<T extends Object>(
//     T instance, {
//     String? instanceName,
//     bool? signalsReady,
//     FutureOr<dynamic> Function(T)? dispose,
//   }) {
//     if (!isRegistered<T>()) {
//       registerSingleton<T>(
//         instance,
//         instanceName: instanceName,
//         signalsReady: signalsReady,
//         dispose: dispose,
//       );
//     }
//   }
// }

// class DependencyInjection {
//   static Future<void> init() async {
//     await Di().init();
//     final deviceInfoPlugin = DeviceInfoPlugin();

//     if (Platform.isAndroid) {
//       final androidDeviceInfo = await deviceInfoPlugin.androidInfo;
//       getIt.registerSingletonGuarded(androidDeviceInfo);
//     }

//     if (Platform.isIOS) {
//       final iOSDeviceInfo = await deviceInfoPlugin.iosInfo;
//       getIt.registerSingletonGuarded(iOSDeviceInfo);
//     }
//   }

//   final getIt = GetIt.instance;
//     getIt.registerSingletonGuarded(Function() TopHeadlineUsecase);
// }
