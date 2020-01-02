

class endereco {

  int id;
  int rua;
  int predio;
  int nivel;
  int apto;
  int situacao;
  int codTipoEnd;
  int codTipoAlmoxarifado;
  int codEstacao;
  int codDeposito;
  int bloqueado;

  endereco ({this.id, this.rua, this.predio, this.nivel, this.apto,
    this.situacao, this.codTipoEnd, this.codTipoAlmoxarifado, this.codEstacao,
    this.codDeposito, this.bloqueado});

  factory endereco.fromJson(Map<String, dynamic> parsedJson){
    return endereco(
      id: parsedJson["id"],
      rua: parsedJson["rua"],
      predio: parsedJson["predio"],
      nivel: parsedJson["nivel"],
      apto: parsedJson["apto"],
      situacao: parsedJson["situacao"],
      codTipoEnd: parsedJson["codTipoEnd"],
      codTipoAlmoxarifado: parsedJson["codTipoAlmoxarifado"],
      codEstacao: parsedJson["codEstacao"],
      codDeposito: parsedJson["codDeposito"],
      bloqueado: parsedJson["bloqueado"],


    );
  }

}

