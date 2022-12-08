import '../auth/auth_util.dart';
import '../components/google_sign_in_button_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 60),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
              ),
              Image.asset(
                'assets/images/Group_4_(2).png',
                width: 200,
                fit: BoxFit.fill,
              ),
              Align(
                alignment: AlignmentDirectional(-0.1, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(25, 15, 15, 15),
                  child: SelectionArea(
                      child: Text(
                    'faaiidooyinka app kan waxaa kamida ku ogaan kartaa report ka EVC Plus iyo Sahal ayaad arkaysaa adigoo ukaladooran kartid weekly,monthly and yearly \nwaxayna kuuxayiraysaa lacagaha aad khaladay wayna kusoo xasuusinaysaa.\n ',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).subtitle1.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).subtitle1Family,
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).subtitle1Family),
                        ),
                  )),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0.05),
                child: SelectionArea(
                    child: Text(
                  ' ',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyText1Family,
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyText1Family),
                        lineHeight: 2,
                      ),
                )),
              ),
              SelectionArea(
                  child: Text(
                ' ',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                      fontSize: 12,
                      fontWeight: FontWeight.w100,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyText1Family),
                      lineHeight: 5,
                    ),
              )),
              InkWell(
                onTap: () async {
                  final user = await signInWithGoogle(context);
                  if (user == null) {
                    return;
                  }
                  await Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NavBarPage(initialPage: 'dashboard'),
                    ),
                    (r) => false,
                  );
                },
                child: GoogleSignInButtonWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
