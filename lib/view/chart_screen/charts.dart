import 'package:expense_app_last_week/view/chart_screen/widget/chart_bars_widget.dart';
import 'package:expense_app_last_week/view_model/transaction_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionViewModel>(builder: (context, data, _) {
      return Card(
        elevation: 5,
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: data.makechart.map((e) {
              return Expanded(
                child: ChartBars(
                    label: e["day"] as String,
                    spendingAmount: e["amount"] as double,
                    spendingPctTotal: data.maxSpending == 0.0
                        ? 0.0
                        : (e["amount"] as double) / data.maxSpending),
              );
            }).toList(),
          ),
        ),
      );
    });
  }
}
