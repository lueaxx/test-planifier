import '/flutter_flow/flutter_flow_util.dart';
import 'owner_row_widget.dart' show OwnerRowWidget;
import 'package:flutter/material.dart';

class OwnerRowModel extends FlutterFlowModel<OwnerRowWidget> {
  ///  Local state fields for this component.

  String email = 'initialEmail';

  ///  State fields for stateful widgets in this component.

  // State field(s) for contactoCorreo widget.
  FocusNode? contactoCorreoFocusNode;
  TextEditingController? contactoCorreoTextController;
  String? Function(BuildContext, String?)?
      contactoCorreoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    contactoCorreoFocusNode?.dispose();
    contactoCorreoTextController?.dispose();
  }
}
