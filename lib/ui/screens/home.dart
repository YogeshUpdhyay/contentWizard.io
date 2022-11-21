import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:pie_chart/pie_chart.dart';
// ignore: depend_on_referenced_packages
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsSheet extends HookConsumerWidget {
  const SettingsSheet({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // upgrade to premium
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(25.0)
            ),
            child: Expanded(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Premium Memebership", style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.white),),
                      const SizedBox(height: 10.0,),
                      Text("Upgrade for more features", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),)
                    ],
                  ),
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}

class Home extends HookConsumerWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
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
                    onPressed: () => showModalBottomSheet(
                      context: context, 
                      builder: ((context) => const SettingsSheet()),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0)
                      )
                    ),
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
                            children: [
                              Row(
                                children: [
                                  const Text("400"),
                                  const SizedBox(width: 5.0,),
                                  const HeroIcon(HeroIcons.arrowSmallUp, color: Colors.green, size: 16.0,),
                                  const SizedBox(width: 5.0,),
                                  Text("(3.4)", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.green),)
                                ],
                              ),
                              const SizedBox(height: 5.0,),
                              Row(
                                children: [
                                  const Text("375"),
                                  const SizedBox(width: 5.0,),
                                  const HeroIcon(HeroIcons.arrowSmallUp, color: Colors.green, size: 16.0,),
                                  const SizedBox(width: 5.0,),
                                  Text("(3.4)", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.green),)
                                ],
                              ),
                              const SizedBox(height: 5.0,),
                              Row(
                                children: [
                                  const Text("35  "),
                                  const SizedBox(width: 5.0,),
                                  const HeroIcon(HeroIcons.arrowSmallUp, color: Colors.green, size: 16.0,),
                                  const SizedBox(width: 5.0,),
                                  Text("(3.4)", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.green),)
                                ],
                              )
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
    );
  }
}

