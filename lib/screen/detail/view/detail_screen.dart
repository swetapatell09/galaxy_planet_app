import 'package:flutter/material.dart';
import 'package:galaxy_planet_app/screen/home/model/home_model.dart';
import 'package:galaxy_planet_app/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  HomeProvider? providerR;
  HomeProvider? providerW;
  PlanetModel? p1;
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
    p1 = ModalRoute.of(context)!.settings.arguments as PlanetModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Detail", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Stack(children: [
        Image.asset("assets/image/p2.gif",
            height: MediaQuery.sizeOf(context).height, fit: BoxFit.cover),
        Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            p1!.name != "Sun"
                ? RotationTransition(
                    turns: controller!,
                    child: Image.network(
                      "${p1!.image}",
                      height: 300,
                      width: 300,
                      fit: BoxFit.cover,
                    ))
                : Image.network(
                    "${p1!.image}",
                    height: 300,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
            Text("${p1!.name}",
                style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                "${p1!.description}",
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
