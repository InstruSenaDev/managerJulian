import 'package:fluro/fluro.dart';
import 'package:managerapp/iu/views/Clientes/ClientesView.dart';
import 'package:managerapp/iu/views/Pedidos/PedidosView.dart';
import 'package:managerapp/iu/views/Procedimientos/ProcedimientosView.dart';
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

  static Handler pedidosRoute = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.pedidosRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const PedidosView();
    } else {
      return const LoginView();
    }
  });

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

  // static Handler tienda = Handler(handlerFunc: (context, params) {
  //   final authProvider = Provider.of<AuthProvider>(context!);

  //   if (authProvider.authStatus == AuthStatus.tienda)
  //     return TiendaView();
  //   // return CarritoView();
  //   else
  //     return LoginView();
  // });

  // static Handler tiendaCarrito = Handler(handlerFunc: (context, params) {
  //   final authProvider = Provider.of<AuthProvider>(context!);

  //   if (authProvider.authStatus == AuthStatus.tienda)
  //     return CarritoView();
  //   else
  //     return TiendaView();
  // });
}
