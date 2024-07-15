import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'main.dart';
import 'omote_page.dart';

class UraPage extends StatelessWidget {
  UraPage(this.rows);
  List<List<dynamic>> rows;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   // leading: Icon(Icons.arrow_back),
        //   title:Text("時間管理(裏)"),
        //   actions: <Widget>[
        //     IconButton(
        //       onPressed: () {},
        //       icon: Icon(Icons.favorite),
        //     ),
        //     IconButton(
        //       onPressed: () {},
        //       icon: Icon(Icons.more_vert),
        //     ),
        //   ],
        // ),
        body: MyDataTable(),
      ),
    );
  }
}


class MyDataTable extends StatefulWidget {
  @override
  _MyDataTableState createState() => _MyDataTableState();
}

// final List<List<dynamic>> rows=widget.rows;

class _MyDataTableState extends State<MyDataTable> {
  
  final List<String> columns = [' ','1','2','3','4','5','6','7','total'];
 
  
  void _updateCellValue(_isChecked,_isChecked_2,_isChecked_3,_isChecked_4) {
    
    int colIndex = 0;
    int count=0;


    setState(() {
      
      for(int i=0;i<daysOfWeek.length;i++) {
        if(selectedDay==daysOfWeek[i]) {
          colIndex=i+1;
        }
      }
      
      
        if((_isChecked==true)) {
          count++;
        }
        if((_isChecked_2==true)) {
          count++;
        }
        if((_isChecked_3==true)) {
          count++;
        }
        if((_isChecked_4==true)) {
          count++;
        }

      if(0<colIndex && colIndex<8) {
        rows[1][colIndex] = count;
      }

    });

  }



  final List<String> daysOfWeek = [
      '月',
      '火',
      '水',
      '木',
      '金',
      '土',
      '日'
    ];
  
  String selectedDay = '月';
  bool _isChecked = false;
  bool _isChecked_2 = false;
  bool _isChecked_3 = false;
  bool _isChecked_4 = false;

  @override
  Widget build(BuildContext context) {
    
    // List<String> timeList = generateTimeList();
    // List<String> timeList_2 = generateTimeList_2();
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/baseball_koushien6.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      // scrollDirection: Axis.vertical,
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
          Padding(
            padding: EdgeInsets.all(10),
            child:Container(
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
          //  Align(
          //   alignment: Alignment.center,
            Padding(
              padding: EdgeInsets.all(10),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          
                          color: const Color.fromARGB(255, 255, 255, 255)), 
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                            child: DropdownButton<String>(
                              iconSize: 40,
                              value: selectedDay,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedDay = newValue!;
                                });
                              },
                              items: daysOfWeek.map<DropdownMenuItem<String>>((String day) {
                                return DropdownMenuItem<String>(
                                  value: day,
                                  child: Text("$day曜日"),
                                );
                              }).toList(),
                            ),
                          
                        ),
                     ),
                      ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      
                      
                      child: ElevatedButton(
                      onPressed: (){
                        _updateCellValue(_isChecked,_isChecked_2,_isChecked_3,_isChecked_4);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                        'HomeRun',
                        style: TextStyle(
                          color: Colors.red,
                          fontStyle: FontStyle.italic,
                          fontSize: 36
                          ),
                        )

                        ),
                      
                    ),
                    ),
                    ],
                  ),
                  
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      
                      color: Color.fromARGB(255, 255, 255, 255)), 
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2
                    ),
                    child:Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // for(int i=1;i<4;i++)...{
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Checkbox(
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value!;
                                    
                                  });
                                },
                              ),
                              const Text(
                                "宿題",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                            ],
                            
                        ), 
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: _isChecked_2,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked_2 = value!;
                                  });
                                },
                              ),
                              const Text(
                                "実験ノート",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                            ],
                            
                        ), 
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: _isChecked_3,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked_3 = value!;
                                  });
                                },
                              ),
                              const Text(
                                "模試対策",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                            ],
                            
                        ), 
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: _isChecked_4,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked_4 = value!;
                                  });
                                },
                              ),
                              const Text(
                                "音読",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                            ],
                            
                        ), 
                        // },
                        
                     
                     
                      ],
                    )
                    
                    
                  
                  ),
                  ),
                ] 
              ),
              

            ),
          Container(
            height: 250,
          ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp(rows)),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'ホーム',
                        style: TextStyle(
                        //   color: Colors.red,
                        //   fontStyle: FontStyle.italic,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      )

                      ),
                    
                  ),
                  // ElevatedButton(
                  //   onPressed: (){
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => OmotePage(rows)),
                  //     );
                  //   },
                  //   child: const Padding(
                  //     padding: EdgeInsets.all(15),
                  //     child: Text(
                  //       '表：予定入力＞',
                  //       style: TextStyle(
                  //       //   color: Colors.red,
                  //       //   fontStyle: FontStyle.italic,
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.bold
                  //       ),
                  //     )

                  //     ),
                    
                  // ),
                              ],
              ),
          //   ],
          // )
          
        ],
      ),
    );
  }


  


}
