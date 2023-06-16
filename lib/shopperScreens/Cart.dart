import 'package:flutter/material.dart';
import 'package:my_app/shopperScreens/ChartModel.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.displayLarge),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.amber,
        child: Column(children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(32),
              child: _Catlist(),
            ),
          ),
          const Divider(height: 4, color: Colors.black),
          _CartTotal()
        ]),
      ),
    );
  }
}

class _Catlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.titleLarge;
    var cart = context.watch<CartModel>();
    return ListView.builder(
        itemBuilder: ((context, index) => ListTile(
              title: Text(cart.items[index].name),
              leading: const Icon(Icons.done),
              trailing: IconButton(
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    cart.remove(cart.items[index]);
                  }),
            )),
        itemCount: cart.items.length);
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<CartModel>(
            builder: (context, cart, child) => Text(
              '\$${cart.totalPrice}',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 48),
            ),
          ),
          const SizedBox(width: 24),
          FilledButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Buying not supported yet.')));
              },
              child: const Text('BUY'))
        ],
      )),
    );
  }
}
