import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/settings_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Consumer<SettingsProvider>(
        builder: (context, settings, child) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Card(
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('Dark Mode'),
                      subtitle: const Text('Toggle dark/light theme'),
                      trailing: Switch(
                        value: settings.isDarkMode,
                        onChanged: (value) => settings.toggleTheme(),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text('Show Completed Tasks'),
                      subtitle: const Text('Display completed tasks in main list'),
                      trailing: Switch(
                        value: settings.showCompletedTasks,
                        onChanged: (value) => settings.toggleShowCompletedTasks(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('Sort Tasks By'),
                      subtitle: Text(settings.sortBy.name),
                      trailing: PopupMenuButton<SortBy>(
                        onSelected: (SortBy value) {
                          settings.setSortBy(value);
                        },
                        itemBuilder: (BuildContext context) {
                          return [
                            const PopupMenuItem(
                              value: SortBy.creationDate,
                              child: Text('Creation Date'),
                            ),
                            const PopupMenuItem(
                              value: SortBy.title,
                              child: Text('Title'),
                            ),
                            const PopupMenuItem(
                              value: SortBy.status,
                              child: Text('Status'),
                            ),
                          ];
                        },
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text('Sort Direction'),
                      subtitle: Text(settings.sortAscending ? 'Ascending' : 'Descending'),
                      trailing: IconButton(
                        icon: Icon(
                          settings.sortAscending
                              ? Icons.arrow_upward
                              : Icons.arrow_downward,
                        ),
                        onPressed: () => settings.toggleSortDirection(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: ListTile(
                  title: const Text('Clear All Tasks'),
                  subtitle: const Text('Remove all tasks from the app'),
                  trailing: const Icon(Icons.delete_forever),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Clear All Tasks'),
                        content: const Text(
                          'Are you sure you want to remove all tasks? This action cannot be undone.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),
                          FilledButton(
                            onPressed: () {
                              // TODO: Implement clear all tasks functionality
                              Navigator.pop(context);
                            },
                            child: const Text('Clear All'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              const AboutListTile(
                icon: Icon(Icons.info),
                applicationName: 'Task Manager',
                applicationVersion: '1.0.0',
                applicationLegalese: '© 2024 Your Name',
                aboutBoxChildren: [
                  SizedBox(height: 16),
                  Text(
                    'A simple and efficient task management application built with Flutter.',
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}