import 'package:flutter/material.dart';

import '../models/data.dart' as data;
import '../models/models.dart';
import 'email_widget.dart';
import 'search_bar.dart' as search_bar;

// EmailListView is a StatelessWidget that displays a list of emails.
class EmailListView extends StatelessWidget {
  // constant constructor for EmailListView
  const EmailListView({
    super.key, // key for widget, it is used to uniquely identify a widget
    this.selectedIndex,
    this.onSelected,
    required this.currentUser,
  });

  // final keyword is used to declare a variable that can be assigned only once.
  final int? selectedIndex;
  final ValueChanged<int>? onSelected;
  final User currentUser;

  // symmetric padding is used to provide padding on the top and bottom or left and right
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(
        children: [
          const SizedBox(height: 8),
          search_bar.SearchBar(currentUser: currentUser),
          const SizedBox(height: 8),
          ...List.generate(
            data.emails.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: EmailWidget(
                  email: data.emails[index],
                  onSelected: onSelected != null
                      ? () {
                          onSelected!(index);
                        }
                      : null,
                  isSelected: selectedIndex == index,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
