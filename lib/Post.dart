

class Post {
  final int id;
  final int idEnderecoOrigem;
  final int idEnderecoDestino;
  final int idProduto;
  final int qtdTransferida;


  Post({this.id, this.idEnderecoOrigem, this.idEnderecoDestino, this.idProduto, this.qtdTransferida});



  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      idEnderecoOrigem: json['idEnderecoOrigem'],
      idEnderecoDestino: json['idEnderecoDestino'],
      idProduto: json['idProduto'],
      qtdTransferida: json['qtdTransferida'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["idEnderecoOrigem"] = idEnderecoOrigem;
    map["idEnderecoDestino"] = idEnderecoDestino;
    map["idProduto"] = idProduto;
    map["qtdTransferida"] = qtdTransferida;

    return map;
  }
}

