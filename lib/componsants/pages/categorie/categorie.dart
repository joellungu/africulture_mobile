import 'package:africulture_mobile/componsants/widgets/carte_produit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'categorie_controller.dart';
import 'liste_categorie.dart';
//import 'package:get/get.dart';

class Categories extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Categories();
  }
}

class _Categories extends State<Categories> with TickerProviderStateMixin {
  CategorieController categorieController = Get.find();

  late TabController controller = TabController(
      length: categorieController.listecat.value.length, vsync: this);

  @override
  void initState() {
    //
    controller = TabController(
        // ignore: invalid_use_of_protected_member
        length: categorieController.listecat.value.length,
        vsync: this);
    //
    super.initState();
    //
  }

  String requete = """
query getProduct {
  productCategories {
    edges {
      node {
        id
        databaseId
        name
        image {
          uri
        }
        products {
          edges {
            node {
              databaseId
              id
              name
                ... on SimpleProduct {
                id
                name
                price(format: RAW)
                }
              description
              image {
                id
                uri
                mediaItemId
                sourceUrl
              }
            }
          }
        }
      }
    }
  }
}""";

  //
  @override
  Widget build(BuildContext context) {
    //categorieController.getCategorie();

    return Query(
      options: QueryOptions(
        document: gql(requete), // this is the query string you just created
        // variables: {
        //   //'nRepositories': 50,
        // },
        // pollInterval: const Duration(seconds: 10),
      ),
      // Just like in apollo refetch() could be used to manually trigger a refetch
      // while fetchMore() can be used for pagination purpose
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "categorie".tr,
              ),
            ),
            body: Text('${result.exception.toString()}'),
          );
        }

        if (result.isLoading) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "categorie".tr,
              ),
            ),
            body: const Center(
              child: SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }

        List? repositories = result.data?['productCategories']?['edges'];

        //print("La reponse du serveur: $repositories");
        if (repositories == null) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "categorie".tr,
              ),
            ),
            body: Text('Vide'),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(
              "categorie".tr,
            ),
            //backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            // flexibleSpace: Container(
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //       begin: Alignment.centerLeft,
            //       end: Alignment.centerRight,
            //       colors: <Color>[Colors.yellow.shade700, Colors.black],
            //     ),
            //   ),
            // ),
            bottom: TabBar(
              isScrollable: true,
              controller: controller,
              indicatorWeight: 1,
              labelStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
              //indicator: BoxDecoration(),
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.green.shade700,
              unselectedLabelColor: Colors.grey.shade800,
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
              tabs: List.generate(repositories.length, (index) {
                return Tab(
                  text: "${repositories[index]["node"]["name"]}".tr,
                );
              }),
            ),
          ),
          body: TabBarView(
            controller: controller,
            children: List.generate(
              categorieController.listecat.value.length,
              (index) {
                List produits =
                    repositories[index]["node"]["products"]["edges"];
                return GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  childAspectRatio: 0.5,
                  children: List.generate(
                    produits.length,
                    (index) => Card(
                      elevation: 0,
                      child: InkWell(
                          onTap: () {
                            //Get.to(() => Produit());
                          },
                          child: CarteProduite(produits[index], true)),
                    ),
                  ),
                );
              },
            ),
          ),
        );
        ListView.builder(
            itemCount: repositories.length,
            itemBuilder: (context, index) {
              final repository = repositories[index]["node"];

              return Text(repository['name'] ?? '');
            });
      },
    );
  }
}

/*
SousCategorie
 */

/*
Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5),
              ),
              alignment: Alignment.center,
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
            ),
            // Expanded(
            //   flex: 1,
            //   child: GridView.count(
            //     crossAxisCount: 2,
            //     mainAxisSpacing: 2,
            //     crossAxisSpacing: 2,
            //     childAspectRatio: 0.6,
            //     children: List.generate(
            //       categorieController.listecat.value.length,
            //       (index) =>
            //           CarteCategorie(categorieController.listecat[index]),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
List.generate(
                categorieController.listecat.length, (index) => Container()
                //CarteCategorie(categorieController.listecat[index]),
                ),
*/
