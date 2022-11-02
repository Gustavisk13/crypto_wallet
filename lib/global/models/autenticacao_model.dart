class AutenticacaoModel {
  String? email;
  String? senha;
  String? tokenAcesso;

  AutenticacaoModel({
    this.email,
    this.senha,
    this.tokenAcesso,
  });

  factory AutenticacaoModel.fromJson(Map<String, dynamic> json) {
    return AutenticacaoModel(tokenAcesso: json['auth_token']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.senha;
    return data;
  }
}
