import 'package:contentwiz/theme/theme.dart';
import 'package:contentwiz/ui/screens/Setup.dart';
import 'package:contentwiz/ui/screens/WalkThrough.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:pie_chart/pie_chart.dart';
// ignore: depend_on_referenced_packages
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    )
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Content Wizard',
      theme: ThemeData(
        primarySwatch: themeColor,
        fontFamily: "Inter",
        textTheme: textTheme
      ),
      home: const Dashboard(),
      routes:  {
        "/walkthrough":(context) => const WalkThrough(),
        "/setup": (context) =>  const Setup()
      },
    );
  }
}

class Dashboard extends HookConsumerWidget {
  const Dashboard({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // header
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bain & Co.",
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        const Text("Current Project: Default Project")
                      ],
                    ),
                  ),
                  Center(
                    child: IconButton(
                      icon: const HeroIcon(
                        HeroIcons.cog8Tooth,
                        style: HeroIconStyle.solid,
                        size: 32.0,
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20.0,),
              // leads container
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Leads"),
                        const SizedBox(height: 20.0,),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Total", style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w900),),
                                const SizedBox(height: 5.0,),
                                Text("Converted", style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w900),),
                                const SizedBox(height: 5.0,),
                                Text("On Going", style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w900),)
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("400"),
                                SizedBox(height: 5.0,),
                                Text("375"),
                                SizedBox(height: 5.0,),
                                Text("25")
                              ],
                            )
                          ],
                        )
                      ]
                    ),
                  ),
                  const SizedBox(width: 10.0,),
                  Flexible(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Center(
                          child: PieChart(
                            dataMap: <String, double>{
                              "Converted": 1,
                              "On Going": 1
                            },
                            legendOptions: LegendOptions(showLegends: false),
                            chartType: ChartType.ring,
                            chartRadius: 90,
                            chartValuesOptions: ChartValuesOptions(
                              showChartValues: false
                            ),
                            colorList: <Color>[
                              Color(0xff6B4EFF),
                              Color(0xff9990FF)
                            ],
                          )
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        onTap: (value) {},
      ),
    );
  }
}




 