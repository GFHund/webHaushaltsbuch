// Copyright (c) 2017, GFHund. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/core.dart';
import 'package:angular2_components/angular2_components.dart';
import 'package:angular2/router.dart';

//import 'package:webHaushaltsbuch/hello_dialog/hello_dialog.dart';
import 'package:webHaushaltsbuch/Overview_Products_Dialog/Overview_Products_Dialog.dart';
import 'package:webHaushaltsbuch/services/productService.dart';

@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  //directives: const [materialDirectives, HelloDialog],
  //providers: const [materialProviders],
  directives: const [Overview_Product_Dialog],
  providers: const[ProductService],
)
class AppComponent {
  // Nothing here yet. All logic is in HelloDialog.
}
