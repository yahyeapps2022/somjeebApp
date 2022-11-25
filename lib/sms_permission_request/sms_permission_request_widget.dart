import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmsPermissionRequestWidget extends StatefulWidget {
  const SmsPermissionRequestWidget({Key? key}) : super(key: key);

  @override
  _SmsPermissionRequestWidgetState createState() =>
      _SmsPermissionRequestWidgetState();
}

class _SmsPermissionRequestWidgetState
    extends State<SmsPermissionRequestWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Page Title',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: FlutterFlowTheme.of(context).title2Family,
                color: Colors.white,
                fontSize: 22,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).title2Family),
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                child: Text(
                  'si ay report kuugu samayso uogolow app ka inay akhriso fariimaha lacagaha aad dirtay iyo kuwa laguusoodiray ',
                  style: FlutterFlowTheme.of(context).subtitle1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
