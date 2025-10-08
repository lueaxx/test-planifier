import '/componentes/evento_encontrado/evento_encontrado_widget.dart';
import '/componentes/navbarapp/navbarapp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
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

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getHomeEvents] action in home widget.
  List<DocumentReference>? eventosDelUsuario;
  // Model for eventoEncontrado component.
  late EventoEncontradoModel eventoEncontradoModel1;
  // Model for eventoEncontrado component.
  late EventoEncontradoModel eventoEncontradoModel2;
  // Model for navbarapp component.
  late NavbarappModel navbarappModel;

  @override
  void initState(BuildContext context) {
    eventoEncontradoModel1 =
        createModel(context, () => EventoEncontradoModel());
    eventoEncontradoModel2 =
        createModel(context, () => EventoEncontradoModel());
    navbarappModel = createModel(context, () => NavbarappModel());
  }

  @override
  void dispose() {
    eventoEncontradoModel1.dispose();
    eventoEncontradoModel2.dispose();
    navbarappModel.dispose();
  }
}
