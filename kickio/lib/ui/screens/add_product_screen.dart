import 'package:flutter/material.dart';
import 'package:kickio/data/models/product.module.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  static const routeName = '/addProduct-screen';
  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _priceFocus = FocusNode();
  final _fromKey = GlobalKey<FormState>();
  final _imgFormKey = GlobalKey<FormState>();

  var _productDetails = ShoesProduct(
    id: '',
    title: '',
    imgUrl: '',
    description: '',
    price: 0.0,
  );

  @override
  void dispose() {
    _priceFocus.dispose();
    super.dispose();
  }

  void showUrlDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Form(
          key: _imgFormKey,
          child: TextFormField(
             validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please,enter a image url address!';
                    }  else if (value.startsWith('https://')) {
                      return 'Please,enter a correct image url address!';
                    }
                  },
            decoration: const InputDecoration(
              hintText: 'Image Url https://...',
              border: OutlineInputBorder(),
            ),
            onSaved: (newValue) {
              _productDetails = ShoesProduct(
                id: '',
                title: _productDetails.title,
                imgUrl: newValue!,
                description: _productDetails.description,
                price: _productDetails.price,
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
              Color(0xFF47E0A0),
            )),
            onPressed: imgUrlSave,
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  void saveForm() {
    bool isValid = _fromKey.currentState!.validate();
    if (isValid) {
      _fromKey.currentState!.save();
      print(_productDetails.title);
      print(_productDetails.price);
      print(_productDetails.description);
      print(_productDetails.imgUrl);
    }
  }

  void imgUrlSave() {
    bool isimgValid = _imgFormKey.currentState!.validate();
   if(isimgValid){
     _imgFormKey.currentState!.save();
    setState(() {});
    Navigator.of(context).pop();
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adding New Product'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: saveForm,
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: _fromKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please,enter a product name!';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_priceFocus),
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (newValue) {
                    _productDetails = ShoesProduct(
                      id: '',
                      title: newValue!,
                      imgUrl: _productDetails.imgUrl,
                      description: _productDetails.description,
                      price: _productDetails.price,
                    );
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please,enter a price!';
                    } else if (double.tryParse(value) == null) {
                      return 'Please,enter only numbers!';
                    } else if (double.parse(value) <= 0) {
                      return 'Please,enter a correct price!';
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                  ),
                  // focusNode: _priceFocus,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onSaved: (newValue) {
                    _productDetails = ShoesProduct(
                      id: '',
                      title: _productDetails.title,
                      imgUrl: _productDetails.imgUrl,
                      description: _productDetails.description,
                      price: double.parse(newValue!),
                    );
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please,enter a description!';
                    } else if (value.length < 20) {
                      return 'Please,enter at least 20 words!';
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 4,
                  onSaved: (newValue) {
                    _productDetails = ShoesProduct(
                      id: '',
                      title: _productDetails.title,
                      imgUrl: _productDetails.imgUrl,
                      description: newValue!,
                      price: _productDetails.price,
                    );
                  },
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () => showUrlDialog(context),
                  borderRadius: BorderRadius.circular(8),
                  child: Card(
                    margin: EdgeInsets.zero,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      side: BorderSide(color: Colors.grey, width: 1),
                    ),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.7,
                      height: 180,
                      child: _productDetails.imgUrl.isEmpty
                          ? const Center(
                              child: Text('Paste Image Url'),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                _productDetails.imgUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
