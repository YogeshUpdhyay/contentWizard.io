import 'package:contentwiz/ui/components/PillButton.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:hooks_riverpod/hooks_riverpod.dart';

final workspaceProvider = StateProvider<String>((ref) => "");
final isTeamDefaultCheckedProvider = StateProvider<bool>((ref) => true);

class Setup extends HookConsumerWidget {
  const Setup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isTeamDefaultChecked = ref.watch(isTeamDefaultCheckedProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                onPressed: () {}
              )
            ],
          ),
        ),
      ),
    );
  }
}
