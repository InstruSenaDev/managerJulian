import 'package:fluro/fluro.dart';
import 'package:managerapp/iu/views/Centros/CentrosView.dart';
import 'package:managerapp/iu/views/Ciudades/CiudadesView.dart';
import 'package:managerapp/iu/views/Clientes/ClientesView.dart';
import 'package:managerapp/iu/views/Clientes/NuevoCliente.dart';
import 'package:managerapp/iu/views/Foros/ForosView.dart';
import 'package:managerapp/iu/views/Recomendaciones/RecomendacionesView.dart';
import 'package:managerapp/iu/views/Procedimientos/ProcedimientosView.dart';
import 'package:managerapp/iu/views/Ubicaciones/UbicacionesView.dart';
import 'package:managerapp/iu/views/Usuarios/UsuarioView.dart';
import 'package:provider/provider.dart';

import '../auth/authProvider.dart';
import '../iu/views/Dashboard/dashboardView.dart';
import '../iu/views/Login/loginView.dart';
import '../services/sideMenuProvide.dart';
import '../services/view404.dart';
import 'router.dart';

class AdminHandlers {
  static Handler login = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.authStatus == AuthStatus.notAuthenticated) {
      print('aaaaaaaaaaaaaaaaaaaa');
      return const LoginView();
    } else {
      return View404();
    }
  });

  static Handler dashboardMain = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.dashboardRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const DashboardView();
    } else {
      return const LoginView(); // (8-5)*5;
    }
  });

  static Handler usuarioRoute = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.usuarioRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const UsuarioView();
    } else {
      return const LoginView();
    }
  });

  // ************* Clientes **********************
  static Handler clientesRoute = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.clientesRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const ClientesView();
    } else {
      return const LoginView();
    }
  });

  static Handler nuevoClienteRoute = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.nuevoClienteRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const NuevoCliente();
    } else {
      return const LoginView();
    }
  });
  // ************* Fin Clientes **********************


  
  static Handler procedimientosRoute = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.procedimientosRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const ProcedimientosView();
    } else {
      return const LoginView();
    }
  });
  static Handler recomendacionesRoute = Handler(handlerFunc: (context, params) {
    //forosRoute
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.recomendacionesRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const RecomendacionesPages();
    } else {
      return const LoginView();
    }
  });

  static Handler forosRoute = Handler(handlerFunc: (context, params) {
    //forosRoute
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.forosRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const ForosPages();
    } else {
      return const LoginView();
    }
  });

  static Handler centrosRoute = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.centrosRoute);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return CentrosPages();
    // return CarritoView();
    else
      return LoginView();
  });

  static Handler ubicacionesRoute = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.ubicacionesRoute);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return UbicacionesPages();
    // return CarritoView();
    else
      return LoginView();
  });

  static Handler ciudadesRoute = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.ciudadesRoute);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return CiudadesView();
    // return CarritoView();
    else
      return LoginView();
  });

  // static Handler tiendaCarrito = Handler(handlerFunc: (context, params) {
  //   final authProvider = Provider.of<AuthProvider>(context!);

  //   if (authProvider.authStatus == AuthStatus.tienda)
  //     return CarritoView();
  //   else
  //     return TiendaView();
  // });
}
