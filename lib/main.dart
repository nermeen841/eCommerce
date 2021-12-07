import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/CacheHelper/mySharedPreference.dart';
import 'package:shop_app/screens/add_address/address_provider.dart';
import 'package:shop_app/screens/app_cubit/appState.dart';
import 'package:shop_app/screens/app_cubit/cubit.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/theme.dart';
import 'generated/coden_loader.dart';
import 'generated/setup_local.dart';

void main() async {
  //  setupLocator();
  // Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  bool isDark = await CacheHelper.getAppMode();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MapDataProvider>(
          create: (_) => MapDataProvider(),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/lang', // <-- change patch to your
        assetLoader: CodegenLoader(),
        child: MyApp(
          isDark: isDark,
        ),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  final bool isDark;

  const MyApp({Key key, this.isDark}) : super(key: key);

  // This widget is the root of your application.
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale myLocale;

  setLocale(Locale locale) async {
    setState(() {
      myLocale = locale;
    });
  }

  @override
  // ignore: unused_element
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this.myLocale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_element

    return BlocProvider(
      create: (BuildContext context) =>
          AppCubit()..changeAppThememode(fromShared: widget.isDark),
      child: BlocConsumer<AppCubit, AppcubitStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            // ignore: missing_return
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              for (var supportedLocale in supportedLocales) {
                if (deviceLocale.languageCode == supportedLocale.languageCode) {
                  // ignore: deprecated_member_use
                  context.locale = Locale("${deviceLocale.languageCode}");
                  CacheHelper.saveLang("${deviceLocale.languageCode}");
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },

            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,

            debugShowCheckedModeBanner: false,
            darkTheme: darkTheme(),
            theme: theme(),
            themeMode: ThemeMode.light,
            // AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: MyCustomSplashScreen(),
            // initialRoute: SplashScreen.routeName,
            // routes: routes,
          );
        },
      ),
    );
  }
}
