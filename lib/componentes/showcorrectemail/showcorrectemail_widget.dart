import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'showcorrectemail_model.dart';
export 'showcorrectemail_model.dart';

class ShowcorrectemailWidget extends StatefulWidget {
  const ShowcorrectemailWidget({super.key});

  @override
  State<ShowcorrectemailWidget> createState() => _ShowcorrectemailWidgetState();
}

class _ShowcorrectemailWidgetState extends State<ShowcorrectemailWidget> {
  late ShowcorrectemailModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShowcorrectemailModel());

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
        padding: EdgeInsets.all(12.0),
        child: Text(
          'Correo enviado con exito !',
          textAlign: TextAlign.center,
          style: GoogleFonts.publicSans(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
