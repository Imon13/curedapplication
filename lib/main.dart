import 'package:curdcls1/product_sceen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const CuredApplicaton());
}
class CuredApplicaton extends StatelessWidget {
  const CuredApplicaton({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purpleAccent)
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24
            ),
            fixedSize: const Size.fromWidth(double.maxFinite),
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),

            ),
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,

          ),
        )
      ),
      home: ProductListSceen(),
    );
  }
}
