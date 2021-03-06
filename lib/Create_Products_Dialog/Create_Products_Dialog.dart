import 'dart:async';

import 'package:angular2/core.dart';
import 'package:angular2/common.dart';
import 'package:angular2/router.dart';

import '../objects/product.dart';
import '../services/productService.dart';

@Component(selector: 'Create-Products-Dialog',
//template: '<h1>Hello {{hero.name}}</h1>')
templateUrl: "Create_Products_Dialog.html",
//styleUrls: const["Create_Products_Dialog.css"],
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
    double price = 0.0;
    try{
      price = double.parse(productPrice);
    }
    catch(e)
    {
      price = 0.0;
    }
    DateTime buyDate = new DateTime(buyYear,buyMonth,buyDay);
    Product newProduct = new Product(productName, price, buyDate.millisecondsSinceEpoch);
    _productService.onInsert(newProduct);

  }

  Map<String,bool> verifyData(NgControl control)
  {
    if(control.name == "productName")
    {
      //aaaaaa
    }
    else if(control.name == "productPrice")
    {
      //aaa
    }
    else if(control.name == "buyDay")
    {
      //aaa
    }
    else if(control.name == "buyMonth")
    {
      //aaa
    }
    else if(control.name == "buyYear")
    {
      //aaa
    }
    return {"NotValid":false};
  }
}
