import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class TestQuery extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestQuery();
  }
}

class _TestQuery extends State<TestQuery> {
  //
  String readRepositories = """
query {
  productCategories {
    edges {
      node {
        id
        databaseId
        name
        products {
          edges {
            node {
              databaseId
              id
              name
              description
              image {
                id
                uri
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Query(
        options: QueryOptions(
          document: gql(
              readRepositories), // this is the query string you just created
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
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
            return const Text('Loading');
          }

          List? repositories = result.data?['productCategories']?['edges'];
          print("La reponse du serveur: $repositories");
          if (repositories == null) {
            return const Text('No repositories');
          }

          return ListView.builder(
              itemCount: repositories.length,
              itemBuilder: (context, index) {
                final repository = repositories[index]["node"];

                return Text(repository['name'] ?? '');
              });
        },
      ),
    );
  }
}
