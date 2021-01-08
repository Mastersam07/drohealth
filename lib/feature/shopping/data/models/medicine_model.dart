class Medicine {
  final String id;
  final String name;
  final String pharmName;
  final String detail;
  final double price;
  final String seller;
  final String modeOfDispense;
  final String constituents;
  final String imagePath;
  Medicine(
      {this.id,
      this.seller,
      this.modeOfDispense,
      this.constituents,
      this.pharmName,
      this.detail,
      this.price,
      this.imagePath,
      this.name});
}
