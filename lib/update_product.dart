import 'package:flutter/material.dart';

class UpproductSceen extends StatefulWidget {
  const UpproductSceen({super.key});

  @override
  State<UpproductSceen> createState() => _UpproductSceenState();
}

class _UpproductSceenState extends State<UpproductSceen> {
  final TextEditingController _nameTEcontroller = TextEditingController();
  final TextEditingController _quantityTEcontroller = TextEditingController();
  final TextEditingController _totalpriceTEcontroller = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final TextEditingController _unitPriceTEcontrolller = TextEditingController();
  final GlobalKey<FormState> _fromkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Update  Product"),
        ),
        body:
        SingleChildScrollView(
          child: Padding(padding: const EdgeInsets.all(16),
            child:  Form(
              key: _fromkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameTEcontroller,
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    decoration: InputDecoration(
                      hintText: 'Name',
                      labelText: 'Name',


                    ),
                    validator: (String ? value){
                      if(value == null || value.trim().isEmpty){
                        return 'Write your product Name';
                      }
                      return null;
                    },


                  ),
                  const SizedBox(height: 16,),
                  TextFormField(
                    controller: _unitPriceTEcontrolller,
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    decoration: InputDecoration(
                      hintText: 'Unit_Price',
                      labelText: 'Unit_Price',


                    ),
                    validator: (String ? value){
                      if(value == null || value.trim().isEmpty){
                        return 'Write Unit Price';
                      }
                      return null;
                    },


                  ),
                  const SizedBox(height: 16,),

                  TextFormField(
                    controller: _quantityTEcontroller,
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    decoration: InputDecoration(
                      hintText: 'Quantity',
                      labelText: 'Quantity',


                    ),
                    validator: (String ? value){
                      if(value == null || value.trim().isEmpty){
                        return 'Write Quatity';
                      }
                      return null;
                    },


                  ),
                  const SizedBox(height: 16,),

                  TextFormField(
                    controller: _totalpriceTEcontroller,
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    decoration: InputDecoration(
                      hintText: 'Total_price',
                      labelText: 'Total_price',


                    ),
                    validator: (String ? value){
                      if(value == null || value.trim().isEmpty){
                        return 'Write Total Price';
                      }
                      return null;
                    },


                  ),
                  const SizedBox(height: 16,),

                  TextFormField(
                    controller: _imageTEController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    decoration: InputDecoration(
                      hintText: 'Images',
                      labelText: 'Images',


                    ),
                    validator: (String ? value){
                      if(value == null || value.trim().isEmpty){
                        return 'Image';
                      }
                      return null;
                    },


                  ),
                  const SizedBox(height: 16,),
                  ElevatedButton(

                      onPressed: (){
                        if(_fromkey.currentState!.validate()){

                        };
                      },
                      child: const Text("Update"))

                ],
              ),
            ),

          ),
        )

    );


  }
  @override
  void dispose() {
    _imageTEController.dispose();
    _nameTEcontroller.dispose();
    _totalpriceTEcontroller.dispose();
    _quantityTEcontroller.dispose();
    _unitPriceTEcontrolller.dispose();
    super.dispose();
  }
}
