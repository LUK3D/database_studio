import 'dart:convert';

import 'package:backdev/controllers/ExplorerController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tabpanel/tabpanel.dart';
import 'package:tree_view/tree_view.dart';

class ExplorerView extends StatelessWidget with TabPageMixin {
  @override
  final String title = 'Explorer';

  @override
  final IconData iconData = Icons.account_tree_outlined;

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(ExplorerController());

    return Row(
      children: [
        Container(
          width: 50,
        ),
        VerticalDivider(),
        Expanded(
          child: Container(
            child: _controller.databases.value.isNotEmpty
                ? TreeView(
                    startExpanded: false,
                    children: _controller.databases.map((db) {
                      return Container(
                        child: Row(
                          children: [
                            Transform.scale(
                                scale: 0.7,
                                child: Obx(
                                  () => Checkbox(
                                      value:
                                          _controller.selectedDatabase.value ==
                                              db,
                                      onChanged: (val) {
                                        _controller.selectedDatabase.value = db;
                                      }),
                                )),
                            IconButton(
                              onPressed: () {},
                              splashRadius: 20,
                              splashColor: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
                              icon: HeroIcon(
                                HeroIcons.database,
                                color: Colors.grey[600],
                                size: 25,
                              ),
                            ),
                            Text(
                              db.name,
                              style: TextStyle(color: Colors.grey[700]),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  )
                : Center(child: CircularProgressIndicator()),
          ),
        ),
      ],
    );
  }
}
