import 'package:contentwiz/models/lead.dart';
import 'package:contentwiz/ui/components/PillButton.dart';
import 'package:contentwiz/ui/screens/chat.dart';
import 'package:heroicons/heroicons.dart';
import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:hooks_riverpod/hooks_riverpod.dart';


final searchInputProvider = StateProvider<String>((ref) => "");
final unreadLeadsProvider = StateProvider<List<Lead>>((ref) => []);
final otherLeadsProvider = StateProvider<List<Lead>>((ref) => []);

class Card extends StatelessWidget {
  const Card({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      leading: const CircleAvatar(backgroundImage: AssetImage("assets/img/avatar.png")),
      title: Text("Josiah Zayner", style: Theme.of(context).textTheme.bodyMedium,),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5.0,),
          Text("How are you today ?", style: Theme.of(context).textTheme.displaySmall,),
          const SizedBox(height: 5.0,),
          Text("Assignee: Yogesh Upadhyay", overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodySmall,),
        ],
      ),
      trailing: Text("9:56 AM", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: const Color(0xff6C7072)),),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatPage())),
    );
  }
}

class Inbox extends HookConsumerWidget {
  const Inbox({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // search bar and avatar
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 36.0,
                    child: TextField(
                      onChanged: ((value) => ref.read(searchInputProvider.notifier).state = value),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),                        labelText: 'Search',
                        prefixIcon: const HeroIcon(HeroIcons.magnifyingGlass, color: Colors.black),
                        prefixIconConstraints: const BoxConstraints(maxHeight: 20, maxWidth: 20),
                        prefixIconColor: Colors.black,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        contentPadding: const EdgeInsets.all(10),
                        fillColor: const Color(0xffF2F4F5),
                        filled: true
                      ),
                      textAlignVertical: TextAlignVertical.center,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0,),
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/img/avatar.png"),
                )
              ],
            ),
            const SizedBox(height: 20,),
            // inbox header and write button
            Row(
              children: [
                Expanded(child: Text("Inbox", style: Theme.of(context).textTheme.displayLarge,)),
                PillButton(onPressed: () {}, text: "Write")
              ],
            ),
            const SizedBox(height: 10.0,),
            // messages section
            Expanded(
              child: ListView.builder(
                itemCount: 15,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Card(key: key,);
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
