import 'package:get_it/get_it.dart';
import 'package:take_notes/core/services/authentication_service.dart';
import 'package:take_notes/core/services/firestore_service.dart';
import 'package:take_notes/core/services/localstorage_service.dart';
import 'package:take_notes/core/services/theme_service.dart';
import 'package:take_notes/core/viewmodels/home_model.dart';
import 'package:take_notes/core/viewmodels/login_model.dart';
import 'package:take_notes/core/viewmodels/logoutbutton_model.dart';
import 'package:take_notes/core/viewmodels/settings_model.dart';


GetIt locator = GetIt();

Future setupLocator() async {

  var instance = await LocalStorageService.getInstance();
  locator.registerSingleton<LocalStorageService>(instance);

  locator.registerLazySingleton(() => AuthenticationService());

  locator.registerFactory(() => FirestoreService());

  locator.registerLazySingleton(() => ThemeService());

  locator.registerLazySingleton(() => SettingsModel());
  
  locator.registerFactory(() => HomeModel());

  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => LogoutButtonModel());
}