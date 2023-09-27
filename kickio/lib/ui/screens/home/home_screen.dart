import 'package:kickio/tools/file_importer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(
      context,
      listen: true,
    );
    final shoesList = productsData.shoesList;

    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kickio'),
        leading: Stack(
          alignment: Alignment.centerRight,
          children: [
            Image.asset('assets/logo/notext.png'),
          ],
        ),
        leadingWidth: 70,
        actions: [
          Consumer(
            builder: (context, value, child) => CustomCart(
              icon: SvgPicture.asset('assets/images/icon_cart.svg',
                  // ignore: deprecated_member_use
                  color: Colors.black),
              number: cart.itemsCount().toString(),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: HeadContainer(),
          ),
          const SliverToBoxAdapter(
            child: ListPopularItem(),
          ),
          const SliverToBoxAdapter(
            child: SectionTitle(),
          ),
          SliverGrid.builder(
            itemBuilder: (ctx, i) => ChangeNotifierProvider<ShoesProduct>.value(
              value: shoesList[i],
              child: const NewestContainer(),
            ),
            itemCount: shoesList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
          ),
        ],
        controller: ScrollController(),
      ),
    );
  }
}
