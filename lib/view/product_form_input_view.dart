import 'package:flutter/material.dart';
import 'package:my_workshop/provider/product_provider.dart';
import 'package:provider/provider.dart';

class ProductFormInputView extends StatefulWidget {
  const ProductFormInputView({Key? key}) : super(key: key);

  @override
  State<ProductFormInputView> createState() => _ProductFormInputViewState();
}

class _ProductFormInputViewState extends State<ProductFormInputView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  void initState() {
    var productSelected = context.read<ProductProvider>().productSelected;
    if (productSelected != null) {
      nameController.text = productSelected.name ?? "";
      descController.text = productSelected.description ?? "";
      priceController.text = productSelected.price.toString();
      imageController.text = productSelected.imageUrl ?? "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 32),
                Text(
                  "Add Product",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Name",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.05),
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: descController,
                  decoration: InputDecoration(
                    hintText: "Description",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.05),
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: priceController,
                  decoration: InputDecoration(
                    hintText: "Price",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.05),
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: imageController,
                  decoration: InputDecoration(
                    hintText: "Image Url",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.05),
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: _formKey.currentState?.validate() == true
                        ? () async {
                            var productSelected = context.read<ProductProvider>().productSelected;
                            if (productSelected != null) {
                              await context.read<ProductProvider>().updateProducts(
                                    id: productSelected.id!,
                                    name: nameController.text,
                                    desc: descController.text,
                                    price: priceController.text,
                                    image: imageController.text,
                                  );
                            } else {
                              await context.read<ProductProvider>().addProducts(
                                    name: nameController.text,
                                    desc: descController.text,
                                    price: priceController.text,
                                    image: imageController.text,
                                  );
                            }
                            Navigator.pop(context);
                          }
                        : null,
                    child: Text("Save"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
