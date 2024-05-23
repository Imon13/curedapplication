import 'dart:convert';
import 'package:curdcls1/add-product_sceen.dart';
import 'package:curdcls1/update_product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ProductListSceen extends StatefulWidget {
  const ProductListSceen({super.key});

  @override
  State<ProductListSceen> createState() => _ProductListSceenState();
}

class _ProductListSceenState extends State<ProductListSceen> {
  bool _getProductListinProgress = false;
  List<product> productList = [];

  @override
  void initState() {
    super.initState();
    _getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
      ),
      body:
      RefreshIndicator(
        onRefresh: _getProductList,
        child: Visibility(
          visible: !_getProductListinProgress,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: ListView.separated(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return _buildProductItem(context, productList[index]);
            },
            separatorBuilder: (_, __) {
              return Divider();
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddproductSceen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _getProductList() async {
    setState(() {
      _getProductListinProgress = true;
    });

    const String productListUrl = 'https://crud.teamrabbil.com/api/v1/ReadProduct';
    Uri uri = Uri.parse(productListUrl);
    Response response = await get(uri);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      final jsonProductList = decodedData['data'];
      for (Map<String, dynamic> p in jsonProductList) {
        product pp = product(
          id: p['_id'] ?? "",
          productName: p['ProductName'] ?? 'unkown',
          productCode: p['ProductCode'] ?? 'unkown',
          productQuantity: p['Qty'] ?? 'unkown',
          unitprice: p['UnitPrice'] ?? 'unkown',
          image: p['img'] ?? 'unkown',
          totalprice: p['TotalPrice'] ?? 'unkown',
        );
        productList.add(pp);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to get! Try again")));
    }

    setState(() {
      _getProductListinProgress = false;
    });
  }

  void _showDeleteAlert() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Delete Product"),
          content: Text("Are you sure you want to delete this product?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Add delete logic here
                Navigator.of(context).pop();
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  Widget _buildProductItem(BuildContext context, product p) {
    return ListTile(
      title: Text(p.productName),
      subtitle: Wrap(
        spacing: 16,
        children: [
          Text("Unit Price: ${p.unitprice}"),
          Text("Unit Quantity: ${p.productQuantity}"),
          Text("Total Price: ${p.totalprice}"),
        ],
      ),
      trailing: Wrap(
        spacing: 16,
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () async  {
            final result = await  Navigator.push(
                  context, MaterialPageRoute
              (builder: (context) => UpproductSceen(pp: p,))

            );
            if(result == true){
              _getProductList();
            }
            },


          ),
          IconButton(
            onPressed: () {
              _showDeleteAlert();
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}

class product {
  final String id;
  final String productName;
  final String productCode;
  final String productQuantity;
  final String unitprice;
  final String image;
  final String totalprice;

  product({
    required this.id,
    required this.productName,
    required this.productCode,
    required this.productQuantity,
    required this.unitprice,
    required this.image,
    required this.totalprice,
  });
}
