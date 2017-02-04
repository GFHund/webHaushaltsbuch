class Product
{
  String m_produktname;
  double m_price;
  int m_timestamp;

  Product(this.m_produktname,this.m_price,this.m_timestamp);

  factory Product.fromJson(Map<String,dynamic> products) => new Product(products['productname'], _toDouble(products['price']), _toInt(products['timestamp']));
}