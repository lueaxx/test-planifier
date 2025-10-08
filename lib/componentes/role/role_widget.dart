import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'role_model.dart';
export 'role_model.dart';

class RoleWidget extends StatefulWidget {
  const RoleWidget({
    super.key,
    this.parameter1,
    this.parameter2,
  });

  final String? parameter1;
  final DocumentReference? parameter2;

  @override
  State<RoleWidget> createState() => _RoleWidgetState();
}

class _RoleWidgetState extends State<RoleWidget> {
  late RoleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RoleModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowDropDown<String>(
      controller: _model.dropDownValueController ??=
          FormFieldController<String>(
        _model.dropDownValue ??= widget.parameter1,
      ),
      options: ['Owner', 'Editor', 'Colaborador', 'Viewer'],
      onChanged: (val) async {
        safeSetState(() => _model.dropDownValue = val);
        await widget.parameter2!.update(createParticipantesRecordData(
          role: _model.dropDownValue,
          status: 'activo',
        ));
      },
      width: 161.32,
      height: 38.0,
      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            font: GoogleFonts.publicSans(
              fontWeight: FontWeight.w500,
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
            ),
            color: Color(0xFF282828),
            letterSpacing: 0.0,
            fontWeight: FontWeight.w500,
            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
          ),
      hintText: 'Rol',
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: Color(0xFF3E454A),
        size: 24.0,
      ),
      fillColor: Colors.white,
      elevation: 2.0,
      borderColor: Colors.white,
      borderWidth: 2.0,
      borderRadius: 200.0,
      margin: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 12.0, 0.0),
      hidesUnderline: true,
      isOverButton: false,
      isSearchable: false,
      isMultiSelect: false,
    );
  }
}
