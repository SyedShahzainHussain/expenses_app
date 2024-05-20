import 'package:expense_app_last_week/view/expense_screen/expense_screen.dart';
import 'package:expense_app_last_week/view_model/transaction_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TransactionViewModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Last Week Expense App',
        theme: ThemeData(
          
          scaffoldBackgroundColor: Colors.white,
          cardTheme: const CardTheme(
              color: Colors.white, surfaceTintColor: Colors.white),
          primarySwatch: Colors.purple,
          textTheme: GoogleFonts.poppinsTextTheme(),
          
          useMaterial3: true,
        ),
        home: const ExpenseScreen(),
        
      ),
    );
  }
}
