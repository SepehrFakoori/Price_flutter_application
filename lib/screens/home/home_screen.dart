import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:price_flutter_app/constants/colors.dart';
import 'package:price_flutter_app/data/model/currency.dart';
import 'package:price_flutter_app/screens/home/bloc/home_screen_bloc.dart';
import 'package:price_flutter_app/util/name_tag.dart';
import 'package:price_flutter_app/util/price_label.dart';
import 'package:price_flutter_app/util/symbol_label.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _turns = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeScreenBloc>(
      create: (context) {
        final homeBloc = HomeScreenBloc();
        homeBloc.add(HomeStarted());
        return homeBloc;
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        floatingActionButton: Container(
          width: MediaQuery.sizeOf(context).width,
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
          child: FloatingActionButton(
            backgroundColor: AppColors.blue,
            foregroundColor: AppColors.white,
            onPressed: () {
              setState(() {
                if (_turns == 0.0) {
                  _turns += 1;
                }else if (_turns == 1.0) {
                  _turns = 0;
                }
              });
            },
            child: AnimatedRotation(
              turns: _turns,
              duration: const Duration(seconds: 1),
              child: const Icon(
                CupertinoIcons.refresh_bold,
                size: 40,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SafeArea(
          child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
            builder: (context, state) {
              if (state is HomeSuccess) {
                return CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 20,
                        bottom: 100,
                      ),
                      sliver: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return CardItem(
                              currency: state.currencies[index],
                            );
                          },
                          childCount: state.currencies.length,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.1,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                      ),
                    ),
                  ],
                );
              } else if (state is HomeLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is HomeError) {
                return Center(
                  child: Column(
                    children: [
                      const Text("Something went wrong!"),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<HomeScreenBloc>(context)
                              .add(HomeRefresh());
                        },
                        child: const Text("Try Again"),
                      ),
                    ],
                  ),
                );
              } else {
                throw Exception('Something is wrong!');
              }
            },
          ),
        ),
      ),
    );
  }
}

class CardItem extends StatefulWidget {
  final Currency currency;

  const CardItem({super.key, required this.currency});

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: LottieBuilder.asset("assets/lottie/coin_animation.json"),
                    // child: Image.network(
                    //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQa450_GGvMdMJaW2ilpmX2F1_VN65jYEeanQ&s"),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: Center(
                      child: Text(
                        widget.currency.currencyName.formattedCurrencyLabel
                            .toUpperCase(),
                        style: const TextStyle(
                          color: AppColors.white,
                          // fontSize: 28,
                          fontSize: 17.9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              widget.currency.currencyName.fullName,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Text(
                  widget.currency.price.toInt().withPriceLabel,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                const Text(
                  "IRT",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
