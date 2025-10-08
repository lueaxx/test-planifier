import '/componentes/role/role_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'asignarl_rol_widget.dart' show AsignarlRolWidget;
import 'package:flutter/material.dart';

class AsignarlRolModel extends FlutterFlowModel<AsignarlRolWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for role component.
  late RoleModel roleModel;

  @override
  void initState(BuildContext context) {
    roleModel = createModel(context, () => RoleModel());
  }

  @override
  void dispose() {
    roleModel.dispose();
  }
}
