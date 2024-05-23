import 'package:fluro/fluro.dart';

import '../services/view404Handlers.dart';
import 'adminHandlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';
  static String dashboardRoute = '/dashboard';
  static String usuarioRoute = '/dashboard/usuario';
  static String clientesRoute = '/dashboard/clientes';

  static String pedidosRoute = '/dashboard/pedidos';
  static String procedimientosRoute = '/dashboard/productos';
  static String recomendacionesRoute = '/dashboard/recomendaciones';
  static String forosRoute = '/dashboard/foros';
  static String centrosRoute = '/dashboard/centros';
  static String ubicacionesRoute = '/dashboard/ubicaciones';

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

    router.define(clientesRoute,
        handler: AdminHandlers.clientesRoute,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

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

    router.notFoundHandler = View404Handlers.view404;
  }
}
