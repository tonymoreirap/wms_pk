import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'Picking_Destino.dart';

class Confirma_Pk extends StatefulWidget {

  //Passagem de dados
  int enderecoOrigem;
  Confirma_Pk({Key key, @required this.enderecoOrigem}) : super(key: key);

  @override
  _Confirma_PkState createState() => _Confirma_PkState();
}

class _Confirma_PkState extends State<Confirma_Pk> {


  String _idProduto = "idProduto";
  String _descProduto = "descProduto";
  String _idEndereco = "idEndereco";
  String _qtdEstoque = "qtdEstoque";
  String _dtValidade = "dtValidade";
  String _lote = "lote";
  TextEditingController _controlaProduto = TextEditingController();

  _recuperarProduto() async {


    String _produtoSelecionado = _controlaProduto.text;
    String urlConfirma = "http://181.222.137.89:8099/DataSnap/rest/TServiceEstoquePk/GetEstoque/1098/${_produtoSelecionado}";
    http.Response response;

    response = await http.get(urlConfirma);
    Map<String, dynamic> retorno = json.decode(response.body);
    String id = retorno["id"];
    String idProduto = retorno["idProduto"];
    String descProduto = retorno["descProduto"];
    String idEndereco = retorno["idEndereco"];
    String qtdEstoque = retorno["qtdEstoque"];
    String dtValidade = retorno["dtValidade"];
    String lote = retorno["lote"];

    setState(() {

      _idProduto = "${idProduto}";
      _descProduto = "${descProduto}";
      _idEndereco = "${idEndereco}";
      _qtdEstoque = "${qtdEstoque}";
      _dtValidade = "${dtValidade}";
      _lote = "${lote}";

    });

    print(
        "Resposta: idProduto: ${idProduto} Descrição: ${descProduto} Endereço: ${idEndereco} Estoque: ${qtdEstoque} Validade: ${dtValidade}"
    );

  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        title: Text("Transferência de Picking - Produto",
        style: TextStyle(
          fontSize: 17
        ),),
        centerTitle: true ,
      )),
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
                  "Produto",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold
                ),
              ),
              Container(
                padding: EdgeInsets.all(13),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 0),
                      child: Form(
                        key: _formKey,
                          child: TextFormField(
                            autofocus: true,
                            validator: (value){

                              if (value.isEmpty) return "O campo é obrigatório";
                              if (value.length <1) return "O campo precisa ter mais de 2 caracteres";
                              return null;

                            },

                            onChanged: (ok){
                              print(('ok: ${ok}'));

                              setState(() {
                                _recuperarProduto();
                              });
                            },
                            style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey,
                            ),
                            keyboardType: TextInputType.number,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                              hintText: "Bipagem do produto ${this.widget.enderecoOrigem}",
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(22)
                              ),
                            ),
                            controller: _controlaProduto,
                          ),
                      ),

                    ),
                    Container(
                      padding: EdgeInsets.all(13),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Descrição",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Container(
                              width: 60,
                              height: 90,
                              child: Text(
                                _descProduto,
                                style: TextStyle
                                  (fontSize: 15,
                                  color: Colors.red,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              padding: EdgeInsets.only(top: 35),
                              decoration: BoxDecoration(
                                  border: Border.all(width: 0, color: Colors.white),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 0
                                    )
                                  ]
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Emb",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Container(
                                width: 60,
                                height: 60,
                                child: Text(
                                  ("UND"),
                                  style: TextStyle
                                    (fontSize: 20,
                                    color: Colors.red,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                padding: EdgeInsets.only(top: 15),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 3, color: Colors.black),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 0
                                      )
                                    ]
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Fator",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Container(
                                width: 60,
                                height: 60,
                                child: Text(
                                  ("1"),
                                  style: TextStyle
                                    (fontSize: 20,
                                    color: Colors.red,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                padding: EdgeInsets.only(top: 15),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 0, color: Colors.black),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 0
                                      )
                                    ]
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Disponível",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Container(
                                width: 60,
                                height: 60,
                                child: Text(
                                  ("${_qtdEstoque}"),
                                  style: TextStyle
                                    (fontSize: 20,
                                    color: Colors.red,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                padding: EdgeInsets.only(top: 15),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 0, color: Colors.black),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.white,
                                          blurRadius: 0
                                      )
                                    ]
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Qde.Transf",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                width: 60,
                                height: 60,
                                padding: EdgeInsets.all(0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    TextField(
                                      maxLines: 1,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,

                                      decoration: InputDecoration(
                                          hintStyle: TextStyle(
                                              fontSize: 4,
                                              color: Colors.black26,
                                              fontWeight: FontWeight.bold
                                          ),
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(0)
                                          )
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
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
                                      builder: (context) => Picking_Destino()
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
                              "Próximo",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            padding: EdgeInsets.all(15),
                            onPressed: (){

                              //Criando exceção para não ir pra proxima tela sem preencher os campos
                              if (_formKey.currentState.validate()){
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text("Enviando dados para o servidor"),
                                  duration: Duration(seconds: 3),
                                ));
                              }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Picking_Destino()
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
            ],
          ),
        ),
      ),
    );
  }
}
