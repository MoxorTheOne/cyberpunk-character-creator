class TextAttribute {
  String attribute;
  String label;
  String? description;

  TextAttribute(this.attribute, this.label, this.description);

  Map<String, dynamic> toJson() {
    return {
      'attribute': attribute,
      'label': label,
      'description': description,
    };
  }
}
