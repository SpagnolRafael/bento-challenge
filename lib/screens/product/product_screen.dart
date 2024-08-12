import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.id});
  final String id;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.grey[200], shape: BoxShape.circle),
                      child: const Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.grey[200], shape: BoxShape.circle),
                    child: const Icon(Icons.favorite_border),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Placeholder(),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 80,
                  height: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    child: Text('Organic fresh Green Cabbage',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[200]!, width: .6),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star, size: 20, color: Colors.yellow[700]),
                        const SizedBox(width: 4),
                        const Text('4.5',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                'Shop: Alisha Mart',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[100],
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            height: 45,
                            width: 45,
                            decoration: const BoxDecoration(
                                color: Color(0xffC7F4C5),
                                shape: BoxShape.circle),
                            child: const Center(child: Icon(Icons.abc)),
                          ),
                          const SizedBox(height: 6),
                          const Text('Vegetarian'),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            height: 45,
                            width: 45,
                            decoration: const BoxDecoration(
                                color: Color(0xffF1F0C0),
                                shape: BoxShape.circle),
                            child: const Center(child: Icon(Icons.abc)),
                          ),
                          const SizedBox(height: 6),
                          const Text('Halal Food'),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            height: 45,
                            width: 45,
                            decoration: const BoxDecoration(
                                color: Color(0xffC4F1F4),
                                shape: BoxShape.circle),
                            child: const Center(child: Icon(Icons.abc)),
                          ),
                          const SizedBox(height: 6),
                          const Text('Gluten-free'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text(
                'Cabbage is a leafy green, red (purple), or white (pale green) biennial plant grown as an annual vegetable crop for its dense-leaved heads. It is descended from the wild cabbage, and belongs to the "cole crops" or brassicas, meaning it is closely related to broccoli and cauliflower; Brussels sprouts; and Savoy cabbage.',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              Divider(height: 32, color: Colors.grey[200]),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Price',
                          style: TextStyle(fontWeight: FontWeight.w300)),
                      Row(
                        children: [
                          const Text('\$6.90',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          const SizedBox(width: 8),
                          Text('\$8.90',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.grey[400],
                                  decoration: TextDecoration.lineThrough)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 32),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xff55E39F),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
