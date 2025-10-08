import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'edit_direcciones_widget.dart' show EditDireccionesWidget;
import 'package:flutter/material.dart';

class EditDireccionesModel extends FlutterFlowModel<EditDireccionesWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for alias widget.
  FocusNode? aliasFocusNode;
  TextEditingController? aliasTextController;
  String? Function(BuildContext, String?)? aliasTextControllerValidator;
  String? _aliasTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El alias es requerido';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for calle widget.
  FocusNode? calleFocusNode;
  TextEditingController? calleTextController;
  String? Function(BuildContext, String?)? calleTextControllerValidator;
  String? _calleTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La calle es requerida';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 30) {
      return 'Maximum 30 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^[A-Za-zÀ-ÿ\\s]+\$').hasMatch(val)) {
      return 'Ingrese una calle valida';
    }
    return null;
  }

  // State field(s) for altura widget.
  FocusNode? alturaFocusNode;
  TextEditingController? alturaTextController;
  String? Function(BuildContext, String?)? alturaTextControllerValidator;
  String? _alturaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La altura es requeria';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 10) {
      return 'Maximum 10 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^\\d{1,10}\$').hasMatch(val)) {
      return 'ingrese una altura valida';
    }
    return null;
  }

  // State field(s) for piso widget.
  FocusNode? pisoFocusNode;
  TextEditingController? pisoTextController;
  String? Function(BuildContext, String?)? pisoTextControllerValidator;
  // State field(s) for dpto widget.
  FocusNode? dptoFocusNode;
  TextEditingController? dptoTextController;
  String? Function(BuildContext, String?)? dptoTextControllerValidator;
  // State field(s) for codigopostal widget.
  FocusNode? codigopostalFocusNode;
  TextEditingController? codigopostalTextController;
  String? Function(BuildContext, String?)? codigopostalTextControllerValidator;
  String? _codigopostalTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El código postal es requerido';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 10) {
      return 'Maximum 10 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^\\d{1,10}\$').hasMatch(val)) {
      return 'Ingrese un codigo postal valido';
    }
    return null;
  }

  // State field(s) for localidad widget.
  FocusNode? localidadFocusNode;
  TextEditingController? localidadTextController;
  String? Function(BuildContext, String?)? localidadTextControllerValidator;
  String? _localidadTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La localidad es requerida';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^[A-Za-zÀ-ÿ\\s]+\$').hasMatch(val)) {
      return 'Ingrese una localidad valida';
    }
    return null;
  }

  // State field(s) for provincia widget.
  FocusNode? provinciaFocusNode;
  TextEditingController? provinciaTextController;
  String? Function(BuildContext, String?)? provinciaTextControllerValidator;
  String? _provinciaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La provincia es requerida';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^[A-Za-zÀ-ÿ\\s]+\$').hasMatch(val)) {
      return 'Ingrese una provincia valida';
    }
    return null;
  }

  // State field(s) for entreCalles widget.
  FocusNode? entreCallesFocusNode;
  TextEditingController? entreCallesTextController;
  String? Function(BuildContext, String?)? entreCallesTextControllerValidator;

  @override
  void initState(BuildContext context) {
    aliasTextControllerValidator = _aliasTextControllerValidator;
    calleTextControllerValidator = _calleTextControllerValidator;
    alturaTextControllerValidator = _alturaTextControllerValidator;
    codigopostalTextControllerValidator = _codigopostalTextControllerValidator;
    localidadTextControllerValidator = _localidadTextControllerValidator;
    provinciaTextControllerValidator = _provinciaTextControllerValidator;
  }

  @override
  void dispose() {
    aliasFocusNode?.dispose();
    aliasTextController?.dispose();

    calleFocusNode?.dispose();
    calleTextController?.dispose();

    alturaFocusNode?.dispose();
    alturaTextController?.dispose();

    pisoFocusNode?.dispose();
    pisoTextController?.dispose();

    dptoFocusNode?.dispose();
    dptoTextController?.dispose();

    codigopostalFocusNode?.dispose();
    codigopostalTextController?.dispose();

    localidadFocusNode?.dispose();
    localidadTextController?.dispose();

    provinciaFocusNode?.dispose();
    provinciaTextController?.dispose();

    entreCallesFocusNode?.dispose();
    entreCallesTextController?.dispose();
  }
}
