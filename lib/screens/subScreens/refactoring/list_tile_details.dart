import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:money_management_app/screens/mainScreens/transaction/edit_transaction.dart';
import 'package:money_management_app/screens/mainScreens/transaction/view_transaction.dart';
import 'package:money_management_app/screens/mainScreens/transaction/tran_del_pop.dart';
import 'package:money_management_app/screens/subScreens/refactoring/others.dart';
import '../../../models/category/category_model.dart';
import '../../../models/transaction/transaction_model.dart';
import 'container_shadow.dart';
import 'styles.dart';

listTileDetails(BuildContext context, List<dynamic> filterlist, var length) {
  return filterlist.isNotEmpty
      ?ScrollConfiguration(
        behavior: RemoveGlow(),
        child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (ctx, index) {
              final value = filterlist[index];
              return GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (ctx) {
                      return showDetailsDialog(context, value);
                    },
                  );
                },
                child: Card(
                  elevation: 10.0,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Slidable(
                    startActionPane: ActionPane(
                      motion: const BehindMotion(),
                      children: [
                        SlidableAction(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                          onPressed: (context) {
                            final model = TransactionModel(
                                purpose: value.purpose,
                                amount: value.amount,
                                date: value.date,
                                category: value.category,
                                type: value.type,
                                id: value.id);
                           Get.to(()=>EditTransaction(model: model));
                          },
                          icon: Icons.edit,
                          label: 'Edit',
                        ),
                        SlidableAction(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15)),
                            icon: Icons.delete,
                            label: 'Delete',
                            onPressed: (context) {
                              tranDelePop(context, value);
                            }),
                      ],
                    ),
                    child: Container(
                      height: 75,
                      alignment: Alignment.center,
                      decoration: containerShadow(BorderRadius.circular(15)),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: contBottom,
                          child: value.type == CategoryType.icome
                              ? const Icon(
                                  Icons.arrow_circle_down,
                                  size: 35,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                )
                              : const Icon(
                                  Icons.arrow_circle_up,
                                  size: 35,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                        ),
                        title: Text(
                          capitalize(value.category.name),
                          style: textSTYL,
                        ),
                        subtitle: Text(parseDate(value.date), style: textSTYL),
                        trailing: value.type == CategoryType.icome
                            ? Text(
                                '+ ₹${value.amount}',
                                style: textSTYL.copyWith(
                                    color: incomeColor,
                                    fontWeight: FontWeight.bold),
                              )
                            : Text(
                                '- ₹${value.amount}',
                                style: textSTYL.copyWith(
                                    color: expenseColor,
                                    fontWeight: FontWeight.bold),
                              ),
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (ctx, index) =>
                SizedBox(height: MediaQuery.of(context).size.height * (1 / 100)),
            itemCount: length,
          ),
      )
      : dataEmpty(context);
}
