import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:my_workshop/view/home_view.dart';

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  List<TabItem> items = [
    TabItem(
      icon: Icons.home,
      title: 'Home',
    ),
    TabItem(
      icon: Icons.search_sharp,
      title: 'Shop',
    ),
    TabItem(
      icon: Icons.people,
      title: 'Profile',
    ),
  ];

  List<Widget> pages = [
    HomeView(),
    Text("Page2"),
    Text("Page3"),
  ];

  int visit = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _key.currentState!.openDrawer();
          },
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              color: Colors.deepOrangeAccent,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            ClipRRect(
              borderRadius: BorderRadius.circular(90),
              child: Image.network(
                "https://static.toiimg.com/thumb/msid-67586673,width-1070,height-580,imgsize-3918697,resizemode-6,overlay-toi_sw,pt-32,y_pad-40/photo.jpg",
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Menu1"),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Menu2"),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Menu3"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(child: pages[visit]),
      bottomNavigationBar: BottomBarInspiredOutside(
        items: items,
        backgroundColor: Colors.black.withOpacity(0.05),
        color: Colors.black,
        colorSelected: Colors.white,
        indexSelected: visit,
        elevation: 0,
        onTap: (int index) => setState(() {
          visit = index;
        }),
        animated: false,
        itemStyle: ItemStyle.circle,
        chipStyle: const ChipStyle(
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          color: Colors.orange,
          background: Colors.deepOrangeAccent,
        ),
      ),
    );
  }
}
