import 'package:flutter/material.dart';
import 'package:pizza_izza/style/style.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          pinned: true,
          snap: true,
          floating: true,
          expandedHeight: 200.0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border:
                      Border(bottom: BorderSide(width: 1, color: Colors.grey))),
              padding: EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              height: 40,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        child: Text('BBQ', style: categoryStyle()),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      OutlinedButton(
                        child: Text('Неаполитанская пицца',
                            style: categoryStyle()),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      OutlinedButton(
                        child:
                            Text('Сицилийская пицца', style: categoryStyle()),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      OutlinedButton(
                        child: Text('Супы', style: categoryStyle()),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      OutlinedButton(
                        child: Text('Закуски', style: categoryStyle()),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      OutlinedButton(
                        child: Text('Напитки', style: categoryStyle()),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              'assets/pizza_logo_menu.png',
              scale: 4,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 10,
            (BuildContext context, int index) {
              return GestureDetector(
                // onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => TravelPage(travelById: travel))),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  height: 150.0,
                  child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/pizza.png',
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Пицца Маргарита",
                                  style: pizzaTitleStyle(),
                                ),
                                Container(
                                    padding: EdgeInsets.symmetric(vertical: 7),
                                    width: 190,
                                    child: Text(
                                      "томатный соус, моцарелла, базилик, пармезан, еще что-то",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                Container(
                                  width: 190,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text('550 ₽'),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.orange),
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.fromLTRB(40, 12, 40, 12)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
