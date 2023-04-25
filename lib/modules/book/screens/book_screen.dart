import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:trading_app/generated/l10n.dart';
import 'package:trading_app/modules/book/bloc/book_cubit.dart';
import 'package:trading_app/modules/book/bloc/book_state.dart';
import 'package:trading_app/modules/book/widgets/book_item.dart';
import '../../../common/theme/colors.dart';
import '../../../di/injection.dart';
import '../../../models/pagination.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/drawer.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double padding = 10;
    int countItems = 2;
    double widthItem = (widthScreen - (countItems + 1) * padding) / countItems;
    double heightImg = widthItem;
    double heightText = 18.0;
    double heightItem = heightImg + 5 + heightText;
    return Scaffold(
      drawer: const DrawerApp(),
      appBar: AppBarUI(title: S.of(context).book, isEnableDrawer: true)
          .build(context),
      body: BlocProvider<BookCubit>(
        create: (_) => getIt<BookCubit>()..fetchItems(),
        child: BlocBuilder<BookCubit, BookState>(
            builder: (BuildContext context, BookState state) {
          if ([
            DataSourceStatus.initial,
            DataSourceStatus.refreshing,
            DataSourceStatus.loading
          ].contains(state.status)) {
            return const Center(
                child: SpinKitWave(
              color: kPrimaryColor,
              size: 20.0,
            ));
          }
          return Padding(
            padding: EdgeInsets.all(padding),
            child: GridView.count(
                crossAxisCount: countItems,
                childAspectRatio: widthItem / heightItem,
                crossAxisSpacing: padding,
                mainAxisSpacing: padding,
                children: List.generate(state.books?.length ?? 0, (index) {
                  return BookItem(
                    book: state.books![index],
                    widthItem: widthItem,
                    heightText: heightText,
                  );
                })),
          );
        }),
      ),
    );
  }
}
