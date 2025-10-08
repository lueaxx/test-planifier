import '/flutter_flow/flutter_flow_util.dart';
import 'popup_agregar_owner_widget.dart' show PopupAgregarOwnerWidget;
import 'package:flutter/material.dart';

class PopupAgregarOwnerModel extends FlutterFlowModel<PopupAgregarOwnerWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailsotrosowners widget.
  FocusNode? emailsotrosownersFocusNode;
  TextEditingController? emailsotrosownersTextController;
  String? Function(BuildContext, String?)?
      emailsotrosownersTextControllerValidator;
  String? _emailsotrosownersTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor agrega un email';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'El mail es obligatorio';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    emailsotrosownersTextControllerValidator =
        _emailsotrosownersTextControllerValidator;
  }

  @override
  void dispose() {
    emailsotrosownersFocusNode?.dispose();
    emailsotrosownersTextController?.dispose();
  }
}
