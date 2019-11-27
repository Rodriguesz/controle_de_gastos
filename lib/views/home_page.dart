import 'package:controle_de_gastos/Widget/custom_drawer.dart';
import 'package:controle_de_gastos/views/add_gasto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

final _pageController = PageController();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController saldoController = TextEditingController();
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();

  List<CircularStackEntry> data = <CircularStackEntry>[
    new CircularStackEntry(
      <CircularSegmentEntry>[
        new CircularSegmentEntry(500.0, Colors.red[200], rankKey: 'Q1'),
        new CircularSegmentEntry(1000.0, Colors.green[200], rankKey: 'Q2'),
        new CircularSegmentEntry(2000.0, Colors.blue[200], rankKey: 'Q3'),
        new CircularSegmentEntry(1000.0, Colors.yellow[200], rankKey: 'Q4'),
      ],
      rankKey: 'Quarterly Profits',
    ),
  ];

  double _saldo = 0;
  @override
  Widget build(BuildContext context) {
    new AnimatedCircularChart(
      key: _chartKey,
      size: const Size(300.0, 300.0),
      initialChartData: data,
      chartType: CircularChartType.Pie,
    );
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text('Controle de gastos'),
        backgroundColor: Color.fromARGB(250, 20, 200, 500),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView(scrollDirection: Axis.vertical, children: <Widget>[
        Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              child: Column(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),

                //Container que junta o Text e o TextFormfield

                Container(
                  
                    child: Material(
                        
                        elevation: 9.0,
                        borderRadius: BorderRadius.circular(15),
                        shadowColor: Color(0x802196f3),
                        color: Colors.blue[50],
                        child: Column(
                          children: <Widget>[
                            //Container do TEXT
                            Container(
                              
                                padding: EdgeInsets.fromLTRB(0, 10, 10, 3),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(left: 13),
                                    ),
                                    Text(
                                      "Saldo Atual:",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 30.0),
                                    )
                                  ],
                                )),
                            //Container do TextField    
                            Container(
                             
                              padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                              child: TextFormField(
                                controller: saldoController,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                  border: OutlineInputBorder(),
                                  prefixText: "R\$ ",
                                  prefixStyle: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                                style: TextStyle(fontSize: 20),
                                onChanged: _onChanged,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ))), //O container fecha aqui!!!!!!
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
                ),
                Container(
                    child: Material(
                        color: Colors.white,
                        elevation: 9.0,
                        borderRadius: BorderRadius.circular(15),
                        shadowColor: Color(0x802196f3),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 20, 13, 0),
                                ),
                                Container(
                                  child: Text(
                                    'Gráfico',
                                    style: TextStyle(
                                      fontSize: 30,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                          Column(children: <Widget>[
                            Container(
                              color: Colors.yellow,
                              child: Text('Teste de container'),
                              )
                          ],)
                          
                          ],
                        ))),
              ]),
            ))
      ]),
      drawer: CustomDrawer(_pageController),
    );
  }

  void _onChanged(int) {
    setState(() {
      String text;
      _saldo = double.parse(text);

      saldoController.text = _saldo.toString();
      //_saldo = double.parse(saldoController.text);
    });
  }

  void _cycleSamples() {
    List<CircularStackEntry> nextData = <CircularStackEntry>[
      new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(1500.0, Colors.red[200], rankKey: 'Q1'),
          new CircularSegmentEntry(750.0, Colors.green[200], rankKey: 'Q2'),
          new CircularSegmentEntry(2000.0, Colors.blue[200], rankKey: 'Q3'),
          new CircularSegmentEntry(1000.0, Colors.yellow[200], rankKey: 'Q4'),
        ],
        rankKey: 'Quarterly Profits',
      ),
    ];
    setState(() {
      _chartKey.currentState.updateData(nextData);
    });
  }
}



class PrimaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: <Widget>[
        Scaffold(
        body: HomePage(),
        drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
         appBar: AppBar(
        title: Text('Adicionar novo gasto'),
        backgroundColor: Color.fromARGB(250, 20, 200, 500),
        centerTitle: true,
      ),
        body: Add_Spend(),
        drawer: CustomDrawer(_pageController),
        )
      ],
    );
  }
}

/*Text(
                "Saldo Atual: R\$${_saldo.toStringAsFixed(2)}",
                semanticsLabel: 'Saldo',
                style: TextStyle(color: Colors.black, fontSize: 30.0),
                textAlign: TextAlign.justify, 
              ),*/

/*

  void confirm() {
    if (saldoController != null) {
      novoSaldo = double.parse(saldoController.text);
      if (novoSaldo >= 0)
        setState(() {
          _saldo = novoSaldo;
        });
    }
  }


double novoSaldo;
   _onChanged() {
    novoSaldo = _saldo;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(novoSaldo == 0 ? 'Adicione seu saldo' : 'Novo saldo'),
            content: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                TextFormField(
                  controller: saldoController,
                  decoration: InputDecoration(labelText: 'Saldo'),
                )
              ],
            )),
            actions: <Widget>[
              FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                    confirm();
                  })
            ],
          );
        });
  }*/
