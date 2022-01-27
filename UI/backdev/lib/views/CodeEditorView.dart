import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
// Import the language & theme
import 'package:highlight/languages/sql.dart';
import 'package:flutter_highlight/themes/arduino-light.dart' as onedark;

class CodeEditorView extends StatefulWidget {
  @override
  _CodeEditorState createState() => _CodeEditorState();
}

class _CodeEditorState extends State<CodeEditorView> {
  CodeController? _codeController;

  @override
  void initState() {
    super.initState();
    final source = """
    SELECT 
    BALCAO.DESCRICAO,
             BALCAO.ID_BALCAO,
             BALCAO.NM_BALCAO,
 (SELECT COUNT(FUNCIONARIO.ID_FUNCIONARIO)
              FROM   FUNCIONARIO FUNCIONARIO
              WHERE  FUNCIONARIO.COD_BALCAO = BALCAO.ID_BALCAO
                     AND FUNCIONARIO.FL_EXCLU = 0) AS TOTAL_FUNCIONARIOS
      FROM   BALCAO BALCAO
      WHERE  BALCAO.FL_EXCLU = '' AND
             [DBO].BALCAO LIKE '%'+ @NM_BALCAO+'%'
             OR BALCAO LIKE '%'+ @DESCRICAO+'%'
    """;
    // Instantiate the CodeController
    _codeController = CodeController(
      text: source,
      language: sql,
      theme: onedark.arduinoLightTheme,
    );
  }

  @override
  void dispose() {
    _codeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: CodeField(
          controller: _codeController!,
          textStyle: TextStyle(fontFamily: 'SourceCode', fontSize: 13),
        ),
      ),
    );
  }
}
