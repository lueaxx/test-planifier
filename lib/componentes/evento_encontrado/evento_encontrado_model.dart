import '/flutter_flow/flutter_flow_util.dart';
import 'evento_encontrado_widget.dart' show EventoEncontradoWidget;
import 'package:flutter/material.dart';

class EventoEncontradoModel extends FlutterFlowModel<EventoEncontradoWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> eventoEncontradoRef = [];
  void addToEventoEncontradoRef(DocumentReference item) =>
      eventoEncontradoRef.add(item);
  void removeFromEventoEncontradoRef(DocumentReference item) =>
      eventoEncontradoRef.remove(item);
  void removeAtIndexFromEventoEncontradoRef(int index) =>
      eventoEncontradoRef.removeAt(index);
  void insertAtIndexInEventoEncontradoRef(int index, DocumentReference item) =>
      eventoEncontradoRef.insert(index, item);
  void updateEventoEncontradoRefAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      eventoEncontradoRef[index] = updateFn(eventoEncontradoRef[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
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
  }
}
