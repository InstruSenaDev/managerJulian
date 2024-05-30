import 'package:flutter/material.dart';
import 'package:managerapp/Provider/Clientes/ClientesFromProvider.dart';
import 'package:managerapp/Provider/Foro/ForoFromProvider.dart';
import 'package:managerapp/Provider/Foro/ForoProvider.dart';
import 'package:managerapp/Provider/Procedimientos/ProcedimientosFromProvider.dart';
import 'package:managerapp/Provider/Procedimientos/ProcedimientosProvider.dart';
import 'package:managerapp/Provider/Recomendaciones/RecomendacionesFromProvider.dart';
import 'package:managerapp/Provider/Recomendaciones/RecomendacionesProvider.dart';
import 'package:managerapp/Provider/Usuarios/UsuarioFromProvider.dart';
import 'package:managerapp/Provider/Usuarios/UsuarioProvider.dart';

import 'package:managerapp/services/view404.dart';
import 'package:provider/provider.dart';

import 'Provider/Clientes/ClientesProvider.dart';
import 'api/AllApi.dart';
import 'auth/authProvider.dart';
import 'iu/layout/LoginLayout.dart';
import 'iu/layout/dashboadLayout.dart';
import 'routes/router.dart';
import 'services/navigationService.dart';
import 'services/notificationService.dart';
import 'services/sideMenuProvide.dart';

void main() {
  Flurorouter.configureRoutes();
  AllApi.configuteDio();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('__________>ZZZZZ');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: (_) => AuthProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => SideMenuProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => UsuariosProvider()),
        ChangeNotifierProvider(
            lazy: false, create: (_) => UsuariosFromProvider()),
        ChangeNotifierProvider(
            lazy: false, create: (_) => ClientesFromProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => ClienteProvider()),
        ChangeNotifierProvider(
            lazy: false, create: (_) => ProcedimientosProvider()),
        ChangeNotifierProvider(
            lazy: false, create: (_) => ProcedimientosFromProvider()),
        ChangeNotifierProvider(
            lazy: false, create: (_) => RecomendacionesFromProvider()),
        ChangeNotifierProvider(
            lazy: false, create: (_) => RecomendacionesProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => ForoProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => ForoFromProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Manager',
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      scaffoldMessengerKey: NotificationService.msnKey,
      builder: (context, child) {
        if (authProvider.authStatus == AuthStatus.notAuthenticated) {
          return LoginLayout(child: child!);
        } else if (authProvider.authStatus == AuthStatus.authenticated) {
          return DashboardLayout(
            child: child!,
          );
        } else {
          return View404();
        }
      },
    );
  }
}
