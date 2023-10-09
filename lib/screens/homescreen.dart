import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:invoice_generator_2pm/utils/productsdata.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pd;
import 'package:printing/printing.dart';

final pdf = pd.Document();

generatePdf() async {
  pdf.addPage(pd.Page(
    build: (context) {
      return pd.Container(
        height: double.infinity,
        width: double.infinity,
        child: pd.Column(
          children: [
            pd.ListView.builder(
              itemBuilder: (context, index) => pd.Text(
                '${productAmount[index]}',
                style: const pd.TextStyle(
                  fontSize: 40,
                  color: PdfColors.blueAccent,
                ),
              ),
              itemCount: productName.length,
            ),

            pd.Text("Total : ${total}",style: pd.TextStyle(fontSize: 50,color: PdfColors.red)),
          ],
        ),
      );
    },
    pageFormat: PdfPageFormat.a4,
  ));
  await Printing.layoutPdf(
    onLayout: (format) async => await pdf.save(),
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {

                  for(int i=0; i<productAmount.length; i++)
                    {
                      total = total + productAmount[i];
                    }

                  await generatePdf();
                },
                icon: Icon(Icons.picture_as_pdf)),
          ],
          leading: const Icon(Icons.menu, color: Colors.white),
          backgroundColor: const Color(0xff219C90),
          title:
              const Text("Home Screen", style: TextStyle(color: Colors.white)),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => productBox(index),
          itemCount: productName.length,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff219C90),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('add');
          },
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}

Widget productBox(int index) {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.all(15),
    height: 80,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: const Color(0xff219C90), width: 1.5),
    ),
    child: ListTile(
      leading: Text(
        '${productName[index]}',
        style: TextStyle(fontSize: 18),
      ),
      title: Text(
        '${productQty[index]} Qty',
        style: TextStyle(fontSize: 18),
      ),
      trailing: Text(
        '${productAmount[index]}/-',
        style: TextStyle(fontSize: 18),
      ),
    ),
  );
}
