import 'package:flutter/material.dart';
import 'Confirma_Pk.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:wms_pk/Endereco.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class Picking extends StatefulWidget {
  @override
  _PickingState createState() => _PickingState();
}

class _PickingState extends State<Picking> {

  TextEditingController _controlaEndereco = TextEditingController();
  String _id = "Endereço";
  String _deposito = "Deposito";
  String _rua = "Rua";
  String _predio = "Predio";
  String _nivel = "Nivel";
  String _apto = "Apto";
  String _situacao = "Situação";
  String _codTipoEnd = "codTipoEnd";
  String _codTipoAlmoxarifado = "codTipoAlmoxarifado";
  String _codEstacao = "codEstacao";
  String _codDeposito = "codDeposito";
  String _bloqueado = "bloqueado";

  _recuperarEndereco() async{


    String enderecoDigitado = _controlaEndereco.text;
    String url = "http://181.222.137.89:8099/DataSnap/rest/TServiceEndereco/GetEndereco/${enderecoDigitado}";
    http.Response response;

    response = await http.get(url);
    Map<String, dynamic> retorno = json.decode(response.body); //MAP retorno de String para JSON
    String id = retorno["id"];
    String rua = retorno["rua"];
    String predio = retorno["predio"];
    String nivel = retorno["nivel"];
    String apto = retorno["apto"];
    String situacao = retorno["situacao"];
    String codTipoEnd = retorno["codTipoEnd"];
    String codTipoAlmoxarifado = retorno["codTipoAlmoxarifado"];
    String codEstacao = retorno["codEstacao"];
    String codDeposito = retorno["codDeposito"];
    String bloqueado = retorno["bloqueado"];

    setState(() {
      _id = "${id}";
      _deposito = "${codDeposito}";
      _rua = "${rua}";
      _predio = "${predio}";
      _nivel = "${nivel}";
      _apto = "${apto}";
      _situacao = "${situacao}";
      _codTipoEnd = "${codTipoEnd}";
      _codTipoAlmoxarifado = "${codTipoAlmoxarifado}";
      _codEstacao = "${codEstacao}";
      _codDeposito = "${codDeposito}";
      _bloqueado = "${bloqueado}";

    });


    print(
      "Resposta: id: ${id} rua: ${rua} predio: ${predio} nivel: ${nivel} apto: ${apto}"
    );

    //print("resposta: " + response.body);
    //print("resposta: " + response.statusCode.toString());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
            "Transferência de Picking",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 30),
              ),
              TextField(
                autofocus: true,
                onSubmitted: (ok){
                  print(('ok: ${ok}'));

                  setState(() {
                    _recuperarEndereco();
                  });
                },
                maxLines: 1,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(30, 16, 30, 16),
                  labelText: "Endereço Picking - Origem",
                  hintStyle: TextStyle(
                    color: Colors.black26,
                    fontStyle: FontStyle.italic,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Bipar no endereço de Origem ",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
                controller: _controlaEndereco,
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Endereço: ${_id}",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "Depósito: ${_deposito}",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        "Rua",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                        "Prédio",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                        "Nível",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                        "Apto",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //Text("0", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),),
                    Padding(
                      padding: EdgeInsets.only(),
                      child: Container(
                        width: 60,
                        height: 60,
                        child: Text(
                          ("$_rua"),
                          style: TextStyle
                            (fontSize: 45,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        padding: EdgeInsets.only(),
                        decoration: BoxDecoration(
                          border: Border.all(width: 0, color: Colors.black),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 0
                            )
                          ]
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0, bottom: 0),
                      child: Container(
                        width: 60,
                        height: 60,
                        child: Text(
                          (_predio),
                          style: TextStyle
                            (fontSize: 45,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        padding: EdgeInsets.only(),
                        decoration: BoxDecoration(
                            border: Border.all(width: 0, color: Colors.black),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 0
                              )
                            ]
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0, bottom: 0),
                      child: Container(
                        width: 60,
                        height: 60,
                        child: Text(
                          (_nivel),
                          style: TextStyle
                            (fontSize: 45,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        padding: EdgeInsets.only(),
                        decoration: BoxDecoration(
                            border: Border.all(width: 0, color: Colors.black),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 0
                              )
                            ]
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0, bottom: 0),
                      child: Container(
                        width: 60,
                        height: 60,
                        child: Text(
                          (_apto),
                          style: TextStyle
                            (fontSize: 45,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        padding: EdgeInsets.only(),
                        decoration: BoxDecoration(
                            border: Border.all(width: 0, color: Colors.black),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 0
                              )
                            ]
                        ),
                      ),
                    ),
                  ],
                )
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      autofocus: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(30, 16, 30, 16),
                        labelText: "Tipo de Armazenagem",
                        hintStyle: TextStyle(
                          color: Colors.black26,
                          fontStyle: FontStyle.italic,

                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Endereço Picking Fracionado",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22)
                        )
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      child: Text(
                          "Cancelar",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      padding: EdgeInsets.all(15),
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Confirma_Pk()
                            )
                        );
                      },
                    ),
                    RaisedButton(
                      child: Text(
                          "Próximo",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                      padding: EdgeInsets.all(15),
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Confirma_Pk()
                            )
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


