import 'package:backdev/controllers/LoginController.dart';
import 'package:backdev/views/components/lukInput.dart';
import 'package:backdev/views/editorView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:select_dialog/select_dialog.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(LoginController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
                child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "PRIMEIRO PASSO",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    "INICIAR CONEXÃO",
                    style: TextStyle(color: Colors.grey[600], fontSize: 40),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  lukInput(
                    onChange: (val) {
                      _controller.server.value = val;
                    },
                    hint: "Servanme",
                    icon: HeroIcon(HeroIcons.server),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: lukInput(
                          onChange: () {},
                          hint: "Username",
                          icon: HeroIcon(HeroIcons.userCircle),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: lukInput(
                          onChange: () {},
                          hint: "Password",
                          icon: HeroIcon(HeroIcons.lockClosed),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => Visibility(
                      visible: (_controller.databases.value.isNotEmpty),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Obx(
                          () => TextButton.icon(
                              style:
                                  ButtonStyle(alignment: Alignment.centerLeft),
                              onPressed: () {
                                SelectDialog.showModal<String>(
                                  context,
                                  constraints: BoxConstraints.expand(
                                      width: 400, height: 400),
                                  label: "Seleciona uma Base de dados",
                                  searchHint: "Pesquisar...",
                                  selectedValue: _controller.selectedDB.value,
                                  items: _controller.databases.value,
                                  itemBuilder: (ctx, item, active) {
                                    return Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                              child:
                                                  HeroIcon(HeroIcons.database)),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(item)
                                        ],
                                      ),
                                    );
                                  },
                                  onChange: (String selected) {
                                    _controller.selectedDB.value = selected;
                                  },
                                );
                              },
                              icon: HeroIcon(
                                HeroIcons.database,
                                color: Colors.grey[600],
                              ),
                              label: Text(
                                (_controller.selectedDB.value.isNotEmpty)
                                    ? _controller.selectedDB.value
                                    : "Selecionar Base de dados",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                ),
                              )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: TextButton.icon(
                            onPressed: () {
                              _controller.connect();
                            },
                            icon: HeroIcon(
                              HeroIcons.link,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Conectar",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Obx(
                        () => Visibility(
                          visible: _controller.selectedDB.value.isNotEmpty,
                          child: Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: TextButton.icon(
                                  onPressed: () {
                                    Get.to(EditorView());
                                  },
                                  icon: HeroIcon(
                                    HeroIcons.login,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    "Iniciar",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
            Expanded(child: Container())
          ],
        ),
      ),
    );
  }
}
