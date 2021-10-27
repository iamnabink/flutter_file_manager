import 'dart:io';

import 'package:filesmanager/providers/app_provider.dart';
import 'package:filesmanager/providers/category_provider.dart';
import 'package:filesmanager/providers/core_provider.dart';
import 'package:filesmanager/screens/ios_error.dart';
import 'package:filesmanager/screens/splash.dart';
import 'package:filesmanager/util/consts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => CoreProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (BuildContext context, AppProvider appProvider, Widget child) {
        return MaterialApp(
          key: appProvider.key,
          debugShowCheckedModeBanner: false,
          navigatorKey: appProvider.navigatorKey,
          title: Constants.appName,
          theme: appProvider.theme,
          darkTheme: Constants.darkTheme,
          home: Platform.isIOS?IosError():Splash(),
        );
      },
    );
  }
}