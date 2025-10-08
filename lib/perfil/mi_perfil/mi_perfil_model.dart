import '/componentes/navbarapp/navbarapp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'mi_perfil_widget.dart' show MiPerfilWidget;
import 'package:flutter/material.dart';

class MiPerfilModel extends FlutterFlowModel<MiPerfilWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for navbarapp component.
  late NavbarappModel navbarappModel;

  @override
  void initState(BuildContext context) {
    navbarappModel = createModel(context, () => NavbarappModel());
  }

  @override
  void dispose() {
    navbarappModel.dispose();
  }
}
