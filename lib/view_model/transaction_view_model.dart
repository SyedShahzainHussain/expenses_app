import 'package:expense_app_last_week/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionViewModel with ChangeNotifier {
  final List<TransactionModel> _transaction = [];

  List<TransactionModel> get transaction => [..._transaction];

  void addTransaction(String title, double amount, DateTime dateTime) {
    _transaction.add(TransactionModel(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      dateTime: dateTime,
    ));
    notifyListeners();
  }

  List<Map<String, Object>> get makechart {
    return List.generate(7, (index) {
      final weekdays = DateTime.now().subtract(Duration(days: index));
      double amount = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (weekdays.day == recentTransaction[i].dateTime.day &&
            weekdays.month == recentTransaction[i].dateTime.month &&
            weekdays.year == recentTransaction[i].dateTime.year) {
          amount += recentTransaction[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekdays).substring(0, 1),
        'amount': amount
      };
    }).reversed.toList();
  }

  List<TransactionModel> get recentTransaction {
    return _transaction.where((element) {
      return element.dateTime
          .isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  double get maxSpending {
    return makechart.fold(
        0.0,
        (previousValue, element) =>
            previousValue + (element["amount"] as double));
  }

  void delete(String id) {
    _transaction.removeWhere((element) {
      return element.id == id;
    });
    notifyListeners();
  }
}
