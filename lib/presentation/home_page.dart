import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:yellowcat/domain/models/app_state.dart';
import 'package:yellowcat/domain/models/cart.dart';
import 'package:yellowcat/presentation/common/actions/actions.dart';
import 'package:yellowcat/presentation/common/actions/overlay_state_mixin.dart';
import 'package:yellowcat/presentation/common/constants.dart';
import 'package:yellowcat/presentation/selectors/selectors.dart';
import 'package:yellowcat/presentation/widgets/cart_overlay.dart';
import 'package:yellowcat/presentation/widgets/home_grid_view_item.dart';
import 'package:yellowcat/presentation/widgets/indicators.dart';
import 'package:yellowcat/presentation/widgets/option_item.dart';
import 'package:yellowcat/presentation/widgets/yellow_cat_item_list.dart';
import 'common/colors.dart' as colors;
import 'common/utils.dart';
import 'common/assets.dart' as assets;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with OverlayStateMixin {
  late PageController _pageController;

  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: currentIndex);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _dispatchWithIndex(int index, Store<AppState> store) {
    store.dispatch(AddProductToCartAction(CartProduct(
        quantitie: 1, product: productSelector(store.state)[index])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.iceBlue,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.responsiveWidth(185)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: context.responsiveHeight(220),
                        child: Row(
                          children: [
                            const SizedBox(width: 200, child: TextField()),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: context.responsiveWidth(126),
                              ),
                              child: Image.asset(
                                assets.yellowCat,
                                fit: BoxFit.fill,
                                height: context.responsiveHeight(170),
                                width: context.responsiveWidth(270),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: context.responsiveHeight(81)),
                                  child: Container(
                                    height: 30,
                                    width: 230,
                                    color: colors.purple,
                                    child: Row(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        const SizedBox(
                                          width: 26,
                                        ),
                                        const Icon(
                                          Icons.add_shopping_cart,
                                          color: colors.white,
                                        ),
                                        StoreConnector<AppState, Cart>(
                                            converter: (store) =>
                                                cartSelector(store.state),
                                            builder: (context, cart) {
                                              return Text(
                                                'CARRINHO (${cart.cartProduct.length}) R\$${cart.total}',
                                                style: const TextStyle(
                                                    color: colors.white),
                                              );
                                            }),
                                        const SizedBox(
                                          width: 26,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: context.responsiveHeight(50),
                        decoration: BoxDecoration(
                            color: colors.gold,
                            border: Border.all(color: colors.goldBorder)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text('INÍCIO'),
                            const Text('PRODUTOS'),
                            const Text('CONTATO'),
                            const Text('CLUB DE DESCONTO YELLOW'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: context.responsiveHeight(10),
                      ),
                      SizedBox(
                        height: context.responsiveHeight(440),
                        child: PageView.builder(
                          itemCount: photosList.length,
                          controller: _pageController,
                          onPageChanged: (page) {
                            setState(() {
                              currentIndex = page;
                            });
                          },
                          itemBuilder: (context, index) {
                            return Image.asset(
                              photosList[index],
                              fit: BoxFit.fill,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: context.responsiveHeight(20),
                      ),
                      Indicators(
                          currentIndex: currentIndex,
                          imagesLenght: photosList.length),
                      SizedBox(
                        height: context.responsiveHeight(100),
                      ),
                      const YellowCatItemList(),
                      SizedBox(
                        height: context.responsiveHeight(85),
                      ),
                      Container(
                        width: context.responsiveWidth(980),
                        height: context.responsiveHeight(50),
                        decoration: const BoxDecoration(
                          color: colors.white,
                        ),
                        child: const Center(
                          child: Text(
                            'ESCREVA SOBRE A SUA MARCA',
                            style: TextStyle(
                                color: colors.darkGray,
                                fontSize: 20,
                                fontWeight: FontWeight.w900),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: context.responsiveHeight(20),
                      ),
                      SizedBox(
                          height: context.responsiveHeight(750),
                          child: StoreConnector<AppState, Store<AppState>>(
                              converter: (store) => store,
                              builder: (context, store) {
                                return GridView.count(
                                  crossAxisCount: 4,
                                  childAspectRatio:
                                      (context.responsiveWidth(224) /
                                          context.responsiveHeight(340)),
                                  controller:
                                      ScrollController(keepScrollOffset: true),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: List<Widget>.generate(
                                      productSelector(store.state).length,
                                      (index) => HomeGridViewItem(
                                          product: productSelector(
                                              store.state)[index],
                                          onClick: () {
                                            _dispatchWithIndex(index, store);
                                            toggleOverlay(const CartOverlay());
                                            // _showCartOverlay(context);
                                          })),
                                );
                              })),
                      Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: context.responsiveHeight(40),
                            width: context.responsiveWidth(310),
                            color: colors.purple,
                            child: const Center(
                              child: Text(
                                'VER TODOS OS PRODUTOS',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: context.responsiveHeight(50),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              assets.instaIcon,
                              height: context.responsiveHeight(50),
                              color: colors.darkGray,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text(
                                    'SIGA-NOS NO INSTAGRAN',
                                    style: TextStyle(
                                        fontSize: 12, color: colors.darkGray),
                                  ),
                                  const Text(
                                    '@CATSHOPYELLOWCAT',
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: colors.darkGray,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: context.responsiveHeight(13),
                      ),
                      Container(
                        width: context.responsiveWidth(980),
                        decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(color: colors.darkGray))),
                      ),
                      SizedBox(height: context.responsiveHeight(80)),
                      const YellowCatItemList(),
                      SizedBox(height: context.responsiveHeight(80)),
                    ],
                  ),
                ),
                Container(
                  height: context.responsiveHeight(260),
                  color: colors.bottomGold,
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: context.responsiveWidth(185),
                        left: context.responsiveWidth(185),
                        top: context.responsiveHeight(35)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('NAVEGAÇÃO'),
                            const Text('Início'),
                            const Text('Produtos'),
                            const Text('Contato'),
                            const Text('Clube de Desconto'),
                            const Text('Yellow'),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('FORMAS DE PAGAMENTO'),
                            SizedBox(
                              width: context.responsiveWidth(200),
                              height: context.responsiveHeight(120),
                              child: GridView.count(
                                crossAxisCount: 4,
                                childAspectRatio: context.responsiveWidth(40) /
                                    context.responsiveHeight(30),
                                mainAxisSpacing: 1,
                                children: List<Widget>.generate(
                                    paymentMethods.length,
                                    (index) => Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10, right: 9),
                                          child: Image.asset(
                                              paymentMethods[index]),
                                        )),
                              ),
                            ),
                            const Text('FORMAS DE ENVIO'),
                            SizedBox(
                              width: context.responsiveWidth(200),
                              height: context.responsiveHeight(35),
                              child: GridView.count(
                                crossAxisCount: 3,
                                childAspectRatio: context.responsiveWidth(40) /
                                    context.responsiveHeight(30),
                                mainAxisSpacing: 1,
                                children: List<Widget>.generate(
                                    sendMethods.length,
                                    (index) => Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 10, right: 9),
                                          child:
                                              Image.asset(sendMethods[index]),
                                        )),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('REDES SOCIAIS'),
                            Row(
                              children: [],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
