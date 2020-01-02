import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'Confirma_Pk.dart';
import 'Login.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
import 'Post.dart';



class Picking_Destino extends StatefulWidget {

  @override
  _Picking_DestinoState createState() => _Picking_DestinoState();
}

class _Picking_DestinoState extends State<Picking_Destino> {


  TextEditingController _controlaDestino = TextEditingController();
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

  _confirmarEndereco() async{

    String _enderecoDestino = _controlaDestino.text;
    String urlDestino = "http://181.222.137.89:8099/DataSnap/rest/TServiceEndereco/GetEndereco/${_enderecoDestino}";
    http.Response response;

    response = await http.get(urlDestino);
    Map<String, dynamic> retorno = json.decode(response.body);
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

    print("resposta: " + response.body);
    print("resposta: " + response.statusCode.toString());
  }



  void enviarPost () async {


    String urlPost = "http://192.168.1.99:8099/DataSnap/rest/TServiceEstoquePk/Transferir";
    http.Response response;
    response = await http.post(urlPost);
    Map<String, dynamic> retornar = json.decode(response.body);




  }

  DateTime _date = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();

  Future<Null> _selectDate(BuildContext context) async {

    //CALENDARIO
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2019),
        builder: (context, child){
          return SingleChildScrollView(child: child,);
        }
    );

    if (picked != null && picked != _date) {
      print("Data Selecionada: ${_date.toString()}");
      setState(() {
        _date = picked;
      });
    }
  }

  List<DropdownMenuItem<int>> listDrop = [];

  void loadData(){

    listDrop.add(
        new DropdownMenuItem
          (child: new Text(
            "",
        ),
          value: 1,
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    loadData();

    //String _formataData = new DateFormat.yMMMd().format(_date);
    return Scaffold(
      appBar: AppBar(
        title: Text ("Transferência de Picking - Destino",
        style: TextStyle(
          fontSize: 17
        ) ,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8),
              ),
              Text(
                "Endereço",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 0),
                      child: TextField(
                        autofocus: true,
                        onSubmitted: (ok){
                          print(('ok: ${ok}'));

                          setState(() {
                            _confirmarEndereco();
                          });
                        },
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                            hintText: "Bipagem do Endereço",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(22)
                            )
                        ),
                        controller: _controlaDestino
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  Text(
                    "Endereço Mapeado: ",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  Text(
                    "Depósito: ",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
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
                            _rua,
                            style: TextStyle
                              (fontSize: 35,
                              color: Colors.red,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          padding: EdgeInsets.only(top: 10),
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
                            _predio,
                            style: TextStyle
                              (fontSize: 35,
                              color: Colors.red,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          padding: EdgeInsets.only(top: 10),
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
                            _nivel,
                            style: TextStyle
                              (fontSize: 35,
                              color: Colors.red,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          padding: EdgeInsets.only(top: 10),
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
                            _apto,
                            style: TextStyle
                              (fontSize: 35,
                              color: Colors.red,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          padding: EdgeInsets.only(top: 10),
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
                child: Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Text(
                        "Tipo de Armazenagem ",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    DropdownButton(
                      items: listDrop,
                      hint: Text("Endereço Picking Fracionado"),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                      ),
                      onChanged: (value) => print("Picking Fracionado: $value"),
                    ),
                  ],
                )
                ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Text(
                        "Validade do Produto ",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.date_range),
                        color: Colors.red,
                        onPressed: () => _date,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      child: Text(
                        "Voltar",
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
                        "Limpar",
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
                        "Finalizar",
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
                                builder: (context) => Login()
                            )
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ) ,
    );
  }
}
