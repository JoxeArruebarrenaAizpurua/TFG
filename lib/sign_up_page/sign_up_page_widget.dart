import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPageWidget extends StatefulWidget {
  SignUpPageWidget({Key key}) : super(key: key);

  @override
  _SignUpPageWidgetState createState() => _SignUpPageWidgetState();
}

class _SignUpPageWidgetState extends State<SignUpPageWidget> {
  TextEditingController emailTextController;
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  TextEditingController textController4;
  TextEditingController textController5;
  TextEditingController passwordTextController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
    textController5 = TextEditingController();
    passwordTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DatosUsuarioRecord>>(
      stream: queryDatosUsuarioRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        List<DatosUsuarioRecord> signUpPageDatosUsuarioRecordList =
            snapshot.data;
        // Customize what your widget looks like with no query results.
        if (snapshot.data.isEmpty) {
          // return Container();
          // For now, we'll just include some dummy data.
          signUpPageDatosUsuarioRecordList =
              createDummyDatosUsuarioRecord(count: 1);
        }
        final signUpPageDatosUsuarioRecord =
            signUpPageDatosUsuarioRecordList.first;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xDC2C5EB8),
          body: SafeArea(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment(0, -0.85),
                  child: Container(
                    width: 350,
                    height: 50,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(0, 0),
                          child: TextFormField(
                            controller: textController1,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Nombre',
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF050000),
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF050000),
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              filled: true,
                              fillColor: Color(0xFF254D9A),
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.6),
                  child: Container(
                    width: 350,
                    height: 50,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(0, 0),
                          child: TextFormField(
                            controller: textController2,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Apellidos',
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF050000),
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF050000),
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              filled: true,
                              fillColor: Color(0xFF254D9A),
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.35),
                  child: Container(
                    width: 350,
                    height: 50,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(0, 0),
                          child: TextFormField(
                            controller: emailTextController,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF050000),
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF050000),
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              filled: true,
                              fillColor: Color(0xFF254D9A),
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.1),
                  child: Container(
                    width: 350,
                    height: 50,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(0, 0),
                          child: TextFormField(
                            controller: textController3,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'DNI',
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF050000),
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF050000),
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              filled: true,
                              fillColor: Color(0xFF254D9A),
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0.15),
                  child: Container(
                    width: 350,
                    height: 50,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(0, 0),
                          child: TextFormField(
                            controller: textController4,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Entidad Bancaria',
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF050000),
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF050000),
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              filled: true,
                              fillColor: Color(0xFF254D9A),
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0.4),
                  child: Container(
                    width: 350,
                    height: 50,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(0, 0),
                          child: TextFormField(
                            controller: textController5,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Usuario',
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF050000),
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF050000),
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              filled: true,
                              fillColor: Color(0xFF254D9A),
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0, 0.65),
                  child: Container(
                    width: 350,
                    height: 50,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(0, 0),
                          child: TextFormField(
                            controller: passwordTextController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Contraseña',
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF050000),
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF050000),
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              filled: true,
                              fillColor: Color(0xFF254D9A),
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.05, 0.9),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final user = await createAccountWithEmail(
                          context,
                          emailTextController.text,
                          passwordTextController.text,
                        );
                        if (user == null) {
                          return;
                        }

                        final nombre = textController1.text;
                        final apellido = textController2.text;
                        final dni = textController3.text;
                        final uid = textController5.text;

                        final datosUsuarioRecordData = {
                          ...createDatosUsuarioRecordData(
                            nombre: nombre,
                            apellido: apellido,
                            dni: dni,
                            uid: uid,
                          ),
                          'EntidadBancaria':
                              FieldValue.arrayUnion([textController4.text]),
                        };

                        await DatosUsuarioRecord.collection
                            .doc(user.uid)
                            .update(datosUsuarioRecordData);

                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePageWidget(),
                          ),
                          (r) => false,
                        );
                      },
                      text: 'Registrarse',
                      options: FFButtonOptions(
                        width: 125,
                        height: 40,
                        color: Color(0x00FFFFFF),
                        textStyle: GoogleFonts.getFont(
                          'Lato',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontStyle: FontStyle.normal,
                        ),
                        borderSide: BorderSide(
                          color: Color(0xFF050000),
                          width: 2,
                        ),
                        borderRadius: 0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
