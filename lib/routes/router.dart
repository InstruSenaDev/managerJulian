import 'package:fluro/fluro.dart';

import '../services/view404Handlers.dart';
import 'adminHandlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';
  static String dashboardRoute = '/dashboard';
  static String usuarioRoute = '/dashboard/usuario';
  static String clientesRoute = '/dashboard/clientes';
  static String nuevoClienteRoute = '/dashboard/clientes/nuevoCliente';

  static String pedidosRoute = '/dashboard/pedidos';
  static String procedimientosRoute = '/dashboard/productos';
  static String recomendacionesRoute = '/dashboard/recomendaciones';
  static String forosRoute = '/dashboard/foros';
  static String centrosRoute = '/dashboard/centros';
  static String ubicacionesRoute = '/dashboard/ubicaciones';
  static String ciudadesRoute = '/dashboard/ciudades';

  static void configureRoutes() {
    // manejador rupas para las paginas
    router.define(rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);

    router.define(dashboardRoute,
        handler: AdminHandlers.dashboardMain,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    router.define(usuarioRoute,
        handler: AdminHandlers.usuarioRoute,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    // ************* Clientes **********************

    router.define(clientesRoute,
        handler: AdminHandlers.clientesRoute,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    router.define(nuevoClienteRoute,
        handler: AdminHandlers.nuevoClienteRoute,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    // ************* Fin Cliente *******************

    router.define(procedimientosRoute,
        handler: AdminHandlers.procedimientosRoute,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    router.define(recomendacionesRoute,
        handler: AdminHandlers.recomendacionesRoute,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    router.define(forosRoute,
        handler: AdminHandlers.forosRoute,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    router.define(centrosRoute,
        handler: AdminHandlers.centrosRoute,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    router.define(ubicacionesRoute,
        handler: AdminHandlers.ubicacionesRoute,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    router.define(ciudadesRoute,
        handler: AdminHandlers.ciudadesRoute,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    router.notFoundHandler = View404Handlers.view404;
  }
}
