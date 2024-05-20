import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddproductSceen extends StatefulWidget {
  const AddproductSceen({super.key});

  @override
  State<AddproductSceen> createState() => _AddproductSceenState();
}

class _AddproductSceenState extends State<AddproductSceen> {
  final TextEditingController _nameTEcontroller = TextEditingController();
  final TextEditingController _quantityTEcontroller = TextEditingController();
  final TextEditingController _totalpriceTEcontroller = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final TextEditingController _unitPriceTEcontrolller = TextEditingController();
  final TextEditingController _productCodeTEcontrolller = TextEditingController();

  final GlobalKey<FormState> _fromkey = GlobalKey<FormState>();
  bool _addproductinprogress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add New Product"),
        ),
        body:
        SingleChildScrollView(
          child: Padding(padding: const EdgeInsets.all(16),
            child: Form(
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
                    validator: (String ? value) {
                      if (value == null || value
                          .trim()
                          .isEmpty) {
                        return 'Write your product Name';
                      }
                      return null;
                    },


                  ),
                  const SizedBox(height: 16,),
                  TextFormField(
                    controller: _productCodeTEcontrolller,
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,

                    decoration: InputDecoration(
                      hintText: 'Productcode',
                      labelText: 'Productcode',


                    ),
                    validator: (String ? value) {
                      if (value == null || value
                          .trim()
                          .isEmpty) {
                        return 'Write  product code';
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
                    validator: (String ? value) {
                      if (value == null || value
                          .trim()
                          .isEmpty) {
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
                    validator: (String ? value) {
                      if (value == null || value
                          .trim()
                          .isEmpty) {
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
                    validator: (String ? value) {
                      if (value == null || value
                          .trim()
                          .isEmpty) {
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
                    validator: (String ? value) {
                      if (value == null || value
                          .trim()
                          .isEmpty) {
                        return 'Image';
                      }
                      return null;
                    },


                  ),
                  const SizedBox(height: 16,),
                  // if(_addproductinprogress == true)
                  //   const Center(
                  //     child: CircularProgressIndicator(),
                  //   )
                  // else
                  // ElevatedButton(
                  //
                  //     onPressed: () {
                  //       if (_fromkey.currentState!.validate()) {
                  //         _addProduct();
                  //       };
                  //     },
                  //     child: const Text("Add")),
                  Visibility(
                    visible: _addproductinprogress == false,
                      replacement:const Center(
                        child: CircularProgressIndicator(),
                      ) ,
                      child: ElevatedButton(
                          onPressed: () {
                            if (_fromkey.currentState!.validate()) {
                              _addProduct();
                            };
                          },
                          child: const Text("Add")),
                  )

                ],
              ),
            ),

          ),
        )

    );
  }

  Future<void> _addProduct() async {
    _addproductinprogress = true;
    setState(() {

    });
    // _addNewProductInProgress = true;
    // setState(() {});
    // Step 1: Set Url
    const String addNewProductUrl =
        'https://crud.teamrabbil.com/api/v1/CreateProduct';

    // Step 2:  Prepare data
    Map<String, dynamic> inputData = {
      "Img": _imageTEController.text.trim(),
      "ProductCode": _productCodeTEcontrolller.text,
      "ProductName": _nameTEcontroller.text,
      "Qty": _quantityTEcontroller.text,
      "TotalPrice": _totalpriceTEcontroller.text,
      "UnitPrice": _unitPriceTEcontrolller.text
    };

    // URI -> Uniform Resource Identifier
    // Step 3: Parse
    Uri uri = Uri.parse(addNewProductUrl);
    // Step 4: Send Request
    Response response = await post(
      uri,
      body: jsonEncode(inputData),
      headers: {'content-type': 'application/json'},
    );
    print(response.statusCode);
    print(response.body);
    print(response.headers);
    _addproductinprogress = false;
    setState(() {

    });
    if(response.statusCode == 200){
      _nameTEcontroller.clear();
      _productCodeTEcontrolller.clear();
      _unitPriceTEcontrolller.clear();
      _totalpriceTEcontroller.clear();
      _quantityTEcontroller.clear();
      _imageTEController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("New product added")));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Faild to add ! Try again")));
    }
  }}
