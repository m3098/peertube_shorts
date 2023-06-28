import 'package:flutter/material.dart';
import 'view.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isLogin = true;
  bool isVisible = true;

  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.blue,
    Colors.green,
  ];

  @override
  Widget build(BuildContext context) {
    return isLogin
        ? SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    children: [
                      Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          border: Border.all(width: 5.0, color: Colors.white),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://loremflickr.com/720/1080?99"),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(height: 8),
                          Text(
                            "@qwe_543534ccc",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "12.3k",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            "subs",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FilledButton(
                                  onPressed: () {}, child: Text("Subscribe")),
                              SizedBox(width: 8),
                              FilledButton(
                                  onPressed: () {},
                                  child: Icon(Icons.favorite)),
                            ],
                          ),
                          SizedBox(height: 16),
                          Text(
                              "My best channel eqrferwgwr rt r wt wr we gwe ger etewqrwf wqeqweqw "),
                        ],
                      )
                    ],
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: colors.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          color: colors[index],
                          margin: const EdgeInsets.all(2.0),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("123.3"),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          )
        : AuthScreen();
  }
}
