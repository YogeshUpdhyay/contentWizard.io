import 'package:contentwiz/ui/components/PillButton.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:hooks_riverpod/hooks_riverpod.dart';

final workspaceProvider = StateProvider<String>((ref) => "");
final isTeamDefaultCheckedProvider = StateProvider<bool>((ref) => true);
final teamProvider = StateProvider<List<String>>((ref) => [],);
final teammateEmailProvider = StateProvider<String>((ref) => "");

class Setup extends HookConsumerWidget {
  const Setup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isTeamDefaultChecked = ref.watch(isTeamDefaultCheckedProvider);

    void onContinue() {
      if (isTeamDefaultChecked) {
        // continue with API call and add
        // team and workspace
      }
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SetupTeam())
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0,),
              const LinearProgressIndicator(
                value: 0.5,
              ),
              const SizedBox(height: 10,),
              Text(
                "Create a Workspace",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 10,),
              Text(
                "Create your first workspace to start your journey!",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 20,),
              TextField(
                onChanged: (value) => ref.read(workspaceProvider.notifier).state = value, 
                onSubmitted: (value) {
                  ref.read(workspaceProvider.notifier).state = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: isTeamDefaultChecked, 
                    onChanged: (value) => ref.read(isTeamDefaultCheckedProvider.notifier).state = value!,
                    activeColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)
                    ),
                  ),
                  Text(
                    "Create team with default settings.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
              const Spacer(),
              PillButton(
                text: "Continue", 
                onPressed: onContinue
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SetupTeam extends HookConsumerWidget {
  const SetupTeam({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context), 
                icon: const Icon(Icons.arrow_back)
              ),
              const SizedBox(height: 10.0,),
              Text(
                "Invite teammates",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 10.0,),
              TextField(
                onChanged: ((value) => ref.read(teammateEmailProvider.notifier).state = value),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                )
              ),
              const Spacer(),
              PillButton(
                onPressed: () {}, 
                text: "Continue"
              )
            ],
          ),
        ),
      ),
    );
  }
}
