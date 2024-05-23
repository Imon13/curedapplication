import 'dart:convert';

import 'package:curdcls1/product_sceen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class UpproductSceen extends StatefulWidget {
  const UpproductSceen({super.key, required this.pp});
  final product pp ;
  @override
  State<UpproductSceen> createState() => _UpproductSceenState();
}

class _UpproductSceenState extends State<UpproductSceen> {
  final TextEditingController _nameTEcontroller = TextEditingController();
  final TextEditingController _quantityTEcontroller = TextEditingController();
  final TextEditingController _totalpriceTEcontroller = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final TextEditingController _unitPriceTEcontrolller = TextEditingController();
  final TextEditingController _productCodeTEcontroller = TextEditingController();

  final GlobalKey<FormState> _fromkey = GlobalKey<FormState>();
  bool _updateProductInProgress = false;
  @override
  void initState() {

    super.initState();
    _nameTEcontroller.text = widget.pp.productName;
    _imageTEController.text = widget.pp.image;
    _quantityTEcontroller.text = widget.pp.productQuantity;
    _totalpriceTEcontroller.text = widget.pp.totalprice;
    _unitPriceTEcontrolller.text = widget.pp.unitprice;
  }
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
                    controller: _productCodeTEcontroller,
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    decoration: InputDecoration(
                      hintText: 'Productcode',
                      labelText: 'Productcode',


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
                  Visibility(
                    visible: _updateProductInProgress==false,
                    replacement: Center(
                      child: CircularProgressIndicator(),
                    ),
                    child: ElevatedButton(

                        onPressed: (){
                          if(_fromkey.currentState!.validate()){
                                _updateProduct();
                          };
                        },
                        child: const Text("Update")),
                  )

                ],
              ),
            ),

          ),
        )

    );


  }
  Future<void> _updateProduct () async{
    _updateProductInProgress= true;
    setState(() {

    });
    Map<String, String> inputData = {
      "Img": _imageTEController.text,
      "ProductCode": _productCodeTEcontroller.text,
      "ProductName": _nameTEcontroller.text,
      "Qty": _quantityTEcontroller.text,
      "TotalPrice": _totalpriceTEcontroller.text,
      "UnitPrice": _unitPriceTEcontrolller.text
    };
    String _updateProductUrl = 'https://crud.teamrabbil.com/api/v1/UpdateProduct/${widget.pp.id}';
    Uri uri = Uri.parse(_updateProductUrl);
    Response response = await post(uri,
        headers: {'content-type': 'application/json'},
        body: jsonEncode(inputData));

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product has been updated')),
      );
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Update product failed! Try again.')),
      );
    }
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

