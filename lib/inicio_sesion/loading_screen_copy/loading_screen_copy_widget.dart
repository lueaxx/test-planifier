import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'loading_screen_copy_model.dart';
export 'loading_screen_copy_model.dart';

class LoadingScreenCopyWidget extends StatefulWidget {
  const LoadingScreenCopyWidget({super.key});

  static String routeName = 'loadingScreenCopy';
  static String routePath = '/loadingScreenCopy';

  @override
  State<LoadingScreenCopyWidget> createState() =>
      _LoadingScreenCopyWidgetState();
}

class _LoadingScreenCopyWidgetState extends State<LoadingScreenCopyWidget> {
  late LoadingScreenCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingScreenCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userDoc =
          await UsuarioRecord.getDocumentOnce(currentUserReference!);
      if ((_model.userDoc?.initialSyncComplete == false) ||
          (_model.userDoc?.initialSyncComplete == null)) {
        await actions.synchronizeInvitationsClientSide(
          _model.userDoc!.reference,
          currentUserEmail,
        );
        await actions.reloadUser();
      } else {
        await actions.reloadUser();
      }

      context.goNamed(LoginWidget.routeName);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF04006D),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Container(
                  width: 157.0,
                  height: 157.0,
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Lottie.asset(
                          'assets/jsons/white_spinner_arc_rotate.json',
                          width: 283.9,
                          height: 288.9,
                          fit: BoxFit.scaleDown,
                          frameRate: FrameRate(144.0),
                          animate: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
