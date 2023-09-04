import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tradetech/app/module/screens/view/stock_details_view.dart';

import '../../../data/resources/color_resource.dart';
import '../../../data/resources/constant_resource.dart';
import '../../../data/resources/image_resources.dart';
import '../../provider/stock_list_provider.dart';
import '../widgets/local_asset_image.dart';
import '../widgets/title_n_subtitle.dart';

class StockListView extends StatelessWidget {
  const StockListView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StockListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Stock List',
        ),
      ),
      backgroundColor: BLACK,
      body: RefreshIndicator(
          onRefresh: () async => await provider.refreshStockList(),
          child: _mainChild(provider, context)),
    );
  }
}

Widget _mainChild(StockListProvider provider, BuildContext context) {
  return Stack(
    children: [_listofStockItems(provider, context), const LoadingWidget()],
  );
}

Widget _listofStockItems(StockListProvider provider, BuildContext context) =>
    SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          _stockSymbols(provider, context),
          _stockData(provider, context),
        ],
      ),
    );

Widget _stockSymbols(StockListProvider provider, BuildContext context) {
  return SizedBox(
    height: 200,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: provider.stockSymbolList.length,
          separatorBuilder: (context, index) => SPACING_SMALL_WIDTH,
          itemBuilder: (context, index) => provider.stockSymbolList.isEmpty
              ? const Text(
                  'No item found',
                  style: TextStyle(color: WHITE),
                )
              : SizedBox(
                  width: 150, child: _symbolRow(index, provider, context))),
    ),
  );
}

Widget _stockData(StockListProvider provider, BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height - 300,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.separated(
          itemCount: provider.stockDataList.length,
          separatorBuilder: (context, index) => SPACING_SMALL_HEIGHT,
          itemBuilder: (context, index) => provider.stockDataList.isEmpty
              ? const Text(
                  'No item found',
                  style: TextStyle(color: WHITE),
                )
              : SizedBox(
                  width: 150, child: _stockDatarow(index, provider, context))),
    ),
  );
}

//? stock symbol UI fetch from api
Widget _symbolRow(int i, StockListProvider provider, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 1000),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return StockDetailsView(
              symbol: provider.symbols[i]['symbolName'],
              imgPath: provider.symbols[i]['symbolPath'],
            );
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return Align(
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
        ),
      );
    },
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: APP_BORDER_GREY, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Padding(
        padding: PAD_12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: APP_LIGHT_GREY_OPACITY_2,
                  child: LocalAssetImage(
                    assetPath: provider.symbols[i]['symbolPath'],
                    height: 20,
                    width: 20,
                  ),
                ),
                SPACING_VVSMALL_WIDTH,
                Text(
                  provider.symbols[i]['symbolName'],
                  style: h4_dark(context)?.copyWith(color: WHITE),
                ),
              ],
            ),
            SPACER,
            Padding(
              padding: PAD_12,
              child: LocalAssetImage(
                  assetPath: double.parse(
                              provider.stockSymbolList[i].changePercentage) >
                          0
                      ? UP_LINE
                      : DOWN_LINE),
            ),
            SPACER,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(text: '\$', style: h4_dark(context)),
                      TextSpan(text: provider.stockSymbolList[i].c.toString())
                    ]))
                  ],
                ),
                Row(
                  children: [
                    LocalAssetImage(
                        assetPath: double.parse(provider
                                    .stockSymbolList[i].changePercentage) >=
                                0
                            ? UP_ICON
                            : DOWN_ICON),
                    SPACING_VVSMALL_WIDTH,
                    Text(
                      '${provider.stockSymbolList[i].changePercentage}%',
                      style: TextStyle(
                          color: double.parse(provider
                                      .stockSymbolList[i].changePercentage) >=
                                  0
                              ? GREEN
                              : RED),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

//? stock data UI fetch from api
Widget _stockDatarow(int i, StockListProvider provider, BuildContext context) {
  return Container(
      decoration: BoxDecoration(
        border: Border.all(color: APP_BORDER_GREY, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          titleNSubtitle(context, 'Symbol', provider.stockDataList[i].symbol),
          titleNSubtitle(
              context, 'Currency', provider.stockDataList[i].currency),
          titleNSubtitle(
              context, 'Description', provider.stockDataList[i].description),
        ],
      ));
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<StockListProvider>();
    if (provider.loading) {
      return const Center(
        child: CircularProgressIndicator(
          color: APP_MAIN_BLUE,
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
