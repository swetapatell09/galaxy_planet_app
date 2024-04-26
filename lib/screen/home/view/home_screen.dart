import 'package:flutter/material.dart';
import 'package:galaxy_planet_app/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  HomeProvider? providerR;
  HomeProvider? providerW;
  AnimationController? controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    context.read<HomeProvider>().getData();
    controller!.repeat();
    controller!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Planets",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                providerR!.setTheme();
              },
              icon: Icon(providerW!.themeMode))
        ],
      ),
      body: Stack(children: [
        Image.asset("assets/image/p1.gif",
            height: MediaQuery.sizeOf(context).height, fit: BoxFit.cover),
        GridView.builder(
          itemCount: providerW!.list.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'detail',
                    arguments: providerR!.list[index]);
              },
              child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        index != 8
                            ? RotationTransition(
                                turns: controller!,
                                child: Image.network(
                                  "${providerW!.list[index].image}",
                                  height: index == 5 ? 100 : 150,
                                  width: index == 5 ? 100 : 150,
                                ),
                              )
                            : Image.network(
                                "${providerW!.list[index].image}",
                                height: index == 5 ? 100 : 150,
                                width: index == 5 ? 100 : 150,
                              ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${providerW!.list[index].name}",
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )),
            );
          },
        ),
      ]),
    );
  }
}
