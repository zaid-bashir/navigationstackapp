// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:navigationstackapp/app/data/productData.dart';
import 'package:navigationstackapp/app/modules/products/models/productmodel.dart';
import '../../productDetail/views/product_detail_view.dart';
import '../controllers/products_controller.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  ProductsController? productsController;

  @override
  void initState() {
    productsController = Get.put(ProductsController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(productsController!.widgets.isEmpty
            ? 'Products'
            : "Product Details Page")),
        centerTitle: true,
        leading: IconButton(
          icon: Obx(
            () => productsController!.widgets.isEmpty
                ? const SizedBox()
                : const Icon(Icons.arrow_back_ios),
          ),
          onPressed: () {
            productsController!.widgets
                .removeAt(productsController!.widgets.length - 1);
            log(productsController!.widgets.toList().toString());
          },
        ),
      ),
      body: Obx(
        () => productsController!.widgets.isEmpty
            ? ListView.builder(
                itemCount: ProductData().productDataItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      productsController!.widgets.add(
                        ProductDetailView(
                          productModel: ProductModel.fromJson(
                            ProductData().productDataItems[index],
                          ),
                        ),
                      );
                      log(productsController!.widgets.toList().toString());
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              ProductModel.fromJson(
                                      ProductData().productDataItems[index])
                                  .imageLink!,
                              height: 200.0,
                              width: double.infinity,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              ProductModel.fromJson(
                                      ProductData().productDataItems[index])
                                  .name!,
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              '\$${ProductModel.fromJson(ProductData().productDataItems[index]).price!.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              ProductModel.fromJson(
                                      ProductData().productDataItems[index])
                                  .description!,
                              style: const TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : productsController!
                .widgets[productsController!.widgets.length - 1],
      ),
    );
  }
}
