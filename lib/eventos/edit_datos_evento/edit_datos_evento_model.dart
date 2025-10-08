import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_datos_evento_widget.dart' show EditDatosEventoWidget;
import 'package:flutter/material.dart';

class EditDatosEventoModel extends FlutterFlowModel<EditDatosEventoWidget> {
  ///  Local state fields for this page.

  bool isEditing = false;

  DateTime? fechaProv;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for eventoName widget.
  FocusNode? eventoNameFocusNode;
  TextEditingController? eventoNameTextController;
  String? Function(BuildContext, String?)? eventoNameTextControllerValidator;
  String? _eventoNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El nombre del evento es requerido';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 30) {
      return 'Maximum 30 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for encargadoSalon widget.
  FocusNode? encargadoSalonFocusNode1;
  TextEditingController? encargadoSalonTextController1;
  String? Function(BuildContext, String?)?
      encargadoSalonTextController1Validator;
  String? _encargadoSalonTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El nombre del encargado es requerido';
    }

    return null;
  }

  // State field(s) for encargadoSalon widget.
  FocusNode? encargadoSalonFocusNode2;
  TextEditingController? encargadoSalonTextController2;
  String? Function(BuildContext, String?)?
      encargadoSalonTextController2Validator;
  String? _encargadoSalonTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El contacto es requerido';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    eventoNameTextControllerValidator = _eventoNameTextControllerValidator;
    encargadoSalonTextController1Validator =
        _encargadoSalonTextController1Validator;
    encargadoSalonTextController2Validator =
        _encargadoSalonTextController2Validator;
  }

  @override
  void dispose() {
    eventoNameFocusNode?.dispose();
    eventoNameTextController?.dispose();

    encargadoSalonFocusNode1?.dispose();
    encargadoSalonTextController1?.dispose();

    encargadoSalonFocusNode2?.dispose();
    encargadoSalonTextController2?.dispose();
  }
}
