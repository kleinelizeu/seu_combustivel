import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Seu Combustível",
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController gasolinaController = TextEditingController();
  TextEditingController alcoolController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Insira os valores dos combustiveis!";

  void _resetFields() {
    gasolinaController.text = "";
    alcoolController.text = "";
    setState(() {
      _infoText = "Insira os valores dos combustíveis!";
      
    });
    
  }

  void _calculate() {
    setState(() {
      double alcool = double.parse(alcoolController.text);
      double gasolina = double.parse(gasolinaController.text);
      double melhorCombustivel = alcool / gasolina;
      print(melhorCombustivel);

      if (melhorCombustivel < 0.70) {
        _infoText = "É melhor colocar álcool";
      } else {
        _infoText = "É melhor colocar gasolina";
      }
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de Combustível"),
        centerTitle: true,
        backgroundColor: Colors.orange,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Image.asset(
            "images/combustivel2.jpg",
            fit: BoxFit.cover,
            height: 1000.0,
          ),
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Form(
              key: _formKey,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(Icons.directions_car, size: 200.0, color: Colors.orange),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Valor do Álcool(R\$)",
                      labelStyle: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        
                      )),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 25.0),
                  controller: alcoolController,
                  validator:(value){
                    if(value.isEmpty){
                      return "Insira o valor do Álcool!";
                    }
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Valor da Gasolina (R\$)",
                      labelStyle: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      )),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 25.0),
                  controller: gasolinaController,
                  validator:(value){
                    if(value.isEmpty){
                      return "Insira o valor da Gasolina";
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 10.0),
                  child: Container(
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: (){
                        if(_formKey.currentState.validate()){
                          _calculate();
                        }
                      },
                      child: Text(
                        "Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                      color: Colors.orange,
                    ),
                  ),
                ),
                Text(
                  _infoText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            ),
          )
        ],
      ),
    );
  }
}
