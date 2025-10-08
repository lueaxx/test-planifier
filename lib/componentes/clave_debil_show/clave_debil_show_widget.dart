import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'clave_debil_show_model.dart';
export 'clave_debil_show_model.dart';

class ClaveDebilShowWidget extends StatefulWidget {
  const ClaveDebilShowWidget({super.key});

  @override
  State<ClaveDebilShowWidget> createState() => _ClaveDebilShowWidgetState();
}

class _ClaveDebilShowWidgetState extends State<ClaveDebilShowWidget> {
  late ClaveDebilShowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClaveDebilShowModel());

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
          'La contraseña es demasiado débil (mínimo 6 caracteres).\n',
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
