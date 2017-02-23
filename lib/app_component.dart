// Copyright (c) 2017, GFHund. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
//import 'package:angular2/router.dart';

//import 'package:webHaushaltsbuch/hello_dialog/hello_dialog.dart';
import 'Overview_Products_Dialog/Overview_Products_Dialog.dart';
import 'Create_Products_Dialog/Create_Products_Dialog.dart';
import 'services/productService.dart';

//import 'package:webHaushaltsbuch/objects/product.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  styleUrls: const ['app_component.css'],
  directives: const [ROUTER_DIRECTIVES],
  providers: const [ProductService,ROUTER_PROVIDERS])
@RouteConfig(const[
  const Route(path: '/NewProduct',name: 'CreateProduct', component:Create_Products_Dialog,useAsDefault:true),
  const Route(path: '/ProductList',name: 'OverviewProducts', component:Overview_Product_Dialog)
])
class AppComponent {
  // Nothing here yet. All logic is in HelloDialog.
  //final List<Product> products;
  /*
  void onInsert(Product newProduct)
  {
    products.add(newProduct);
  }
  */
  String title = 'Haushaltsbuch';
}
