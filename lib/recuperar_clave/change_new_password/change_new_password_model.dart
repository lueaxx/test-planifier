import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'change_new_password_widget.dart' show ChangeNewPasswordWidget;
import 'package:flutter/material.dart';

class ChangeNewPasswordModel extends FlutterFlowModel<ChangeNewPasswordWidget> {
  ///  Local state fields for this page.

  String? oobCode;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for updatePass widget.
  FocusNode? updatePassFocusNode;
  TextEditingController? updatePassTextController;
  late bool updatePassVisibility;
  String? Function(BuildContext, String?)? updatePassTextControllerValidator;
  // State field(s) for confirmPass widget.
  FocusNode? confirmPassFocusNode;
  TextEditingController? confirmPassTextController;
  late bool confirmPassVisibility;
  String? Function(BuildContext, String?)? confirmPassTextControllerValidator;
  // Stores action output result for [Custom Action - confirmarPasswordReset] action in Crear_emp widget.
  String? booleanpass;

  @override
  void initState(BuildContext context) {
    updatePassVisibility = false;
    confirmPassVisibility = false;
  }

  @override
  void dispose() {
    updatePassFocusNode?.dispose();
    updatePassTextController?.dispose();

    confirmPassFocusNode?.dispose();
    confirmPassTextController?.dispose();
  }
}
