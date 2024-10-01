import 'package:flutter/material.dart';
import 'package:spintech/utils/contants/image_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List category = ['All', 'Jackets', 'Jeans', 'Shoes', 'Suervette'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          leadingWidth: 200,
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome Back!",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10),
                ),
                Text("Falcon Thought",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                )
              ],
            ),
          ),
          actions: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: .8)
              ),
              child: Image.asset(AppImage.item1),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: const Color(0xffF6F6F6),
                borderRadius: BorderRadius.circular(30)
              ),
              child: const Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'What are you looking for...'
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xffD9D9D9),
                borderRadius: BorderRadius.all(Radius.circular(12))
              ),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Shop wit us!",
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                      const Text("Get 40% Off for \nall iteams",
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Row(
                          children: [
                            Text("Shop Now",
                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                            ),
                            Icon(Icons.arrow_forward)
                          ],
                        ),
                      ),
                    ],
                  ),
                  Image.asset(AppImage.man3, height: 130)
                ],
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  category.length, 
                  (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Container(
                    // ignore: prefer_const_constructors
                    padding: const EdgeInsets.all(15),
                    // ignore: prefer_const_constructors
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: index == 0 ? Colors.white : const Color(0xffF6F6F6)
                    ),
                    child: Text('${category[index]}',
                      style: const TextStyle(color: Color(0xff061023), fontWeight: FontWeight.w500, fontSize: 12),
                    ),
                  )
                )
                ),
              ),
            ),
            const SizedBox(height: 16),

          ],
        ),
      ),
    );
  }
}