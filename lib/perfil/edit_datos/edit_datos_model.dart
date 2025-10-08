import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'edit_datos_widget.dart' show EditDatosWidget;
import 'package:flutter/material.dart';

class EditDatosModel extends FlutterFlowModel<EditDatosWidget> {
  ///  Local state fields for this page.

  bool isEditing = false;

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for editempre1 widget.
  FocusNode? editempre1FocusNode;
  TextEditingController? editempre1TextController;
  String? Function(BuildContext, String?)? editempre1TextControllerValidator;
  String? _editempre1TextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El apellido es requerido';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 30) {
      return 'Maximum 30 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^[a-zA-ZáéíóúÁÉÍÓÚñÑ ]+\$').hasMatch(val)) {
      return 'Ingrese un nombre valido';
    }
    return null;
  }

  // State field(s) for edittelefono1 widget.
  FocusNode? edittelefono1FocusNode;
  TextEditingController? edittelefono1TextController;
  String? Function(BuildContext, String?)? edittelefono1TextControllerValidator;
  String? _edittelefono1TextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El número de teléfono es requerido';
    }

    if (val.length < 8) {
      return 'Por favor ingrese un numero valido';
    }
    if (val.length > 15) {
      return 'Por favor ingrese un numero valido';
    }
    if (!RegExp('^[0-9 ]+\$').hasMatch(val)) {
      return 'Ingrese un telefono valido';
    }
    return null;
  }

  // State field(s) for editmail1 widget.
  FocusNode? editmail1FocusNode;
  TextEditingController? editmail1TextController;
  String? Function(BuildContext, String?)? editmail1TextControllerValidator;
  String? _editmail1TextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El correo electrónico es requerido';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 35) {
      return 'Maximum 35 characters allowed, currently ${val.length}.';
    }
    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Por favor ingrese un email valido';
    }
    return null;
  }

  // State field(s) for editnombre2 widget.
  FocusNode? editnombre2FocusNode;
  TextEditingController? editnombre2TextController;
  String? Function(BuildContext, String?)? editnombre2TextControllerValidator;
  String? _editnombre2TextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El nombre es requerido';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    if (!RegExp('^[a-zA-ZáéíóúÁÉÍÓÚñÑ ]+\$').hasMatch(val)) {
      return 'Ingrese un nombre valido';
    }
    return null;
  }

  // State field(s) for editapellido2 widget.
  FocusNode? editapellido2FocusNode;
  TextEditingController? editapellido2TextController;
  String? Function(BuildContext, String?)? editapellido2TextControllerValidator;
  String? _editapellido2TextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El apellido es requerido';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    if (!RegExp('^[a-zA-ZáéíóúÁÉÍÓÚñÑ ]+\$').hasMatch(val)) {
      return 'Ingrese un apellido valido';
    }
    return null;
  }

  // State field(s) for edittelefono2 widget.
  FocusNode? edittelefono2FocusNode;
  TextEditingController? edittelefono2TextController;
  String? Function(BuildContext, String?)? edittelefono2TextControllerValidator;
  String? _edittelefono2TextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Número de teléfono is required';
    }

    if (val.length < 8) {
      return 'Ingrese un telefono valido';
    }
    if (val.length > 15) {
      return 'Ingrese un telefono valido';
    }
    if (!RegExp('^[0-9 ]+\$').hasMatch(val)) {
      return 'Ingrese un telefono valido';
    }
    return null;
  }

  // State field(s) for editmail2 widget.
  FocusNode? editmail2FocusNode;
  TextEditingController? editmail2TextController;
  String? Function(BuildContext, String?)? editmail2TextControllerValidator;
  String? _editmail2TextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Correo electrónico is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 35) {
      return 'Maximum 35 characters allowed, currently ${val.length}.';
    }
    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    editempre1TextControllerValidator = _editempre1TextControllerValidator;
    edittelefono1TextControllerValidator =
        _edittelefono1TextControllerValidator;
    editmail1TextControllerValidator = _editmail1TextControllerValidator;
    editnombre2TextControllerValidator = _editnombre2TextControllerValidator;
    editapellido2TextControllerValidator =
        _editapellido2TextControllerValidator;
    edittelefono2TextControllerValidator =
        _edittelefono2TextControllerValidator;
    editmail2TextControllerValidator = _editmail2TextControllerValidator;
  }

  @override
  void dispose() {
    editempre1FocusNode?.dispose();
    editempre1TextController?.dispose();

    edittelefono1FocusNode?.dispose();
    edittelefono1TextController?.dispose();

    editmail1FocusNode?.dispose();
    editmail1TextController?.dispose();

    editnombre2FocusNode?.dispose();
    editnombre2TextController?.dispose();

    editapellido2FocusNode?.dispose();
    editapellido2TextController?.dispose();

    edittelefono2FocusNode?.dispose();
    edittelefono2TextController?.dispose();

    editmail2FocusNode?.dispose();
    editmail2TextController?.dispose();
  }
}
