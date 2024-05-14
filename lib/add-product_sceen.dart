import 'package:flutter/material.dart';

class AddproductSceen extends StatefulWidget {
  const AddproductSceen({super.key});

  @override
  State<AddproductSceen> createState() => _AddproductSceenState();
}

class _AddproductSceenState extends State<AddproductSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Product"),
      ),
      body:
          SingleChildScrollView(
            child: Padding(padding: const EdgeInsets.all(16),
              child:  Form(
                child: Column(
                  children: [
                    TextFormField(

                      decoration: InputDecoration(
                       hintText: 'Name',
                        labelText: 'Name',


                      ),

            
                    ),
                    const SizedBox(height: 16,),
                    TextFormField(

                      decoration: InputDecoration(
                        hintText: 'Unit_Price',
                        labelText: 'Unit_Price',


                      ),


                    ),
                    const SizedBox(height: 16,),

                    TextFormField(

                      decoration: InputDecoration(
                        hintText: 'Quantity',
                        labelText: 'Quantity',


                      ),


                    ),
                    const SizedBox(height: 16,),

                    TextFormField(

                      decoration: InputDecoration(
                        hintText: 'Total_price',
                        labelText: 'Total_price',


                      ),


                    ),
                    const SizedBox(height: 16,),

                    TextFormField(

                      decoration: InputDecoration(
                        hintText: 'Images',
                        labelText: 'Images',


                      ),


                    ),
                    const SizedBox(height: 16,),
                    ElevatedButton(

                        onPressed: (){},
                        child: const Text("Add"))

                  ],
                ),
              ),
              
            ),
          )
     
    );
  }
}
