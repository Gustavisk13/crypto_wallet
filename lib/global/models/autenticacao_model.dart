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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = senha;
    return data;
  }
}
