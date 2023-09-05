import 'package:flutter/material.dart';
import 'package:money_management_app/data_base/category/category_db.dart';
import 'package:money_management_app/data_base/transaction/transaction_db.dart';
import '../../subScreens/refactoring/styles.dart';
import '../../subScreens/refactoring/trans_short.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  Icon customIcon = const Icon(
    Icons.search,
    color: Colors.white,
    size: 30,
  );

  Widget customSearchBar = const Text(
    'Transaction Record',
    style: TextStyle(
        color: Colors.white, fontFamily: 'Inder', fontWeight: FontWeight.bold),
  );

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refresh();
    CategoryDB.instance.refreshUI();

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: barColor,
        title: Center(
          child: customSearchBar,
        ),
        actions: <Widget>[
          InkWell(
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            onTap: () {
              setState(() {
                if (customIcon.icon == Icons.search) {
                  customIcon = const Icon(
                    Icons.cancel,
                    color: Colors.white,
                  );
                  customSearchBar = TextField(
                    onChanged: (description) {
                      TransactionDB.instance.searchHistory(description);
                    },
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(30)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(30)),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText: 'Search',
                        hintStyle: const TextStyle(color: Colors.white)),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  );
                } else {
                  customIcon = const Icon(Icons.search);
                  customSearchBar = const Text(
                    "Transaction Record",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inder',
                        fontWeight: FontWeight.bold),
                  );
                }
              });
            },
            child: SizedBox(
              width: 100,
              child: customIcon,
            ),
          ),
        ],
      ),
      body: const TransShort(),
    );
  }
}
