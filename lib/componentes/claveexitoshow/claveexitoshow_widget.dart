import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'claveexitoshow_model.dart';
export 'claveexitoshow_model.dart';

class ClaveexitoshowWidget extends StatefulWidget {
  const ClaveexitoshowWidget({super.key});

  @override
  State<ClaveexitoshowWidget> createState() => _ClaveexitoshowWidgetState();
}

class _ClaveexitoshowWidgetState extends State<ClaveexitoshowWidget> {
  late ClaveexitoshowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClaveexitoshowModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          '¡Listo! \nTu contraseña ha sido actualizada. Volvé para iniciar sesión.\n\n',
          textAlign: TextAlign.center,
          style: GoogleFonts.publicSans(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 17.0,
          ),
        ),
      ),
    );
  }
}
