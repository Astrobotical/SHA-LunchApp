import 'package:flutter/material.dart';

class CartLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: 5, // replace with actual cart item count
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.fastfood),
            title: Text('Item ${index + 1}'),
            subtitle: Text('Price: \$10.00'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // remove item from cart
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text('Total: \$50.00'),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: ElevatedButton(
                  onPressed: () {
                    // proceed to checkout
                  },
                  child: Text('Checkout'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}