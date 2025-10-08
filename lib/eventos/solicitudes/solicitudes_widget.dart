import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'solicitudes_model.dart';
export 'solicitudes_model.dart';

class SolicitudesWidget extends StatefulWidget {
  const SolicitudesWidget({
    super.key,
    required this.eventRef,
  });

  final DocumentReference? eventRef;

  static String routeName = 'solicitudes';
  static String routePath = '/solicitudes';

  @override
  State<SolicitudesWidget> createState() => _SolicitudesWidgetState();
}

class _SolicitudesWidgetState extends State<SolicitudesWidget> {
  static const List<String> _roleOptions = [
    'Viewer',
    'Colaborador',
    'Editor',
    'Owner',
  ];

  late SolicitudesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SolicitudesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Future<void> _rejectRequest(ParticipantesRecord request) async {
    try {
      await request.reference.delete();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Solicitud rechazada',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.publicSans(),
                  color: Colors.white,
                  letterSpacing: 0.0,
                ),
          ),
          backgroundColor: const Color(0xFFDE3C4B),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'No se pudo rechazar la solicitud',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.publicSans(),
                  color: Colors.white,
                  letterSpacing: 0.0,
                ),
          ),
          backgroundColor: const Color(0xFFB3261E),
        ),
      );
    }
  }

  Future<void> _approveRequest(ParticipantesRecord request) async {
    final participantName = request.displayName.isNotEmpty
        ? request.displayName
        : (request.email.isNotEmpty ? request.email : 'Participante');

    final selectedRole = await _showRoleDialog(participantName);
    if (selectedRole == null) {
      return;
    }

    try {
      await request.reference.update({
        ...createParticipantesRecordData(
          status: 'activo',
          role: selectedRole,
        ),
        'added_at': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Rol "$selectedRole" asignado correctamente',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.publicSans(),
                  color: Colors.white,
                  letterSpacing: 0.0,
                ),
          ),
          backgroundColor: const Color(0xFF1EB980),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'No se pudo aprobar la solicitud',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.publicSans(),
                  color: Colors.white,
                  letterSpacing: 0.0,
                ),
          ),
          backgroundColor: const Color(0xFFB3261E),
        ),
      );
    }
  }

  Future<String?> _showRoleDialog(String participantName) async {
    return showDialog<String>(
      context: context,
      builder: (dialogContext) {
        String currentRole = _roleOptions.first;
        return Dialog(
          elevation: 0,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          child: StatefulBuilder(
            builder: (context, setState) {
              return Container(
                width: 320.0,
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF2F2F2F),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(1.0, -1.0),
                      child: InkWell(
                        onTap: () => Navigator.pop(dialogContext),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ),
                    ),
                    Text(
                      participantName,
                      style: GoogleFonts.publicSans(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      'Asignar rol:',
                      style: GoogleFonts.publicSans(
                        color: const Color(0xFFD9D9D9),
                        fontSize: 14.0,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Container(
                      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: DropdownButton<String>(
                        value: currentRole,
                        isExpanded: true,
                        underline: const SizedBox(),
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Color(0xFF3E454A),
                        ),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() => currentRole = value);
                          }
                        },
                        items: _roleOptions
                            .map(
                              (role) => DropdownMenuItem<String>(
                                value: role,
                                child: Text(
                                  role,
                                  style: GoogleFonts.publicSans(
                                    color: const Color(0xFF282828),
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    FFButtonWidget(
                      onPressed: () => Navigator.pop(dialogContext, currentRole),
                      text: 'Aceptar',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 44.0,
                        color: const Color(0xFFFF9240),
                        textStyle: GoogleFonts.publicSans(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  String _initialsForParticipant(ParticipantesRecord request) {
    final name = request.displayName;
    if (name.isNotEmpty) {
      final parts = name.trim().split(RegExp(r'\s+'));
      final first = parts.isNotEmpty && parts.first.isNotEmpty
          ? parts.first.substring(0, 1)
          : '';
      final second = parts.length > 1 && parts.last.isNotEmpty
          ? parts.last.substring(0, 1)
          : '';
      final initials = (first + second).toUpperCase();
      if (initials.isNotEmpty) {
        return initials;
      }
    }
    final email = request.email;
    if (email.isNotEmpty) {
      return email.substring(0, email.length >= 2 ? 2 : 1).toUpperCase();
    }
    return '?';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFF04006D),
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 40.0, 24.0, 40.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: const AlignmentDirectional(-1.0, -1.0),
              child: SizedBox(
                width: double.infinity,
                height: 59.1,
                child: Align(
                  alignment: const AlignmentDirectional(-1.0, -1.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.safePop();
                    },
                    text: 'Volver',
                    options: FFButtonOptions(
                      width: 137.0,
                      height: 35.0,
                      color: const Color(0x00FFFFFF),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.publicSans(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight:
                                    FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                fontStyle:
                                    FlutterFlowTheme.of(context).titleSmall.fontStyle,
                              ),
                      elevation: 0.0,
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(200.0),
                        bottomRight: Radius.circular(200.0),
                        topLeft: Radius.circular(200.0),
                        topRight: Radius.circular(200.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-1.0, -1.0),
              child: Text(
                'Solicitudes',
                textAlign: TextAlign.center,
                style: GoogleFonts.publicSans(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0,
                ),
              ),
            ),
            const Divider(
              thickness: 2.0,
              endIndent: 260.0,
              color: Colors.white,
            ),
            const SizedBox(height: 24.0),
            Text(
              'Listado:',
              style: GoogleFonts.publicSans(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: widget.eventRef == null
                  ? Center(
                      child: Text(
                        'No se encontró el evento.',
                        style: GoogleFonts.publicSans(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    )
                  : StreamBuilder<List<ParticipantesRecord>>(
                      stream: queryParticipantesRecord(
                        parent: widget.eventRef,
                        queryBuilder: (participantesRecord) =>
                            participantesRecord.where(
                          'status',
                          isEqualTo: 'pending',
                        ),
                      ),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        final pendingRequests = snapshot.data!;
                        if (pendingRequests.isEmpty) {
                          return Center(
                            child: Container(
                              width: 208.1,
                              height: 40.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200.0),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                '¡Estás al día!',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 22.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          );
                        }
                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          itemCount: pendingRequests.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 12.0),
                          itemBuilder: (context, index) {
                            final request = pendingRequests[index];
                            final displayName = request.displayName.isNotEmpty
                                ? request.displayName
                                : (request.email.isNotEmpty
                                    ? request.email
                                    : 'Participante');
                            final email = request.email;
                            return Container(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 12.0, 12.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16.0),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x14000000),
                                    blurRadius: 8.0,
                                    offset: Offset(0.0, 4.0),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 44.0,
                                    height: 44.0,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFE8ECFF),
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      _initialsForParticipant(request),
                                      style: GoogleFonts.publicSans(
                                        color: const Color(0xFF04006D),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16.0),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          displayName,
                                          style: GoogleFonts.publicSans(
                                            color: const Color(0xFF282828),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        if (email.isNotEmpty)
                                          Text(
                                            email,
                                            style: GoogleFonts.publicSans(
                                              color: const Color(0xFF6C6C6C),
                                              fontSize: 13.0,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                      ],
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 44.0,
                                    icon: const Icon(
                                      Icons.close,
                                      color: Color(0xFFDE3C4B),
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      await _rejectRequest(request);
                                    },
                                  ),
                                  const SizedBox(width: 8.0),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 44.0,
                                    icon: const Icon(
                                      Icons.check,
                                      color: Color(0xFF1EB980),
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      await _approveRequest(request);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
