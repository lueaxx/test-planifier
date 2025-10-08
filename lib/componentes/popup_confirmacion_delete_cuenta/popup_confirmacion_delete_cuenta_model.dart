import '/flutter_flow/flutter_flow_util.dart';
import 'popup_confirmacion_delete_cuenta_widget.dart'
    show PopupConfirmacionDeleteCuentaWidget;
import 'package:flutter/material.dart';

class PopupConfirmacionDeleteCuentaModel
    extends FlutterFlowModel<PopupConfirmacionDeleteCuentaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for actaulPass widget.
  FocusNode? actaulPassFocusNode;
  TextEditingController? actaulPassTextController;
  late bool actaulPassVisibility;
  String? Function(BuildContext, String?)? actaulPassTextControllerValidator;
  // Stores action output result for [Custom Action - reauthenticateUser] action in Button widget.
  bool? actualPass;

  @override
  void initState(BuildContext context) {
    actaulPassVisibility = false;
  }

  @override
  void dispose() {
    actaulPassFocusNode?.dispose();
    actaulPassTextController?.dispose();
  }
}
