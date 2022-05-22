import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';

class Gasolina extends StatefulWidget {
  const Gasolina({Key? key}) : super(key: key);

  @override
  State<Gasolina> createState() => _GasolinaState();
}

class _GasolinaState extends State<Gasolina> {
  TextEditingController _ControllerAlcool = new TextEditingController();
  TextEditingController _ControllerGasolina = new TextEditingController();
  String _TextResultado = "";

  void _LimparCampos() {
    //Ao utilizar o os controladores eu não preciso aplicar o SetState, esse processo e feito de forma automatizada.
    _ControllerGasolina.text = "";
    _ControllerAlcool.text = "";
  }

  void _Calcular() {
    var vPrecoAlcool = double.tryParse(_ControllerAlcool.text);
    var vPrecoGasolina = double.tryParse(_ControllerGasolina.text);

    if ((vPrecoAlcool == null) || (vPrecoGasolina == null)) {
      setState(() {
        _TextResultado =
            "Número inválido! Digite um número sem vírgula e maior que zero.";
      });
    } else {
      //calcula

      if ((vPrecoAlcool / vPrecoGasolina) >= 0.7) {
        setState(() {
          _TextResultado = "Melhor abastecer com gasolina!";
        });
      } else {
        setState(() {
          _TextResultado = "Melhor abastecer com Álcool!!";
        });
      }

      _LimparCampos();
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //é o align do delphi (Define que os  filhos da coluna ocuparão toda a coluna)

          children: <Widget>[
            //imagem
            Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Image.asset("img/logo.png"),
            ),

            //Label
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Saiba qual a melhor opção para seu veículo",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal),
              ),
            ),

            //Campo digitação
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: TextField(
                decoration:
                    InputDecoration(labelText: "Preço Álcool, Ex: 6.50"),
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 20,
                ),
                controller: _ControllerAlcool,
              ),
            ),

            //Campo digitação
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: TextField(
                decoration:
                    InputDecoration(labelText: "Preço Gasolina, Ex: 7.50"),
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 20,
                ),
                controller: _ControllerGasolina,
              ),
            ),

            //botão
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton.icon(
                  label: Text(
                    "Calcular",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  icon: Icon(Icons.calculate),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueAccent),
                  ),
                  onPressed: _Calcular,
                )),

            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                _TextResultado,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      )),
    ));
  }
}
