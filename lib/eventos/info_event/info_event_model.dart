import '/componentes/notfoundd_owner/notfoundd_owner_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'info_event_widget.dart' show InfoEventWidget;
import 'package:flutter/material.dart';

class InfoEventModel extends FlutterFlowModel<InfoEventWidget> {
  ///  Local state fields for this page.

  bool isEditing = false;

  ///  State fields for stateful widgets in this page.

  // Model for notfounddOwner component.
  late NotfounddOwnerModel notfounddOwnerModel;

  @override
  void initState(BuildContext context) {
    notfounddOwnerModel = createModel(context, () => NotfounddOwnerModel());
  }

  @override
  void dispose() {
    notfounddOwnerModel.dispose();
  }
}
