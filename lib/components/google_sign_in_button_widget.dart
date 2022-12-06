import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleSignInButtonWidget extends StatefulWidget {
  const GoogleSignInButtonWidget({Key? key}) : super(key: key);

  @override
  _GoogleSignInButtonWidgetState createState() =>
      _GoogleSignInButtonWidgetState();
}

class _GoogleSignInButtonWidgetState extends State<GoogleSignInButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Container(
        width: 230,
        height: 44,
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: 'Sign in with Google',
                icon: Icon(
                  Icons.add,
                  color: Colors.transparent,
                  size: 20,
                ),
                options: FFButtonOptions(
                  width: 230,
                  height: 44,
                  color: Colors.white,
                  textStyle: GoogleFonts.getFont(
                    'Roboto',
                    color: Color(0xFF606060),
                    fontSize: 17,
                  ),
                  elevation: 4,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-0.83, 0),
              child: Container(
                width: 22,
                height: 22,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  'https://i0.wp.com/nanophorm.com/wp-content/uploads/2018/04/google-logo-icon-PNG-Transparent-Background.png?w=1000&ssl=1',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
