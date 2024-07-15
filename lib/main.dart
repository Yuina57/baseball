import 'package:flutter/material.dart';
import 'omote_page.dart';
import 'ura_page.dart';


final List<List<dynamic>> rows = [
    ['表', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ['裏', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  ];

void main() {
  runApp(MyApp(rows));
}

class MyApp extends StatelessWidget {
  MyApp(this.rows);
  List<List<dynamic>> rows;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   // leading: Icon(Icons.arrow_back),
        //   title:Text("時間管理"),
        //   // actions: <Widget>[
        //   //   IconButton(
        //   //     onPressed: () {},
        //   //     icon: Icon(Icons.favorite),
        //   //   ),
        //   //   IconButton(
        //   //     onPressed: () {},
        //   //     icon: Icon(Icons.more_vert),
        //   //   ),
        //   // ],
        // ),
        body: BackgroundImageWidget(),
      ),
    );
  }
}

class BackgroundImageWidget extends StatelessWidget {
   BackgroundImageWidget({super.key});
  final List<String> columns = [' ','1','2','3','4','5','6','7','total'];
  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/baseball_koushien.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              '目指せ！甲子園！',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Color.fromARGB(255, 189, 63, 63),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // ElevatedButton(

            Padding(padding: EdgeInsets.all(10),
            child: Container(
            color: Color.fromARGB(117, 100, 58, 29),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  for (String column in columns)
                    DataColumn(
                      label: Text(
                        column,
                        style: TextStyle(fontStyle: FontStyle.italic,fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                    ),
                ],
                rows: [
                  for (int rowIndex = 0; rowIndex < rows.length; rowIndex++)
                    DataRow(
                      cells: [
                        for (int colIndex = 0; colIndex < columns.length; colIndex++)
                          DataCell(Text(rows[rowIndex][colIndex].toString(),style: TextStyle(fontStyle: FontStyle.italic,fontSize: 20,color: const Color.fromARGB(255, 0, 0, 0)),)),
                          // fontWeight: FontWeight.bold
                      ],
                    ),
                ],
              ),
          ),
          ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OmotePage(rows)),
                    );
                  },

                  child:const Padding(
                    padding:  EdgeInsets.all(15),
                    child: Text(
                      "表：予定入力",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromARGB(255, 59, 107, 146),
                      ),
                    ),
                  ),
                    
                  ),
                  
                
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UraPage(rows)),
                    );
                  },
                  child:const Padding(
                    padding:  EdgeInsets.all(15),
                    child: Text(
                      "裏：タスク達成",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromARGB(255, 59, 107, 146),
                      ),
                    ),
                  ),
                ),
              ],
            )

          ],

        ),
      ),
    );
  }
}

