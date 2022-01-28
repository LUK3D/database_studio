import 'dart:convert';

import 'package:backdev/controllers/ExplorerController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:backdev/tab_panel/tabpanel.dart';
import 'package:tree_view/tree_view.dart';

class ExplorerView extends StatelessWidget with TabPageMixin {
  @override
  final String title = 'Explorer';

  @override
  final Widget icon = HeroIcon(
    HeroIcons.server,
    size: 15,
  );

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
                    startExpanded: true,
                    children: _controller.databases.map((db) {
                      return Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Transform.scale(
                                    scale: 0.7,
                                    child: Obx(
                                      () => Checkbox(
                                          value: _controller
                                                  .selectedDatabase.value ==
                                              db,
                                          onChanged: (val) {
                                            _controller.selectedDatabase.value =
                                                db;
                                            _controller.getChilds(
                                                database: db.name);
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
                            Obx(
                              () => Visibility(
                                visible:
                                    (_controller.selectedDatabase.value == db),
                                child: Container(
                                  color: Colors.grey[100],
                                  height: 43.0 * _controller.tables.length,
                                  padding: EdgeInsets.only(left: 20, right: 6),
                                  child: Row(
                                    children: [
                                      VerticalDivider(),
                                      Expanded(
                                        child: Container(
                                          child: TreeView(
                                            startExpanded: true,
                                            children: _controller.tables
                                                .map((db_table) {
                                              return Container(
                                                child: Column(
                                                  children: [
                                                    Divider(
                                                      height: 2,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Transform.scale(
                                                            scale: 0.7,
                                                            child: Obx(
                                                              () => Checkbox(
                                                                  value: _controller
                                                                          .selectedDatabase
                                                                          .value ==
                                                                      db,
                                                                  onChanged:
                                                                      (val) {
                                                                    _controller
                                                                            .selectedTable
                                                                            .value =
                                                                        db_table
                                                                            .name;
                                                                  }),
                                                            )),
                                                        IconButton(
                                                          onPressed: () {},
                                                          splashRadius: 20,
                                                          splashColor: Theme.of(
                                                                  context)
                                                              .primaryColor
                                                              .withOpacity(0.5),
                                                          icon: Icon(
                                                            Icons.grid_on_sharp,
                                                            color: Colors
                                                                .grey[600],
                                                            size: 25,
                                                          ),
                                                        ),
                                                        Text(
                                                          db_table.name,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .grey[700]),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
