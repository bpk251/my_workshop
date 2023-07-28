import 'package:flutter/material.dart';

class ProductFormInputView extends StatefulWidget {
  const ProductFormInputView({Key? key}) : super(key: key);

  @override
  State<ProductFormInputView> createState() => _ProductFormInputViewState();
}

class _ProductFormInputViewState extends State<ProductFormInputView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController =TextEditingController();
  TextEditingController descController =TextEditingController();
  TextEditingController priceController =TextEditingController();
  TextEditingController imageController =TextEditingController();
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
                    onPressed: () {},
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
