import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'clavefailshow_model.dart';
export 'clavefailshow_model.dart';

class ClavefailshowWidget extends StatefulWidget {
  const ClavefailshowWidget({super.key});

  @override
  State<ClavefailshowWidget> createState() => _ClavefailshowWidgetState();
}

class _ClavefailshowWidgetState extends State<ClavefailshowWidget> {
  late ClavefailshowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClavefailshowModel());

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
          'El enlace es inválido, ya fue usado o ha expirado.\n',
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
