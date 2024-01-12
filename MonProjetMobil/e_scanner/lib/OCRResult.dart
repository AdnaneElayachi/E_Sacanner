class OCRResult {
  final String variable;
  final String valeur;

  OCRResult({required this.variable, required this.valeur});

  factory OCRResult.fromJson(Map<String, dynamic> json) {
    return OCRResult(
      variable: json['variable'],
      valeur: json['valeur'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'variable': variable,
      'valeur': valeur,
    };
  }
}
