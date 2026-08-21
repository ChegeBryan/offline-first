import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
	const HomePage({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: const Text('Home')),
			body: ListView(
				padding: const EdgeInsets.all(16),
				children: [
					Card(
						child: ListTile(
							contentPadding: const EdgeInsets.all(16),
							leading: const CircleAvatar(child: Text('JD')),
							title: const Text('John Doe', style: TextStyle(fontWeight: FontWeight.bold)),
							subtitle: const Text('john.doe@example.com\nWelcome back!'),
							trailing: IconButton(
								onPressed: () {},
								icon: const Icon(Icons.edit_outlined),
							),
						),
					),
					const SizedBox(height: 24),
					_SectionHeader(title: 'Posts', onViewAll: () {}),
					Card(
						child: Column(
							children: [
								_PostTile(title: 'Getting started with offline-first apps', subtitle: 'Build reliable experiences anywhere.'),
								_PostTile(title: 'A productive day', subtitle: 'Small steps make a difference.'),
								_PostTile(title: 'Notes from the team', subtitle: 'The latest updates are ready to review.'),
							],
						),
					),
					const SizedBox(height: 24),
					_SectionHeader(title: 'Todos', onViewAll: () {}),
					Card(
						child: Column(
							children: [
								CheckboxListTile(value: true, onChanged: (_) {}, title: const Text('Review project updates', style: TextStyle(decoration: TextDecoration.lineThrough))),
								const Divider(height: 1),
								CheckboxListTile(value: false, onChanged: (_) {}, title: const Text('Plan tomorrow’s priorities')),
								const Divider(height: 1),
								CheckboxListTile(value: false, onChanged: (_) {}, title: const Text('Send weekly summary')),
							],
						),
					),
				],
			),
		);
	}
}

class _PostTile extends StatelessWidget {
	const _PostTile({required this.title, required this.subtitle});
	final String title;
	final String subtitle;

	@override
	Widget build(BuildContext context) => ListTile(
				leading: const Icon(Icons.article_outlined),
				title: Text(title),
				subtitle: Text(subtitle),
				trailing: const Icon(Icons.chevron_right),
				onTap: () {},
			);
}

class _SectionHeader extends StatelessWidget {
	const _SectionHeader({required this.title, required this.onViewAll});
	final String title;
	final VoidCallback onViewAll;

	@override
	Widget build(BuildContext context) => Row(
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
				children: [
					Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
					TextButton(onPressed: onViewAll, child: const Text('View all')),
				],
			);
}
