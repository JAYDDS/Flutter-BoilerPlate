import 'package:api_handler/core/services/local_storage_service.dart';
import 'package:flutter_boilerplate/core/exports/common_exports.dart';

class SearchBarWidget extends StatelessWidget {
  final Function(SearchController controller, String value)? onSuggestionTap;
  final bool? isFullScreen;

  const SearchBarWidget({Key? key, this.onSuggestionTap, this.isFullScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchAnchor.bar(
      barElevation: MaterialStateProperty.all(0),
      isFullScreen: isFullScreen,
      viewElevation: 0,
      viewBackgroundColor: ColorConstants.scaffoldColor,
      dividerColor: ColorConstants.scaffoldColor,
      barBackgroundColor: MaterialStateProperty.all(ColorConstants.greyLightColor),
      viewConstraints: const BoxConstraints(maxHeight: 200),
      suggestionsBuilder: (context, controller) {
        List<String> historyList = SharedPrefService.getSearchHistory;
        return List<ListTile>.generate(5, (int index) {
          final String item = 'item $index';
          return ListTile(
              title: Text(item),
              onTap: () {
                onSuggestionTap!(controller, item);
                historyList.add(item);
                SharedPrefService.saveSearchHistory(historyList);
              });
        });
      },
    );
  }
}
