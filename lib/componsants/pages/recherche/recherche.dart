import 'package:africulture_mobile/componsants/widgets/carte_produit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'recherche_controller.dart';

class Recherche extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Recherche();
  }
}

class _Recherche extends State<Recherche> {
  List filtres = [
    "Art",
    "Vetements",
    "Gastronomie",
    "Nourriture",
    "Cosmetique",
    "Mobilier",
    "Décoration",
    "Autre"
  ];

  Widget? resulta;

  load(String mot) async {
    String requete = """query SearchProduct {
  __typename
  products(where: {search: "$mot"}) {
    edges {
      node {
        id
        databaseId
        name
      }
    }
  }
}""";
    setState(() {
      resulta = Query(
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
            return Center(
              child: SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(),
              ),
            );
          }

          List? repositories = result.data?['productCategories']?['edges'];

          //print("La reponse du serveur: $repositories");
          if (repositories == null) {
            return Center(
              child: Text('Vide'),
            );
          }

          List produits = [];

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
      );
    });
  }

  @override
  void initState() {
    //
    super.initState();
    resulta = Container();
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "recherche".tr,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 10,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5),
              ),
              alignment: Alignment.center,
              child: TextField(
                onSubmitted: (r) {
                  //controller.getProduits(r);
                  load(r);
                  //
                  print(r);
                },
                textInputAction: TextInputAction.search,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: resulta!,
            )
          ],
        ),
      ),
    );
  }
}
