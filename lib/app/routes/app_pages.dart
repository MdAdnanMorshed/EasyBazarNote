import 'package:get/get.dart';

import '../modules/authentication/bindings/authentication_binding.dart';
import '../modules/authentication/views/authentication_view.dart';
import '../modules/bazarItem/bindings/bazar_item_binding.dart';
import '../modules/bazarItem/views/bazar_item_view.dart';
import '../modules/bazarItems/bindings/bazar_items_binding.dart';
import '../modules/bazarItems/views/bazar_items_view.dart';
import '../modules/bookmarkslist/bindings/bookmarkslist_binding.dart';
import '../modules/bookmarkslist/views/bookmarkslist_view.dart';
import '../modules/category/bindings/category_binding.dart';
import '../modules/category/views/category_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/news_details/bindings/news_details_binding.dart';
import '../modules/news_details/views/news_details_view.dart';
import '../modules/subCategory/bindings/sub_category_binding.dart';
import '../modules/subCategory/views/sub_category_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NEWS_DETAILS,
      page: () => const NewsDetailsView(),
      binding: NewsDetailsBinding(),
    ),
    GetPage(
      name: _Paths.AUTHENTICATION,
      page: () => const AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.BOOKMARKSLIST,
      page: () => const BookmarksListView(),
      binding: BookmarkslistBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => const CategoryView(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: _Paths.SUB_CATEGORY,
      page: () => const SubCategoryView(),
      binding: SubCategoryBinding(),
    ),
    GetPage(
      name: _Paths.BAZAR_ITEM,
      page: () => const BazarItemView(),
      binding: BazarItemBinding(),
    ),
    GetPage(
      name: _Paths.BAZAR_ITEMS,
      page: () => const BazarItemsView(),
      binding: BazarItemsBinding(),
    ),
  ];
}
