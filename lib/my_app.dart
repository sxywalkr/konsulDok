import 'package:flutter/material.dart';
import 'package:hecxd/app_localizations.dart';
import 'package:hecxd/auth_widget_builder.dart';
import 'package:hecxd/constants/app_themes.dart';
import 'package:hecxd/flavor.dart';
import 'package:hecxd/models/user_model.dart';
import 'package:hecxd/providers/auth_provider.dart';
import 'package:hecxd/providers/language_provider.dart';
import 'package:hecxd/providers/theme_provider.dart';
import 'package:hecxd/routes.dart';
import 'package:hecxd/services/firestore_database.dart';
import 'package:hecxd/ui/auth/sign_in_screen.dart';
import 'package:hecxd/ui/home/home.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key, this.databaseBuilder}) : super(key: key);

  // Expose builders for 3rd party services at the root of the widget tree
  // This is useful when mocking services while testing
  final FirestoreDatabase Function(BuildContext context, String uid)
      databaseBuilder;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (_, themeProviderRef, __) {
        //{context, data, child}
        return Consumer<LanguageProvider>(
          builder: (_, languageProviderRef, __) {
            return AuthWidgetBuilder(
              databaseBuilder: databaseBuilder,
              builder: (BuildContext context,
                  AsyncSnapshot<UserModel> userSnapshot) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  locale: languageProviderRef.appLocale,
                  //List of all supported locales
                  supportedLocales: [
                    Locale('en', 'US'),
                    Locale('zh', 'CN'),
                  ],
                  //These delegates make sure that the localization data for the proper language is loaded
                  localizationsDelegates: [
                    //A class which loads the translations from JSON files
                    AppLocalizations.delegate,
                    //Built-in localization of basic text for Material widgets (means those default Material widget such as alert dialog icon text)
                    GlobalMaterialLocalizations.delegate,
                    //Built-in localization for text direction LTR/RTL
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  //return a locale which will be used by the app
                  localeResolutionCallback: (locale, supportedLocales) {
                    //check if the current device locale is supported or not
                    for (var supportedLocale in supportedLocales) {
                      if (supportedLocale.languageCode ==
                              locale?.languageCode ||
                          supportedLocale.countryCode == locale?.countryCode) {
                        return supportedLocale;
                      }
                    }
                    //if the locale from the mobile device is not supported yet,
                    //user the first one from the list (in our case, that will be English)
                    return supportedLocales.first;
                  },
                  title: 'StockMon', // Provider.of<Flavor>(context).toString(),
                  routes: Routes.routes,
                  theme: AppThemes.lightTheme,
                  darkTheme: AppThemes.darkTheme,
                  themeMode: themeProviderRef.isDarkModeOn
                      ? ThemeMode.dark
                      : ThemeMode.light,
                  home: Consumer<AuthProvider>(
                    builder: (_, authProviderRef, __) {
                      if (userSnapshot.connectionState ==
                          ConnectionState.active) {
                        if (userSnapshot.hasData) {
                          print(
                              'my_app, cek disini rolenya >> ${userSnapshot.data.uid}');
                        }
                        return userSnapshot.hasData
                            ? HomeScreen()
                            : SignInScreen();
                      }

                      return Material(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
