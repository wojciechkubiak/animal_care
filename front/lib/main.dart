import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import './widgets/spinner/spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';

import './blocs/auth/auth_bloc.dart';
import './blocs/login/login_bloc.dart';

// import './blocs/login/login_bloc.dart';
// import './lang/translate_preferences.dart';
import './pages/pages.dart';
import './services/auth_service.dart';
import './config/colors.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthService>(
          create: (context) {
            return AuthService();
          },
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) {
              final authService = RepositoryProvider.of<AuthService>(context);
              return AuthBloc(authService)..add(AuthSplashScreenOK());
            },
          ),
          BlocProvider<LoginBloc>(
            create: (context) {
              final authService = RepositoryProvider.of<AuthService>(context);
              return LoginBloc(authService)..add(LoginLoaded());
            },
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            // appBar: PreferredSize(
            //   preferredSize: Size.fromHeight(0),
            //   // child: AppBar(
            //   //   elevation: 0,
            //   //   backgroundColor: Colors.black,
            //   // ),
            // ),
            body: Theme(
              data: Theme.of(context).copyWith(
                primaryColor: Color(0xFFFF3661), //color of the main banner
                accentColor: Color(
                    0xFFFF3661), //color of circle indicating the selected date
                buttonTheme: ButtonThemeData(
                    textTheme: ButtonTextTheme
                        .accent //color of the text in the button "OK/CANCEL"
                    ),
              ),
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  // if (state is AuthAuthentication) return Home();
                  if (state is AuthNotAuthentication) return Auth();
                  if (state is AuthSplashScreen) return SplashScreen();
                  return SplashScreen();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    print(change);
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(cubit, error, stackTrace);
  }
}
