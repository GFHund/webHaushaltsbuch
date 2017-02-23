import 'dart:async';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import '../objects/product.dart';
import '../services/productService.dart';

@Component(selector: 'Create-Products-Dialog',
//template: '<h1>Hello {{hero.name}}</h1>')
templateUrl: "Create_Products_Dialog.html",
providers: const[ProductService],
directives: const[ROUTER_DIRECTIVES],
)
class Create_Products_Dialog implements OnInit{
  List<Product> products;
  final ProductService _productService;


  String productName;
  String productPrice;
  int buyDay;
  int buyMonth;
  int buyYear;

  Create_Products_Dialog(this._productService){
    DateTime now = new DateTime.now();
    this.buyDay = now.day;
    this.buyMonth = now.month;
    this.buyYear = now.year;
  }

  Future<Null> ngOnInit()async{
    products = (await _productService.getProducts());
  }

  void onAddItem(){
    try{
      double price = double.parse(productPrice);
    }
    catch(e)
    {
      //aaa
    }
    DateTime buyDate = new DateTime(buyYear,buyMonth,buyDay);
    Product newProduct = new Product(productName, price, buyDate.millisecondsSinceEpoch);
    _productService.onInsert(newProduct);
  }
}
