import 'package:expense_app_last_week/view/add_new_expense/add_new_expense_screen.dart';
import 'package:expense_app_last_week/view/chart_screen/charts.dart';
import 'package:expense_app_last_week/view/transaction_screen/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExpenseScreen extends StatelessWidget {
  const ExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Expense App",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
        ),
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            // ! Chart
            Chart(),
            // ! Transaction
            TransactionScreen()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          showModalBottomSheet(
            
              shape:
                  const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              context: context,
              builder: (_) => const AddNewExpenseScreen());
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
