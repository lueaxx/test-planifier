import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'crear_cuenta_widget.dart' show CrearCuentaWidget;
import 'package:flutter/material.dart';

class CrearCuentaModel extends FlutterFlowModel<CrearCuentaWidget> {
  ///  Local state fields for this page.

  String tipoCuenta = 'Empresarial';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nombre_emp_create widget.
  FocusNode? nombreEmpCreateFocusNode;
  TextEditingController? nombreEmpCreateTextController;
  String? Function(BuildContext, String?)?
      nombreEmpCreateTextControllerValidator;
  String? _nombreEmpCreateTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El nombre de la empresa es obligatorio.';
    }

    if (val.length < 2) {
      return 'El nombre de la empresa es obligatorio.';
    }
    if (val.length > 25) {
      return 'Máximo 25 caracteres.';
    }
    if (!RegExp('^[A-Za-zÀ-ÿ\\s]{2,}\$').hasMatch(val)) {
      return 'Ingrese valores validos.';
    }
    return null;
  }

  // State field(s) for nombre_personal_create widget.
  FocusNode? nombrePersonalCreateFocusNode;
  TextEditingController? nombrePersonalCreateTextController;
  String? Function(BuildContext, String?)?
      nombrePersonalCreateTextControllerValidator;
  String? _nombrePersonalCreateTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El nombre es obligatorio.';
    }

    if (val.length < 2) {
      return 'Mínimo 2 caracteres, solo letras y espacios.';
    }
    if (val.length > 25) {
      return 'Máximo 25 caracteres.';
    }
    if (!RegExp('^[A-Za-zÀ-ÿ\\s]{2,}\$').hasMatch(val)) {
      return 'Ingrese valores validos.';
    }
    return null;
  }

  // State field(s) for apellido_personal_create widget.
  FocusNode? apellidoPersonalCreateFocusNode;
  TextEditingController? apellidoPersonalCreateTextController;
  String? Function(BuildContext, String?)?
      apellidoPersonalCreateTextControllerValidator;
  String? _apellidoPersonalCreateTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El apellido es obligatorio';
    }

    if (val.length < 2) {
      return 'Mínimo 2 caracteres, solo letras y espacios';
    }
    if (val.length > 25) {
      return 'Máximo 25 caracteres';
    }
    if (!RegExp('^[A-Za-zÀ-ÿ\\s]{2,}\$').hasMatch(val)) {
      return 'Ingrese valores validos.';
    }
    return null;
  }

  // State field(s) for emailAddress_create widget.
  FocusNode? emailAddressCreateFocusNode;
  TextEditingController? emailAddressCreateTextController;
  String? Function(BuildContext, String?)?
      emailAddressCreateTextControllerValidator;
  String? _emailAddressCreateTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El correo electrónico es obligatorio';
    }

    if (val.length < 3) {
      return 'ingrese un email válido';
    }
    if (val.length > 35) {
      return 'El correo es demasiado largo, use otro.';
    }
    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Ingrese un email válido.';
    }
    return null;
  }

  // State field(s) for numTelefono_create widget.
  FocusNode? numTelefonoCreateFocusNode;
  TextEditingController? numTelefonoCreateTextController;
  String? Function(BuildContext, String?)?
      numTelefonoCreateTextControllerValidator;
  // State field(s) for password_create widget.
  FocusNode? passwordCreateFocusNode;
  TextEditingController? passwordCreateTextController;
  late bool passwordCreateVisibility;
  String? Function(BuildContext, String?)?
      passwordCreateTextControllerValidator;
  String? _passwordCreateTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La contraseña es requerida';
    }

    if (val.length < 8) {
      return 'El minimo de caracteres es 8.';
    }
    if (val.length > 30) {
      return 'El maximo de caracteres es 30.';
    }
    if (!RegExp('^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,}\$').hasMatch(val)) {
      return 'Mínimo 8 caracteres, 1 mayúscula, letras y números';
    }
    return null;
  }

  // Stores action output result for [Validate Form] action in Crear_emp widget.
  bool? form;
  // Stores action output result for [Validate Form] action in Crear_emp widget.
  bool? form2;
  // Stores action output result for [Custom Action - crearUsuarioPersona] action in Crear_emp widget.
  bool? checkLogin;

  @override
  void initState(BuildContext context) {
    nombreEmpCreateTextControllerValidator =
        _nombreEmpCreateTextControllerValidator;
    nombrePersonalCreateTextControllerValidator =
        _nombrePersonalCreateTextControllerValidator;
    apellidoPersonalCreateTextControllerValidator =
        _apellidoPersonalCreateTextControllerValidator;
    emailAddressCreateTextControllerValidator =
        _emailAddressCreateTextControllerValidator;
    passwordCreateVisibility = false;
    passwordCreateTextControllerValidator =
        _passwordCreateTextControllerValidator;
  }

  @override
  void dispose() {
    nombreEmpCreateFocusNode?.dispose();
    nombreEmpCreateTextController?.dispose();

    nombrePersonalCreateFocusNode?.dispose();
    nombrePersonalCreateTextController?.dispose();

    apellidoPersonalCreateFocusNode?.dispose();
    apellidoPersonalCreateTextController?.dispose();

    emailAddressCreateFocusNode?.dispose();
    emailAddressCreateTextController?.dispose();

    numTelefonoCreateFocusNode?.dispose();
    numTelefonoCreateTextController?.dispose();

    passwordCreateFocusNode?.dispose();
    passwordCreateTextController?.dispose();
  }
}
