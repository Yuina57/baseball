import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'main.dart';
import 'ura_page.dart';



class OmotePage extends StatelessWidget {
  OmotePage(this.rows);
  List<List<dynamic>> rows;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   // leading: Icon(Icons.arrow_back),
        //   title:Text("時間管理"),
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
  // final List<List<dynamic>> rows = [
  //   ['表', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  //   ['裏', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
  // ];

  final TextEditingController newValueController = TextEditingController();
  String? selectedTime;
  String? selectedTime_2;

  String selectedTime_scool="08:00";
  String selectedTime_scool_2="16:00";

  String selectedTime_sleep="23:00";
  String selectedTime_sleep_2="06:00";

  String selectedTime_other="4";
 
  
  void _updateCellValue(selectedTime,selectedTime_2,selectedTime_sleep,selectedTime_sleep_2,selectedTime_other,selectedTime_scool,selectedTime_scool_2,timeList,timeList_2) {
    
    // print(double.parse(selectedTime_2));
    int colIndex = 0;
    double newValue = 0;
    int time_1=0;
    int time_2=0;
    int SleepTime_1=0;
    int SleepTime_2=0;
    int SchoolTime_1=0;
    int SchoolTime_2=0;
    int OtherTime=0;
    String _displayText = '';

    setState(() {
      _displayText = newValueController.text;
      newValueController.clear();
      for(int i=0;i<daysOfWeek.length;i++) {
        if(selectedDay==daysOfWeek[i]) {
          colIndex=i+1;
        }
      }
      for(int i=0;i<timeList.length;i++) {
        if(selectedTime==timeList[i]) {
          time_1=i;
        }
        if(selectedTime_2==timeList[i]) {
          time_2=i;
        }
        if(selectedTime_sleep==timeList[i]) {
          SleepTime_1=i;
        }
        if(selectedTime_sleep_2==timeList[i]) {
          SleepTime_2=i;
        }
        if(selectedTime_scool==timeList[i]) {
          SchoolTime_1=i;
        }
        if(selectedTime_scool_2==timeList[i]) {
          SchoolTime_2=i;
        }
    
      }
      for(int i=0;i<timeList_2.length;i++) {
        if(selectedTime_other==timeList_2[i]) {
          OtherTime=i;
        }
      }
      
      if(0<colIndex && colIndex<8 &&time_2-time_1>0 &&SchoolTime_2-SchoolTime_1>0) {
        rows[0][colIndex] = 24-((time_2-time_1)+(SleepTime_2+24-SleepTime_1)+OtherTime+(SchoolTime_2-SchoolTime_1));
      }
    });

  }

  List<String> generateTimeList() {
    List<String> times = [];
    for (int i = 0; i < 24; i++) {
      String hour = i.toString().padLeft(2, '0'); // 2桁の数字にフォーマット
      times.add('$hour:00');
    }
    return times;
  }
  List<String> generateTimeList_2() {
    List<String> times = [];
    for (int i = 0; i < 12; i++) {
      String hour = i.toString(); // 2桁の数字にフォーマット
      times.add('$hour');
    }
    return times;
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

  @override
  Widget build(BuildContext context) {
    List<String> timeList = generateTimeList();
    List<String> timeList_2 = generateTimeList_2();
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/baseball_6.jpeg'),
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
                        _updateCellValue(selectedTime,selectedTime_2,selectedTime_sleep,selectedTime_sleep_2,selectedTime_other,selectedTime_scool,selectedTime_scool_2,timeList,timeList_2);
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
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("部活　　",style: TextStyle(fontSize: 18),),
                            DropdownButton<String>(
                              hint: Text('開始時刻'),
                              value: selectedTime,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedTime = newValue;
                                });
                              },
                              items: timeList.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            Text("　～　"),
                            DropdownButton<String>(
                              hint: Text('終了時刻'),
                              value: selectedTime_2,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedTime_2 = newValue;
                                  
                                });
                              },
                              items: timeList.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                      ), 
                      Row(
                          
                          children: [
                            Text("学校　　",style: TextStyle(fontSize: 18),),
                            DropdownButton<String>(
                              value: selectedTime_scool,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedTime_scool = newValue!;
                                });
                              },
                              items: timeList.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            const Text("　～　"),
                            DropdownButton<String>(
                              value: selectedTime_scool_2,
                              onChanged: (String? newValue) {
                                setState(() {
                                   selectedTime_scool_2 = newValue!;
                                  
                                });
                              },
                              items: timeList.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                      ), 
                      Row(
                          
                          children: [
                            const Text("睡眠　　",style: TextStyle(fontSize: 18),),
                            DropdownButton<String>(
                              value: selectedTime_sleep,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedTime_sleep = newValue!;
                                });
                              },
                              items: timeList.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            const Text("　～　"),
                            DropdownButton<String>(
                              value: selectedTime_sleep_2,
                              onChanged: (String? newValue) {
                                setState(() {
                                   selectedTime_sleep_2 = newValue!;
                                  
                                });
                              },
                              items: timeList.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                      ), 
                      Row(
                          
                          children: [
                            Text("他　　",style: TextStyle(fontSize: 18),),
                            DropdownButton<String>(
                            
                              value: selectedTime_other,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedTime_other = newValue!;
                                });
                              },
                              items: timeList_2.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text("$value時間"),
                                );
                              }).toList(),
                            ),
                          ],
                      ), 
                     
                      ],
                    )
                    
                    
                  
                  ),
                  ),
                ] 
              ),
              

            ),
          // ),

            
          
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
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
                  //       MaterialPageRoute(builder: (context) => UraPage(rows)),
                  //     );
                  //   },
                  //   child: const Padding(
                  //     padding: EdgeInsets.all(15),
                  //     child: Text(
                  //       '裏：タスク達成＞',
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