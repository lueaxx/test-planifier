import '/componentes/navbarapp/navbarapp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'mis_gastoss_widget.dart' show MisGastossWidget;
import 'package:flutter/material.dart';

class MisGastossModel extends FlutterFlowModel<MisGastossWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> homeEventRefs = [];
  void addToHomeEventRefs(DocumentReference item) => homeEventRefs.add(item);
  void removeFromHomeEventRefs(DocumentReference item) =>
      homeEventRefs.remove(item);
  void removeAtIndexFromHomeEventRefs(int index) =>
      homeEventRefs.removeAt(index);
  void insertAtIndexInHomeEventRefs(int index, DocumentReference item) =>
      homeEventRefs.insert(index, item);
  void updateHomeEventRefsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      homeEventRefs[index] = updateFn(homeEventRefs[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getHomeEvents] action in misGastoss widget.
  List<DocumentReference>? eventosDelUsuario;
  // Model for navbarapp component.
  late NavbarappModel navbarappModel;

  @override
  void initState(BuildContext context) {
    navbarappModel = createModel(context, () => NavbarappModel());
  }

  @override
  void dispose() {
    navbarappModel.dispose();
  }
}
