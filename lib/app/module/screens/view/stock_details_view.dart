import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../data/resources/color_resource.dart';
import '../../../data/resources/constant_resource.dart';
import '../../../data/resources/image_resources.dart';
import '../../provider/stock_details_provider.dart';
import '../widgets/common_button.dart';
import '../widgets/local_asset_image.dart';

class StockDetailsView extends StatelessWidget {
  final String symbol;
  final String imgPath;
  const StockDetailsView(
      {super.key, required this.symbol, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StockDetailsProvider>(
      create: (_) => StockDetailsProvider(symbol, imgPath),
      child: Consumer<StockDetailsProvider>(
        builder: (_, stockDetailsProvider, __) => WillPopScope(
          onWillPop: () async {
            Navigator.pop(context);
            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: const Text(
                'Stock Details',
              ),
            ),
            backgroundColor: BLACK,
            body: _mainChild(context, stockDetailsProvider, imgPath, symbol),
          ),
        ),
      ),
    );
  }
}

Widget _mainChild(BuildContext context, StockDetailsProvider provider,
    String imgPath, String symbol) {
  return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Stack(
      children: [
        Column(
          children: [
            //? if symbol list null statement not execute
            //? for avoid null error throw
            if (provider.stockProfileModel != null)
              _stockSymbolRow(context, provider, imgPath),
            //? if chart data null statement not execute
            //? for avoid null error throw
            if (provider.listData != null)
              _historicalChart(context, provider, symbol),
            Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: PAD_8,
                  child: CommonButton(
                      buttonColor: APP_BORDER_GREY,
                      needBorder: true,
                      borderColor: APP_LIGHT_GREY_OPACITY_2,
                      label: 'ADD TO WATCHLIST',
                      isSmall: true,
                      onTap: () {}),
                )),
          ],
        ),
        const LoadingWidget()
      ],
    ),
  );
}

Widget _stockSymbolRow(
        BuildContext context, StockDetailsProvider provider, String imgPath) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          //! image load from url use this
          // CachedNImage(
          //   imagefromNetwork: provider.stockProfileModel!.logo,
          //   fit: BoxFit.contain,
          // ),
          CircleAvatar(
              radius: 30.0,
              backgroundColor: APP_DARK_GREY,
              child: LocalAssetImage(
                assetPath: imgPath,
                height: 40,
                width: 40,
                boxFit: BoxFit.contain,
              )),
          //! if want to set title and subtitle can use global widget
          // titleNSubtitle(context, provider.stockProfileModel?.ticker ?? '',
          //     provider.stockProfileModel?.name ?? '',
          //     titleColor: WHITE, subTitleColor: APP_DARK_GREY),
          SizedBox(
            height: 70,
            child: Column(
              children: [
                SPACING_SMALL_HEIGHT,
                Hero(
                  tag: 'symbol title',
                  child: Text(
                    provider.stockProfileModel?.ticker ?? '',
                    style: h4_dark(context)?.copyWith(color: WHITE),
                  ),
                ),
                SPACING_VVSMALL_HEIGHT,
                Expanded(
                  child: Text(
                    provider.stockProfileModel?.name ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: h4_dark(context)?.copyWith(color: APP_DARK_GREY),
                  ),
                ),
              ],
            ),
          ),
          SPACER,
          if (provider.stockSymbolList != null)
            SizedBox(height: 40, child: _rateNPercentage(context, provider))
        ],
      ),
    );

//? current price and change price percentage UI
Widget _rateNPercentage(BuildContext context, StockDetailsProvider provider) =>
    Column(
      children: [
        RichText(
            text: TextSpan(children: [
          TextSpan(text: '\$', style: h4_dark(context)),
          TextSpan(
              text: provider.stockSymbolList!.c.toString(),
              style: h4_dark(context)?.copyWith(fontSize: 18, color: WHITE))
        ])),
        Row(
          children: [
            LocalAssetImage(
                assetPath:
                    double.parse(provider.stockSymbolList!.changePercentage) >=
                            0
                        ? UP_ICON
                        : DOWN_ICON),
            SPACING_VVSMALL_WIDTH,
            Text(
              '${provider.stockSymbolList!.changePercentage}%',
              style: TextStyle(
                  color: double.parse(
                              provider.stockSymbolList!.changePercentage) >=
                          0
                      ? GREEN
                      : RED),
            ),
          ],
        ),
      ],
    );
//? historical chart UI
Widget _historicalChart(
        BuildContext context, StockDetailsProvider provider, String symbol) =>
    SizedBox(
        height: MediaQuery.of(context).size.height / 1.5,
        child: SfCartesianChart(
          title: ChartTitle(text: '$symbol - 2022'),
          legend: Legend(isVisible: true),
          trackballBehavior: provider.trackballBehavior,
          series: <CandleSeries>[
            CandleSeries<ChartSampleData, DateTime>(
                dataSource: provider.listData!,
                xValueMapper: (ChartSampleData sales, _) => sales.x,
                lowValueMapper: (ChartSampleData sales, _) => sales.low,
                highValueMapper: (ChartSampleData sales, _) => sales.high,
                openValueMapper: (ChartSampleData sales, _) => sales.low,
                closeValueMapper: (ChartSampleData sales, _) => sales.close)
          ],
          primaryXAxis: DateTimeAxis(
              dateFormat: DateFormat.MMM(),
              majorGridLines: const MajorGridLines(width: 0)),
          primaryYAxis: NumericAxis(
              minimum: 70,
              maximum: 130,
              interval: 10,
              numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
        ));

//? loader
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<StockDetailsProvider>();
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
