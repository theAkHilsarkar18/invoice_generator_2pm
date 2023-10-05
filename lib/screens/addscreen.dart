import 'dart:math';

import 'package:flutter/material.dart';
import 'package:invoice_generator_2pm/utils/productsdata.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController txtProductName = TextEditingController();
  TextEditingController txtProductPrice = TextEditingController();
  TextEditingController txtProductQty = TextEditingController();
  TextEditingController txtProductDiscount = TextEditingController();
  TextEditingController txtProductCategory = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff219C90),
          leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back_outlined, color: Colors.white)),
          title: Text("Add Product", style: TextStyle(color: Colors.white)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              textFieldBox(txtProductName,Icon(Icons.shopping_bag_outlined,color: Color(0xff219C90),),'Product Name'),
              textFieldBox(txtProductPrice,Icon(Icons.monetization_on_outlined,color: Color(0xff219C90), ),'Price'),
              textFieldBox(txtProductQty,Icon(Icons.numbers,color: Color(0xff219C90,),) ,'Qty'),
              // textFieldBox(txtProductCategory,Icon(Icons.category_outlined,color: Color(0xff219C90))),
              // textFieldBox(txtProductDiscount,Icon(Icons.discount_outlined,color: Color(0xff219C90))),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor:  const Color(0xff219C90),
          onPressed: () {

            setState(() {

              productName.add(txtProductName.text);
              productAmount.add(txtProductPrice.text);
              productQty.add(txtProductQty.text);
              Navigator.of(context).pop();
              log(productAmount[1]);
            });

          },
          child: Icon(Icons.add_shopping_cart_rounded,color: Colors.white),
        ),
      ),
    );
  }
}


Widget textFieldBox(TextEditingController name , Icon i1, String pname)
{
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      controller: name,
      decoration: InputDecoration(
        labelText: pname,
        prefixIcon: i1,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Color(0xff219C90),
              width: 2
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Color(0xff219C90),
              width: 1
          ),
        ),
      ),
    ),
  );
}

