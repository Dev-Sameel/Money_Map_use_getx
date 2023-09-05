import 'package:flutter/material.dart';
import 'package:money_management_app/screens/subScreens/refactoring/others.dart';
import '../../subScreens/refactoring/styles.dart';
import '../../../models/category/category_model.dart';
import 'cate_del_pop.dart';

Widget Function(BuildContext, List<CategoryModel>, Widget?) categoryItems(
    BuildContext context, Color itemColor) {
  return (BuildContext ctx, List<CategoryModel> newList, Widget? _) {
    return newList.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: ScrollConfiguration(
              behavior: RemoveGlow(),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 150),
                itemBuilder: (ctx, index) {
                  final category = newList[index];
                  return Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        gradient: buttonGradient,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                cateDelPop(context, category);
                              },
                              icon: Container(
                                decoration: BoxDecoration(
                                    color: bgColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Icon(
                                  Icons.clear_outlined,
                                  shadows: <Shadow>[
                                    Shadow(
                                      color: white,
                                      blurRadius: 15.0,
                                    ),
                                  ],
                                  color: white,
                                  size: 22,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 8),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5,right: 5),
                            child: Text(
                              capitalize(
                                category.name,
                              ),
                              style: const TextStyle(
                                  fontFamily: 'Inder',
                                  color: Colors.white70,
                                  fontSize: 22.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: newList.length,
              ),
            ),
          )
        : dataEmpty(context);
  };
}
