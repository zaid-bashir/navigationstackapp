// ignore_for_file: must_be_immutable
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:navigationstackapp/app/modules/products/models/productmodel.dart';
import 'package:navigationstackapp/app/modules/products/views/products_view.dart';

import '../../../data/productData.dart';
import '../../products/controllers/products_controller.dart';
import '../controllers/product_detail_controller.dart';

class ProductDetailView extends StatefulWidget {
  ProductDetailView({Key? key, this.productModel}) : super(key: key);
  ProductModel? productModel;
  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  ProductDetailController? productDetailController;
  ProductsController? productsController;
  @override
  void initState() {
    productDetailController = Get.put(ProductDetailController());
    productsController = Get.put(ProductsController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.network(
                    widget.productModel!.imageLink!,
                    fit: BoxFit.contain,
                    height: 300.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productModel!.name!,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          '\$${widget.productModel!.price}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          widget.productModel!.description!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Recommended Products",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(
            height: 200.0,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ProductData().productDataItems.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    productsController!.counter =
                        productsController!.counter + 1;
                    productsController!.widgets.add(
                      ProductDetailView(
                        productModel: ProductModel.fromJson(
                          ProductData().productDataItems[index],
                        ),
                      ),
                    );
                    log(productsController!.widgets.toList().toString());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          children: [
                            Image.network(
                              ProductModel.fromJson(
                                      ProductData().productDataItems[index])
                                  .imageLink!,
                              fit: BoxFit.contain,
                              height: 60.0,
                              width: 60.0,
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              ProductModel.fromJson(
                                      ProductData().productDataItems[index])
                                  .price!
                                  .toString(),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              ProductModel.fromJson(
                                      ProductData().productDataItems[index])
                                  .name!
                                  .toString(),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
