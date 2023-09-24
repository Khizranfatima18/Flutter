import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:miniproject/colors.dart';
import 'package:miniproject/screens/addToCart/cartModel.dart';
import 'package:miniproject/screens/addToCart/cart_provider.dart';
import 'package:miniproject/screens/addToCart/db_Helper.dart';
import 'package:miniproject/screens/addToCart/items.dart';
import 'package:miniproject/screens/shoppingCart.dart';
import 'package:provider/provider.dart';

class FruitList extends StatefulWidget {
  const FruitList({Key? key});

  @override
  State<FruitList> createState() => _FruitListState();
}

class _FruitListState extends State<FruitList> {
  DBHelper dbHelper = DBHelper(); // Create an instance of DBHelper

  List<Item> products = [
    Item(
        name: 'Mango',
        unit: 'Doz',
        price: 30,
        image: 'assets/Images/mango.png'),
    Item(
        name: 'Banana',
        unit: 'Doz',
        price: 10,
        image: 'assets/Images/banana.png'),
    Item(
        name: 'Grapes',
        unit: 'Kg',
        price: 8,
        image: 'assets/Images/grapes.png'),
    Item(
        name: 'Water Melon',
        unit: 'Kg',
        price: 25,
        image: 'assets/Images/watermelon.png'),
    Item(
        name: 'Orange',
        unit: 'Doz',
        price: 15,
        image: 'assets/Images/orange.png'),
    Item(
        name: 'Strawberry',
        unit: 'Box',
        price: 12,
        image: 'assets/Images/strawberry.png'),
    Item(name: 'Kiwi', unit: 'Box', price: 12, image: 'assets/Images/kiwi.png'),
    Item(
        name: 'Fruit Basket',
        unit: 'Kg',
        price: 55,
        image: 'assets/Images/fruitBasket.png'),
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            size: 20,
            color: Color(0xff1E222B),
          ),
        ),
        title: const Text(
          'Fruits',
          style: TextStyle(
            color: Color(0xff1E222B),
            fontSize: 20,
          ),
        ),
        actions: [
          const Icon(
            Icons.search_off_outlined,
            color: Color(0xff1E222B),
          ),
          const SizedBox(
            width: 20,
          ),
          badges.Badge(
            badgeContent: Consumer<CartProvider>(
              builder: (context, value, child) {
                return Text(
                  value.getCounter().toString(),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold,fontSize: 17),
                );
              },
            ),
            position: badges.BadgePosition.topEnd(top: 2, end: 2),
            badgeStyle: const badges.BadgeStyle(badgeColor: Color(0xffF9B023)),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartScreen()));
              },
              icon: const Icon(
                Icons.shopping_basket_outlined,
                color: Color(0xff1E222B),
                size: 30,
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                crossAxisSpacing: 2.0, // Spacing between columns
                mainAxisSpacing: 2.0, // Spacing between rows
                childAspectRatio: 0.8,
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  elevation: 5.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5.0,
                      ),
                      Image(
                        height: 90,
                        width: 80,
                        image: AssetImage(products[index].image.toString()),
                      ),
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        text: TextSpan(
                          text: 'Name: ',
                          style: TextStyle(
                            color: Colors.blueGrey.shade800,
                            fontSize: 16.0,
                          ),
                          children: [
                            TextSpan(
                              text: '${products[index].name.toString()}\n',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        maxLines: 1,
                        text: TextSpan(
                          text: 'Unit: ',
                          style: TextStyle(
                            color: Colors.blueGrey.shade800,
                            fontSize: 16.0,
                          ),
                          children: [
                            TextSpan(
                              text: '${products[index].unit.toString()}\n',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        maxLines: 1,
                        text: TextSpan(
                          text: 'Price: ' r"$",
                          style: TextStyle(
                            color: Colors.blueGrey.shade800,
                            fontSize: 16.0,
                          ),
                          children: [
                            TextSpan(
                              text: '${products[index].price.toString()}\n',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: screenOneColor,
                        ),
                        onPressed: () {
                          dbHelper
                              .insert(
                            Cart(
                              id: index,
                              productId: index.toString(),
                              productName: products[index].name,
                              initialPrice: products[index].price,
                              productPrice: products[index].price,
                              quantity: ValueNotifier(1),
                              unitTag: products[index].unit,
                              image: products[index].image,
                            ),
                          )
                              .then((value) {
                            cart.addTotalPrice(
                                products[index].price.toDouble());
                            cart.addCounter();
                            print('Product Added to cart');
                          }).onError((error, stackTrace) {
                            print(error.toString());
                          });
                        },
                        child: const Text('Add to Cart'),
                      ),
                    ],
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
