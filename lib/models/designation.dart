enum Designation {
  productDesigner(value: 'Product Designer'),
  flutterDeveloper(value: 'Flutter Developer'),
  qaTester(value: 'QA Tester'),
  productOwner(value: 'Product Owner');

  const Designation({required this.value});
  final String value;
}
