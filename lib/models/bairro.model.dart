class BairroModel{
  int codigoBairro;
  String nomeBairro;
  int rpa;
  String mr;
  String regional;

  BairroModel({
    this.codigoBairro,
    this.nomeBairro,
    this.rpa,
    this.mr,
    this.regional
  });

  Map<String, dynamic> toMap(){
    return{
      'codigoBairro': codigoBairro,
      'nomeBairro': nomeBairro,
      'rpa': rpa,
      'mr': mr,
      'regional': regional,
    };
  }
  Map<dynamic, String> fromMap(Map<String, dynamic> map){
    return {
      codigoBairro: 'codigoBairro',
      nomeBairro: 'nomeBairro',
      rpa: 'rpa',
      mr: 'mr',
      regional: 'regional'
    };
  }
}