import 'package:flutter/material.dart';
import 'package:money_management_app/data_base/balance/balance_db.dart';
import 'package:money_management_app/data_base/graph/chart.dart';
import 'package:money_management_app/data_base/transaction/transaction_db.dart';
import 'package:money_management_app/models/graph/graph.dart';
import 'package:money_management_app/screens/subScreens/refactoring/container_shadow.dart';
import 'package:money_management_app/screens/subScreens/refactoring/others.dart';
import 'package:money_management_app/screens/subScreens/refactoring/styles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}


class _StatisticsState extends State<Statistics> with TickerProviderStateMixin {
  List<ChartDatas> dataExpense = chartLogic(expenseNotifier1.value);
  List<ChartDatas> dataIncome = chartLogic(incomeNotifier1.value);
  List<ChartDatas> overview = chartLogic(overviewNotifier.value);
  List<ChartDatas> yesterday = chartLogic(yesterdayNotifier.value);
  List<ChartDatas> today = chartLogic(todayNotifier.value);
  List<ChartDatas> month = chartLogic(lastMonthNotifier.value);
  List<ChartDatas> week = chartLogic(lastWeekNotifier.value);
  List<ChartDatas> todayIncome = chartLogic(incomeTodayNotifier.value);
  List<ChartDatas> incomeYesterday = chartLogic(incomeYesterdayNotifier.value);
  List<ChartDatas> incomeweek = chartLogic(incomeLastWeekNotifier.value);
  List<ChartDatas> incomemonth = chartLogic(incomeLastMonthNotifier.value);
  List<ChartDatas> todayExpense = chartLogic(expenseTodayNotifier.value);
  List<ChartDatas> expenseYesterday =
      chartLogic(expenseYesterdayNotifier.value);
  List<ChartDatas> expenseweek = chartLogic(expenseLastWeekNotifier.value);
  List<ChartDatas> expensemonth = chartLogic(expenseLastMonthNotifier.value);
  late TabController tabController;
  

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    filterFunction();
    chartdivertFunctionExpense();
    chartdivertFunctionIncome();
    chartdivertFunctionOverview();
    
    
    super.initState();
  }

  String categoryId2 = 'All';
  int touchIndex = 1;

  @override
  Widget build(BuildContext context) {
    
    TransactionDB.instance.refresh();
    
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: barColor,
        title: const Text(
          'Statistics',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Inder',
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ScrollConfiguration(
        behavior: RemoveGlow(),
        child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16,
                ),
                child: Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  decoration: containerShadow(BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.height * 0.03,
                      left: MediaQuery.of(context).size.height * 0.03,
                    ),
                    child: DropdownButton<String>(
                      dropdownColor: bgColor,
                      borderRadius: BorderRadius.circular(20),
                      style: const TextStyle(
                        fontSize: 17,
                        fontFamily: 'Inder',
                        color: white,
                        fontWeight: FontWeight.w600,
                      ),
                      isExpanded: true,
                      underline: const SizedBox(),
                      value: categoryId2,
                      items: <String>[
                        'All',
                        'Today',
                        'Yesterday',
                        'This week',
                        'month',
                      ]
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          categoryId2 = value.toString();
                        });
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: TabBar(
                  indicator: containerShadow(BorderRadius.circular(30)),
                  controller: tabController,
                  labelColor: white,
                  labelStyle:
                      const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  unselectedLabelColor: graphBlue,
                  overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                  tabs: const [
                    Tab(
                      child: Text(
                        'Overview',
                        style: TextStyle(
                          fontFamily: 'Inder',
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Income',
                        style: TextStyle(
                          fontFamily: 'Inder',
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Expense',
                        style: TextStyle(
                          fontFamily: 'Inder',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.55,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(
                        16,
                      ),
                      child: chartdivertFunctionOverview().isEmpty
                          ? dataEmpty(context)
                          : Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: graphBlue,
                              ),
                              child: SfCircularChart(
                                legend: Legend(
                                  isVisible: true,
                                  overflowMode: LegendItemOverflowMode.wrap,
                                  position: LegendPosition.bottom,
                                ),
                                series: <CircularSeries>[
                                  PieSeries<ChartDatas, String>(
                                    dataLabelSettings: const DataLabelSettings(
                                      isVisible: true,
                                      connectorLineSettings:
                                          ConnectorLineSettings(
                                              type: ConnectorType.curve),
                                      overflowMode: OverflowMode.shift,
                                      showZeroValue: false,
                                      labelPosition:
                                          ChartDataLabelPosition.outside,
                                      textStyle: TextStyle(color: bgColor),
                                    ),
                                    dataSource: chartdivertFunctionOverview(),
                                    xValueMapper: (ChartDatas data, _) =>
                                        data.category,
                                    yValueMapper: (ChartDatas data, _) =>
                                        data.amount,
                                    explode: true,
                                  )
                                ],
                              ),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(
                        16,
                      ),
                      child: chartdivertFunctionIncome().isEmpty
                          ? dataEmpty(context)
                          : Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: graphBlue,
                              ),
                              child: SfCircularChart(
                                legend: Legend(
                                  isVisible: true,
                                  overflowMode: LegendItemOverflowMode.wrap,
                                  position: LegendPosition.bottom,
                                ),
                                series: <CircularSeries>[
                                  PieSeries<ChartDatas, String>(
                                    dataLabelSettings: const DataLabelSettings(
                                      textStyle: TextStyle(color: bgColor),
                                      isVisible: true,
                                      connectorLineSettings:
                                          ConnectorLineSettings(
                                              type: ConnectorType.curve),
                                      overflowMode: OverflowMode.shift,
                                      showZeroValue: false,
                                      labelPosition:
                                          ChartDataLabelPosition.outside,
                                    ),
                                    dataSource: chartdivertFunctionIncome(),
                                    xValueMapper: (ChartDatas data, _) =>
                                        data.category,
                                    yValueMapper: (ChartDatas data, _) =>
                                        data.amount,
                                    explode: true,
                                  )
                                ],
                              ),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(
                        16,
                      ),
                      child: chartdivertFunctionExpense().isEmpty
                          ? dataEmpty(context)
                          : Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: graphBlue,
                              ),
                              child: SfCircularChart(
                                legend: Legend(
                                  isVisible: true,
                                  overflowMode: LegendItemOverflowMode.wrap,
                                  position: LegendPosition.bottom,
                                ),
                                series: <CircularSeries>[
                                  PieSeries<ChartDatas, String>(
                                    dataLabelSettings: const DataLabelSettings(
                                      textStyle: TextStyle(color: bgColor),
                                      isVisible: true,
                                      connectorLineSettings:
                                          ConnectorLineSettings(
                                              type: ConnectorType.curve),
                                      overflowMode: OverflowMode.shift,
                                      showZeroValue: false,
                                      labelPosition:
                                          ChartDataLabelPosition.outside,
                                    ),
                                    dataSource: chartdivertFunctionExpense(),
                                    xValueMapper: (ChartDatas data, _) =>
                                        data.category,
                                    yValueMapper: (ChartDatas data, _) =>
                                        data.amount,
                                    explode: true,
                                  )
                                ],
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        
      ),
    );
  }

  chartdivertFunctionOverview() {
    if (categoryId2 == 'All') {
      return overview;
    }
    if (categoryId2 == 'Today') {
      return today;
    }
    if (categoryId2 == 'Yesterday') {
      return yesterday;
    }
    if (categoryId2 == 'This week') {
      return week;
    }
    if (categoryId2 == 'month') {
      return month;
    }
  }

  chartdivertFunctionIncome() {
    if (categoryId2 == 'All') {
      return dataIncome;
    }
    if (categoryId2 == 'Today') {
      return todayIncome;
    }
    if (categoryId2 == 'Yesterday') {
      return incomeYesterday;
    }
    if (categoryId2 == 'This week') {
      return incomeweek;
    }
    if (categoryId2 == 'month') {
      return incomemonth;
    }
  }

  chartdivertFunctionExpense() {
    if (categoryId2 == 'All') {
      return dataExpense;
    }
    if (categoryId2 == 'Today') {
      return todayExpense;
    }
    if (categoryId2 == 'Yesterday') {
      return expenseYesterday;
    }
    if (categoryId2 == 'This week') {
      return expenseweek;
    }
    if (categoryId2 == 'month') {
      return expensemonth;
    }
  }
}
