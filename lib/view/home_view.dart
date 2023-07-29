import 'dart:math';
import 'package:flutter/material.dart';
import 'package:my_workshop/provider/product_provider.dart';
import 'package:my_workshop/view/product_form_input_view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Consumer<ProductProvider>(
        builder: (context, provider, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.search,
                ),
                hintText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45),
                ),
              ),
              onChanged: (value) => context.read<ProductProvider>().search(value),
            ),
            SizedBox(height: 16),
            Text(
              "My Product",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: (provider.productSearchResult ?? provider.products).length,
                itemBuilder: (context, index) {
                  var _color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
                  return GestureDetector(
                    onTap: () {
                      context.read<ProductProvider>().setProductSelected(
                            (provider.productSearchResult ?? provider.products)[index],
                          );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductFormInputView(),
                        ),
                      );
                    },
                    child: Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: _color.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Image.network(
                              (provider.productSearchResult ?? provider.products)[index].imageUrl ?? "",
                              errorBuilder: (context, error, stackTrace) => SizedBox(),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  (provider.productSearchResult ?? provider.products)[index].name ?? "",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  (provider.productSearchResult ?? provider.products)[index].description ?? "",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "Price : ${(provider.productSearchResult ?? provider.products)[index].price ?? ""} bath",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: _color.withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 0,
                                  blurRadius: 5,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Material(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(90),
                              child: InkWell(
                                onTap: () async {
                                  await context.read<ProductProvider>().deleteProduct(
                                        (provider.productSearchResult ?? provider.products)[index].id!,
                                      );
                                },
                                borderRadius: BorderRadius.circular(90),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
