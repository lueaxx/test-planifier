import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'create_event_page_widget.dart' show CreateEventPageWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CreateEventPageModel extends FlutterFlowModel<CreateEventPageWidget> {
  ///  Local state fields for this page.

  String? eventTipe;

  String? nameEvent;

  DateTime? eventDate;

  String? horaInicio;

  String? horaFinal;

  String? nombreEncargado;

  String? contactoEncargado;

  DocumentReference? direccionSeleccionada;

  List<String> listaEmailsOwners = [];
  void addToListaEmailsOwners(String item) => listaEmailsOwners.add(item);
  void removeFromListaEmailsOwners(String item) =>
      listaEmailsOwners.remove(item);
  void removeAtIndexFromListaEmailsOwners(int index) =>
      listaEmailsOwners.removeAt(index);
  void insertAtIndexInListaEmailsOwners(int index, String item) =>
      listaEmailsOwners.insert(index, item);
  void updateListaEmailsOwnersAtIndex(int index, Function(String) updateFn) =>
      listaEmailsOwners[index] = updateFn(listaEmailsOwners[index]);

  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for tipoeventoDespl widget.
  String? tipoeventoDesplValue;
  FormFieldController<String>? tipoeventoDesplValueController;
  // State field(s) for nameevento widget.
  FocusNode? nameeventoFocusNode;
  TextEditingController? nameeventoTextController;
  String? Function(BuildContext, String?)? nameeventoTextControllerValidator;
  String? _nameeventoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El evento es obligatorio';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 30) {
      return 'Maximum 30 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^[A-Za-zÀ-ÿ\\s]+\$').hasMatch(val)) {
      return 'Ingrese una evento valida';
    }
    return null;
  }

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // State field(s) for inicioHS widget.
  String? inicioHSValue;
  FormFieldController<String>? inicioHSValueController;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? uncompleteForm;
  // State field(s) for nombreEncargado widget.
  FocusNode? nombreEncargadoFocusNode;
  TextEditingController? nombreEncargadoTextController;
  String? Function(BuildContext, String?)?
      nombreEncargadoTextControllerValidator;
  String? _nombreEncargadoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El nombre del encargado es obligatorio';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 25) {
      return 'Maximum 25 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for contactoEncargado widget.
  FocusNode? contactoEncargadoFocusNode;
  TextEditingController? contactoEncargadoTextController;
  String? Function(BuildContext, String?)?
      contactoEncargadoTextControllerValidator;
  String? _contactoEncargadoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La contacto  es obligatorio';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 30) {
      return 'Maximum 30 characters allowed, currently ${val.length}.';
    }

    return null;
  }
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, DireccionRecord>?
      listViewPagingController1;
  Query? listViewPagingQuery1;
  List<StreamSubscription?> listViewStreamSubscriptions1 = [];

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  EventosRecord? eventoCreadoRef;

  @override
  void initState(BuildContext context) {
    nameeventoTextControllerValidator = _nameeventoTextControllerValidator;
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    nombreEncargadoTextControllerValidator =
        _nombreEncargadoTextControllerValidator;
    contactoEncargadoTextControllerValidator =
        _contactoEncargadoTextControllerValidator;
  }

  @override
  void dispose() {
    nameeventoFocusNode?.dispose();
    nameeventoTextController?.dispose();

    nombreEncargadoFocusNode?.dispose();
    nombreEncargadoTextController?.dispose();

    contactoEncargadoFocusNode?.dispose();
    contactoEncargadoTextController?.dispose();

    listViewStreamSubscriptions1.forEach((s) => s?.cancel());
    listViewPagingController1?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, DireccionRecord> setListViewController1(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController1 ??= _createListViewController1(query, parent);
    if (listViewPagingQuery1 != query) {
      listViewPagingQuery1 = query;
      listViewPagingController1?.refresh();
    }
    return listViewPagingController1!;
  }

  PagingController<DocumentSnapshot?, DireccionRecord>
      _createListViewController1(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, DireccionRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryDireccionRecordPage(
          queryBuilder: (_) => listViewPagingQuery1 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions1,
          controller: controller,
          pageSize: 15,
          isStream: true,
        ),
      );
  }
}
