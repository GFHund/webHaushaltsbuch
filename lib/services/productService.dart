import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:angular2/core.dart';
//import 'package:http/http.dart';

import '../objects/product.dart';

final List<Product> productsDBTemp=[
  new Product("Test",2.5,1488024756),
  new Product("product2", 3.7, 1488024756)
];

@Injectable()
class ProductService
{
    Future<List<Product>> getProducts()async {
    //return (await productsDBTemp);

    var url ="http://127.0.0.1/server/getProducts.php";
    var requestResult = await HttpRequest.getString(url);
    var decodedJsonString = JSON.decode(requestResult)['Products'];
    List<Product> ret = new List<Product>();
    for(int i=0;i<decodedJsonString.length;i++)
    {
      ret.add(new Product.fromJson(decodedJsonString[i]));
    }
    return ret;
  }

  Future<Product> getProduct()async{
    var url ="http://127.0.0.1/server/getProduct.php";
    var requestResult = await HttpRequest.getString(url);
    var decodedJsonString = JSON.decode(requestResult);
    return new Product.fromJson(decodedJsonString);
  }

  void onInsert(Product newProduct)
  {
    productsDBTemp.add(newProduct);

    HttpRequest request = new HttpRequest();
    request.onReadyStateChange.listen((_){
      if(request.readyState == HttpRequest.DONE && (request.status == 200 || request.status == 0)){
        //aaaa
      }
    });
    var url ="http://127.0.0.1/server/insertProduct.php";
    request.open("POST",url,async: false);
    String json = newProduct.toJson();
    request.send(json);
  }
  /*
  static final _productsUrl = 'server/productsJson';
  Future<List<Product>> getProducts() async
  {
    try{
      final response = await _http.get(_productsUrl);
      final products = _extractData(response)
      .map((value)=>new Product.fromJson(value))
      .toList();
    }
    catch(e)
    {
      throw _handleError(e);
    }
  }

  dynamic _extractData(Response resp) => JSON.decode(resp.body)['data'];

  Exception _handleError(dynamic e)
  {
    print(e);
    return new Exception('Server error; cause: $e');
  }
  */
}
