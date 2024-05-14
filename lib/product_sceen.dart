import 'package:curdcls1/add-product_sceen.dart';
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
      body:
      ListView.separated(
        itemCount: 5,
          itemBuilder: (context,index){
          return
            ListTile(
            title: Text("Product Name"),
            subtitle:
            Wrap(
              spacing: 16,
              children: [
                Text("Unit Price:100"),
                Text("Unit Qantitty:100"),
                Text("Unit Price:1000"),
              ],
            ),

            trailing:
            Wrap(
              spacing: 16,

              children: [IconButton(onPressed: (){},
                  icon: Icon(Icons.edit)),
                IconButton(onPressed: (){}, icon: Icon(Icons.delete))
              ],
            ),

            

          );


          },
        // use - instand of contex and __ instad of index .because of cleaing code
        separatorBuilder: (_,  __) {
          return Divider();
        },),
      floatingActionButton:FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=>AddproductSceen()));
          },child: const Icon(Icons.add),),
    );
  }
}

 Widget _bulildProductItem(){
  return
  ListTile(
    title: Text("Product Name"),
    subtitle:
    Wrap(
      spacing: 16,
      children: [
        Text("Unit Price:100"),
        Text("Unit Qantitty:100"),
        Text("Unit Price:1000"),
      ],
    ),

    trailing:
    Wrap(
      spacing: 16,

      children: [IconButton(onPressed: (){},
          icon: Icon(Icons.edit)),
        IconButton(onPressed: (){}, icon: Icon(Icons.delete))
      ],
    ),



  );
}

