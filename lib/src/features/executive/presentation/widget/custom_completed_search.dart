import 'package:flutter/material.dart';
import 'package:theraman/src/features/executive/presentation/widget/completed_listview.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';

class CustomCompletedSearch extends SearchDelegate {
  final List<AllotSlots>? allotSlots;
  CustomCompletedSearch({required this.allotSlots});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<AllotSlots> matchQuery = [];
    for (var slot in allotSlots!) {
      if (slot.rSDoctorName!.toLowerCase().contains(query.toLowerCase()) ||
          slot.rSPName!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(slot);
      }
    }
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: matchQuery.length,
          itemBuilder: (context, index) {
            final data = matchQuery[index];
            return CompletedListView(data: data);
          }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<AllotSlots> matchQuery = [];
    for (var slot in allotSlots!) {
      if (slot.rSDoctorName!.toLowerCase().contains(query.toLowerCase()) ||
          slot.rSPName!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(slot);
      }
    }
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: matchQuery.length,
          itemBuilder: (context, index) {
            final data = matchQuery[index];
            return CompletedListView(data: data);
          }),
    );
  }
}
