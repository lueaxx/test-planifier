import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'change_new_password_login_widget.dart'
    show ChangeNewPasswordLoginWidget;
import 'package:flutter/material.dart';

class ChangeNewPasswordLoginModel
    extends FlutterFlowModel<ChangeNewPasswordLoginWidget> {
  ///  Local state fields for this page.

  String? oobCode;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for actaulPass widget.
  FocusNode? actaulPassFocusNode;
  TextEditingController? actaulPassTextController;
  late bool actaulPassVisibility;
  String? Function(BuildContext, String?)? actaulPassTextControllerValidator;
  String? _actaulPassTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La contraseña actual es requerida';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for updatePass widget.
  FocusNode? updatePassFocusNode;
  TextEditingController? updatePassTextController;
  late bool updatePassVisibility;
  String? Function(BuildContext, String?)? updatePassTextControllerValidator;
  String? _updatePassTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La nueva contraseña es obligatoria';
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }

    return null;
  }

  // State field(s) for confirmPass widget.
  FocusNode? confirmPassFocusNode;
  TextEditingController? confirmPassTextController;
  late bool confirmPassVisibility;
  String? Function(BuildContext, String?)? confirmPassTextControllerValidator;
  String? _confirmPassTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La nueva contraseña es obligatoria';
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }

    return null;
  }

  // Stores action output result for [Custom Action - reauthenticateUser] action in Crear_emp widget.
  bool? reuser;

  @override
  void initState(BuildContext context) {
    actaulPassVisibility = false;
    actaulPassTextControllerValidator = _actaulPassTextControllerValidator;
    updatePassVisibility = false;
    updatePassTextControllerValidator = _updatePassTextControllerValidator;
    confirmPassVisibility = false;
    confirmPassTextControllerValidator = _confirmPassTextControllerValidator;
  }

  @override
  void dispose() {
    actaulPassFocusNode?.dispose();
    actaulPassTextController?.dispose();

    updatePassFocusNode?.dispose();
    updatePassTextController?.dispose();

    confirmPassFocusNode?.dispose();
    confirmPassTextController?.dispose();
  }
}
