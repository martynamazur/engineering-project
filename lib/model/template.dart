enum TemplateType{
  emptyTemplate,
  template1,
  template2
}

class Template{
  final TemplateType type;
  final List<int> values;

  Template(this.type, this.values);
}

final List<Template> templates = [
  Template(TemplateType.emptyTemplate, []),
  Template(TemplateType.template1, [1,2]),
  Template(TemplateType.template2, [4, 5]),
];