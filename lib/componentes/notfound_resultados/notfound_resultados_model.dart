import '/flutter_flow/flutter_flow_util.dart';
import 'notfound_resultados_widget.dart' show NotfoundResultadosWidget;
import 'package:flutter/material.dart';

class NotfoundResultadosModel
    extends FlutterFlowModel<NotfoundResultadosWidget> {
  ///  Local state fields for this component.

  DocumentReference? eventoEncontradoRef;

  ///  State fields for stateful widgets in this component.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for n1 widget.
  FocusNode? n1FocusNode;
  TextEditingController? n1TextController;
  String? Function(BuildContext, String?)? n1TextControllerValidator;
  // State field(s) for n2 widget.
  FocusNode? n2FocusNode;
  TextEditingController? n2TextController;
  String? Function(BuildContext, String?)? n2TextControllerValidator;
  // State field(s) for n3 widget.
  FocusNode? n3FocusNode;
  TextEditingController? n3TextController;
  String? Function(BuildContext, String?)? n3TextControllerValidator;
  // State field(s) for n4 widget.
  FocusNode? n4FocusNode;
  TextEditingController? n4TextController;
  String? Function(BuildContext, String?)? n4TextControllerValidator;
  // State field(s) for n5 widget.
  FocusNode? n5FocusNode;
  TextEditingController? n5TextController;
  String? Function(BuildContext, String?)? n5TextControllerValidator;
  // State field(s) for n6 widget.
  FocusNode? n6FocusNode;
  TextEditingController? n6TextController;
  String? Function(BuildContext, String?)? n6TextControllerValidator;
  // Stores action output result for [Custom Action - findEventByAccessCode] action in Button widget.
  DocumentReference? foundEvent;
  // State field(s) for n11 widget.
  FocusNode? n11FocusNode;
  TextEditingController? n11TextController;
  String? Function(BuildContext, String?)? n11TextControllerValidator;
  // State field(s) for n22 widget.
  FocusNode? n22FocusNode;
  TextEditingController? n22TextController;
  String? Function(BuildContext, String?)? n22TextControllerValidator;
  // State field(s) for n33 widget.
  FocusNode? n33FocusNode;
  TextEditingController? n33TextController;
  String? Function(BuildContext, String?)? n33TextControllerValidator;
  // State field(s) for n44 widget.
  FocusNode? n44FocusNode;
  TextEditingController? n44TextController;
  String? Function(BuildContext, String?)? n44TextControllerValidator;
  // State field(s) for n55 widget.
  FocusNode? n55FocusNode;
  TextEditingController? n55TextController;
  String? Function(BuildContext, String?)? n55TextControllerValidator;
  // State field(s) for n66 widget.
  FocusNode? n66FocusNode;
  TextEditingController? n66TextController;
  String? Function(BuildContext, String?)? n66TextControllerValidator;
  // Stores action output result for [Custom Action - findEventByAccessCode] action in Button widget.
  DocumentReference? foundEventt;
  // Stores action output result for [Custom Action - requestToJoinEvent] action in Button widget.
  bool? validateButton;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    n1FocusNode?.dispose();
    n1TextController?.dispose();

    n2FocusNode?.dispose();
    n2TextController?.dispose();

    n3FocusNode?.dispose();
    n3TextController?.dispose();

    n4FocusNode?.dispose();
    n4TextController?.dispose();

    n5FocusNode?.dispose();
    n5TextController?.dispose();

    n6FocusNode?.dispose();
    n6TextController?.dispose();

    n11FocusNode?.dispose();
    n11TextController?.dispose();

    n22FocusNode?.dispose();
    n22TextController?.dispose();

    n33FocusNode?.dispose();
    n33TextController?.dispose();

    n44FocusNode?.dispose();
    n44TextController?.dispose();

    n55FocusNode?.dispose();
    n55TextController?.dispose();

    n66FocusNode?.dispose();
    n66TextController?.dispose();
  }
}
