import 'package:curdcls1/add-product_sceen.dart';
import 'package:curdcls1/update_product.dart';
import 'package:flutter/material.dart';

class ProductListSceen extends StatefulWidget {
  const ProductListSceen({super.key});

  @override
  State<ProductListSceen> createState() => _ProductListSceenState();
}

class _ProductListSceenState extends State<ProductListSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
      ),
      body: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildProductItem(context);
        },
        separatorBuilder: (_, __) {
          return Divider();
        },
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

  Widget _buildProductItem(BuildContext context) {
    return ListTile(
      title: Text("Product Name"),
      subtitle: Wrap(
        spacing: 16,
        children: [
          Text("Unit Price: 100"),
          Text("Unit Quantity: 100"),
          Text("Total Price: 1000"),
        ],
      ),
      trailing: Wrap(
        spacing: 16,
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => UpproductSceen()));
            },
            icon: Icon(Icons.edit),
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
