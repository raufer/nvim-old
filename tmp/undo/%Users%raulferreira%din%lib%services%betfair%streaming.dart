Vim�UnDo�  �,��?��ʲui���	B��P+:���P   1                                   d�,�    _�                             ����                                                                                                                                                                                                                                                                                                                                                             d�*M    �                   �               5��                   �                      i      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             d�*O    �                  5��                                                  5�_�                            ����                                                                                                                                                                                                                                                                                                                                       �           V        d�*U    �              �   import 'dart:convert';       <import 'package:din/models/betfair/competition_result.dart';   6import 'package:din/models/betfair/event_result.dart';   4import 'package:din/models/betfair/event_type.dart';   5import 'package:din/models/betfair/market_book.dart';   :import 'package:din/models/betfair/market_catalogue.dart';   7import 'package:din/models/betfair/market_filter.dart';   ;import 'package:din/models/betfair/market_projection.dart';   5import 'package:din/models/betfair/market_sort.dart';   5import 'package:din/models/betfair/market_type.dart';   :import 'package:din/models/betfair/match_projection.dart';   :import 'package:din/models/betfair/order_projection.dart';   4import 'package:din/models/betfair/price_data.dart';   :import 'package:din/models/betfair/price_projection.dart';   2import 'package:din/services/betfair/shared.dart';   (import 'package:http/http.dart' as http;           �Future<List<EventTypeResult>> listEventTypes(String appKey, String sessionToken, {MarketFilter marketFilter = const MarketFilter()}) async {   I  var url = Uri.https('api.betfair.com', 'exchange/betting/json-rpc/v1');         var body = json.encode({       'jsonrpc': '2.0',   0    'method': 'SportsAPING/v1.0/listEventTypes',       'params': {'filter': {}},       'id': 1     });       !  var response = await http.post(       url, body: body,   .    headers: makeHeaders(appKey, sessionToken)     );       #  if (response.statusCode == 200) {   *    var data = json.decode(response.body);   [    return data['result'].map<EventTypeResult>((e) => EventTypeResult.fromMap(e)).toList();   
  } else {   ^    throw Exception('Request failed. Status code: ${response.statusCode} : ${response.body}');     }   }           �Future<List<CompetitionResult>> listCompetitions(String appKey, String sessionToken, {MarketFilter marketFilter = const MarketFilter()}) async {   I  var url = Uri.https('api.betfair.com', 'exchange/betting/json-rpc/v1');         var body = json.encode({       'jsonrpc': '2.0',   2    'method': 'SportsAPING/v1.0/listCompetitions',   /    'params': {'filter': marketFilter.toMap()},       'id': 1     });       !  var response = await http.post(       url, body: body,   .    headers: makeHeaders(appKey, sessionToken)     );       #  if (response.statusCode == 200) {   *    var data = json.decode(response.body);   _    return data['result'].map<CompetitionResult>((e) => CompetitionResult.fromMap(e)).toList();   
  } else {   ^    throw Exception('Request failed. Status code: ${response.statusCode} : ${response.body}');     }   }           �Future<List<EventResult>> listEvents(String appKey, String sessionToken, {MarketFilter marketFilter = const MarketFilter()}) async {   I  var url = Uri.https('api.betfair.com', 'exchange/betting/json-rpc/v1');         var body = json.encode({       'jsonrpc': '2.0',   ,    'method': 'SportsAPING/v1.0/listEvents',   /    'params': {'filter': marketFilter.toMap()},       'id': 1     });       !  var response = await http.post(       url, body: body,   .    headers: makeHeaders(appKey, sessionToken)     );       #  if (response.statusCode == 200) {   *    var data = json.decode(response.body);   S    return data['result'].map<EventResult>((e) => EventResult.fromMap(e)).toList();   
  } else {   ^    throw Exception('Request failed. Status code: ${response.statusCode} : ${response.body}');     }   }           �Future<List<MarketTypeResult>> listMarketTypes(String appKey, String sessionToken, {MarketFilter marketFilter = const MarketFilter()}) async {   I  var url = Uri.https('api.betfair.com', 'exchange/betting/json-rpc/v1');         var body = json.encode({       'jsonrpc': '2.0',   1    'method': 'SportsAPING/v1.0/listMarketTypes',   /    'params': {'filter': marketFilter.toMap()},       'id': 1     });       !  var response = await http.post(       url, body: body,   .    headers: makeHeaders(appKey, sessionToken)     );       #  if (response.statusCode == 200) {   *    var data = json.decode(response.body);   ]    return data['result'].map<MarketTypeResult>((e) => MarketTypeResult.fromMap(e)).toList();   
  } else {   ^    throw Exception('Request failed. Status code: ${response.statusCode} : ${response.body}');     }   }       WFuture<List<MarketCatalogue>> listMarketCatalogue(String appKey, String sessionToken, {   2	MarketFilter marketFilter = const MarketFilter(),   *	List<MarketProjection>? marketProjection,   	MarketSort? sort,   	int? maxResults = 1000,   	String? locale,   
}) async {   I  var url = Uri.https('api.betfair.com', 'exchange/betting/json-rpc/v1');         var body = json.encode({       'jsonrpc': '2.0',   5    'method': 'SportsAPING/v1.0/listMarketCatalogue',       'params': {   "			'filter': marketFilter.toMap(),   H			// 'marketProjection': marketProjection?.map((e) => e.name).toList(),   			'marketProjection': [   !				MarketProjection.COMPETITION,   				MarketProjection.EVENT,    				MarketProjection.EVENT_TYPE,   '				MarketProjection.MARKET_START_TIME,   (				MarketProjection.MARKET_DESCRIPTION,   (				MarketProjection.RUNNER_DESCRIPTION,   %				MarketProjection.RUNNER_METADATA,   !			].map((e) => e.name).toList(),   			'sort': sort?.name,   			'maxResults': maxResults   		},       'id': 1     });       !  var response = await http.post(       url, body: body,   .    headers: makeHeaders(appKey, sessionToken)     );       #  if (response.statusCode == 200) {   *    var data = json.decode(response.body);   [    return data['result'].map<MarketCatalogue>((e) => MarketCatalogue.fromMap(e)).toList();   
  } else {   ^    throw Exception('Request failed. Status code: ${response.statusCode} : ${response.body}');     }   }       c// Note: The delayed App Key does not return traded volume data 'totalMatched' via listMarketBook."   (Future<List<MarketBook>> listMarketBook(   		String appKey,   		String sessionToken, {   #			required List<String> marketIds,   $			PriceProjection? priceProjection,   $			OrderProjection? orderProjection,   $			MatchProjection? matchProjection,   '			bool? includeOverallPosition = true,   /			bool? partitionMatchedByStrategyRef = false,   &			List<String>? customerStrategyRefs,   			String? currencyCode,   			String? locale,   			DateTime? matchedSince,   			List<String>? betIds,   				   		}) async {   I  var url = Uri.https('api.betfair.com', 'exchange/betting/json-rpc/v1');         var body = json.encode({       'jsonrpc': '2.0',   0    'method': 'SportsAPING/v1.0/listMarketBook',       'params': {   			'marketIds': marketIds,   2			// 'priceProjection': priceProjection?.toMap(),   &			'priceProjection': PriceProjection(   				priceData: [   					PriceData.SP_AVAILABLE,   					PriceData.SP_TRADED,   					PriceData.EX_BEST_OFFERS,   					PriceData.EX_ALL_OFFERS,   					PriceData.EX_TRADED,   				],   				virtualise: true,   				rolloverStakes: true,   			).toMap(),   /			// 'orderProjection': orderProjection?.name,   /			'orderProjection': OrderProjection.ALL.name,   /			// 'matchProjection': matchProjection?.name,   B			'matchProjection': MatchProjection.ROLLED_UP_BY_AVG_PRICE.name,   4			'includeOverallPosition': includeOverallPosition,   B			'partitionMatchedByStrategyRef': partitionMatchedByStrategyRef,   0			'customerStrategyRefs': customerStrategyRefs,    			'currencyCode': currencyCode,   			'locale': locale,   ,			'matchedSince': matchedSince?.toString(),   			'betIds': betIds,   		},       'id': 1     });       !  var response = await http.post(       url, body: body,   .    headers: makeHeaders(appKey, sessionToken)     );       #  if (response.statusCode == 200) {   *    var data = json.decode(response.body);   Q    return data['result'].map<MarketBook>((e) => MarketBook.fromMap(e)).toList();   
  } else {   ^    throw Exception('Request failed. Status code: ${response.statusCode} : ${response.body}');     }   }5��            �                      i             5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        d�*Z    �                   �               5��                   �                      A      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        d�*]    �                  5��                                                  5�_�      	                     ����                                                                                                                                                                                                                                                                                                                                                  V        d�*r   	 �         �      class Betfair {�         �      5  static final Betfair _shared = Betfair._internal();�         �        Betfair._internal();�         �      %  factory Betfair({String? appKey}) {�   {   }   �      3  var client = Betfair(appKey: 'yLIDQe5l1hDbD4Vf');5��    {                                        �       
                 c                    �                        C                    �       !                 +                    �                                            �                        �                    5�_�      
           	          ����                                                                                                                                                                                                                                                                                                                                                  V        d�*|   
 �         �      class Client {�         �      3  static final Client _shared = Client._internal();�         �        Client._internal();�         �      $  factory Client({String? appKey}) {�   {   }   �      2  var client = Client(appKey: 'yLIDQe5l1hDbD4Vf');5��    {                                        �       
                 _                    �                        @                    �                         )                    �                                            �                        �                    5�_�   	              
          ����                                                                                                                                                                                                                                                                                                                                                v       d�*�    �         �      class StreamingClient {�         �      E  static final StreamingClient _shared = StreamingClient._internal();�         �        StreamingClient._internal();�         �      -  factory StreamingClient({String? appKey}) {�   {   }   �      ;  var client = StreamingClient(appKey: 'yLIDQe5l1hDbD4Vf');5��    {                    5                    �       
                 �                    �                        [                    �       )                 ;                    �                        !                    �                        �                    5�_�   
                 $       ����                                                                                                                                                                                                                                                                                                                            $          $           v        d�*�    �   #   %   �      )  Future<void> loginInteractive() async {5��    #                    �                    5�_�                    ,        ����                                                                                                                                                                                                                                                                                                                            ,          0          V       d�*�    �   +   ,            Future<void> login() async {   *    var data = await llogin.login(appKey);   !    token = data["sessionToken"];   #    print("sessionTokenk: $token");     }5��    +                      �      �               5�_�                    +        ����                                                                                                                                                                                                                                                                                                                            ,          ,          V       d�*�    �   *   +           5��    *                      �                     5�_�                    ,        ����                                                                                                                                                                                                                                                                                                                            ,           q           V        d�*�    �   +   ,       F   3  Future<AccountDetail> getAccountDetails() async {   >    var data = await account.getAccountDetails(appKey, token);       return data;     }       0  Future<AccountFunds> getAccountFunds() async {   <    var data = await account.getAccountFunds(appKey, token);       return data;     }       8  Future<List<EventTypeResult>> listEventTypes() async {   ;    var data = await betting.listEventTypes(appKey, token);       return data;     }       3  Future<List<CompetitionResult>> listCompetitions(   ;      {MarketFilter filter = const MarketFilter()}) async {   S    var data = await betting.listCompetitions(appKey, token, marketFilter: filter);       return data;     }       \  Future<List<EventResult>> listEvents({MarketFilter filter = const MarketFilter()}) async {   M    var data = await betting.listEvents(appKey, token, marketFilter: filter);       return data;     }       1  Future<List<MarketTypeResult>> listMarketTypes(   ;      {MarketFilter filter = const MarketFilter()}) async {   R    var data = await betting.listMarketTypes(appKey, token, marketFilter: filter);       return data;     }       4  Future<List<MarketCatalogue>> listMarketCatalogue(   ;      {MarketFilter filter = const MarketFilter()}) async {   V    var data = await betting.listMarketCatalogue(appKey, token, marketFilter: filter);       return data;     }       *  Future<List<MarketBook>> listMarketBook(         {   $				required List<String> marketIds,   %				PriceProjection? priceProjection,   %				OrderProjection? orderProjection,   %				MatchProjection? matchProjection,   (				bool? includeOverallPosition = true,   0				bool? partitionMatchedByStrategyRef = false,   '				List<String>? customerStrategyRefs,   				String? currencyCode,   				String? locale,   				DateTime? matchedSince,   				List<String>? betIds,   			}) async {   ,    var data = await betting.listMarketBook(   				appKey,   
				token,   				marketIds: marketIds,   %				priceProjection: priceProjection,   %				orderProjection: orderProjection,   %				matchProjection: matchProjection,   3				includeOverallPosition: includeOverallPosition,   A				partitionMatchedByStrategyRef: partitionMatchedByStrategyRef,   /				customerStrategyRefs: customerStrategyRefs,   				currencyCode: currencyCode,   				locale: locale,   				matchedSince: matchedSince,   				betIds: betIds,       		);       return data;     }5��    +       F               �      �              5�_�                    5        ����                                                                                                                                                                                                                                                                                                                            5           H           V        d�*�    �   4   5          ,  var d0 = await client.getAccountDetails();     print("data: $d0");       *  var d1 = await client.getAccountFunds();     print("data: $d1");       ,  // var d2 = await client.listEventTypes();     // d2.forEach((element) {     //   print("$element");     // });       W  // var d3 = await client.listCompetitions(filter: MarketFilter(eventTypeIds: ["1"]));     // d3.forEach((element) {     //   print("$element");     // });     //   Z  // var d4 = await client.listEvents(filter: MarketFilter(competitionIds: ["12242357"]));     // d4.forEach((element) {     //   print("$element");     // });5��    4                      `      )              5�_�                    ;        ����                                                                                                                                                                                                                                                                                                                            ;           E           V        d�*�    �   :   ;          T	var filter = MarketFilter(eventIds: ["32582102"], marketTypeCodes: ["MATCH_ODDS"]);   <  var d6 = await client.listMarketCatalogue(filter: filter);     // d6.forEach((element) {   -		// print(encoder.convert(element.toMap()));     // });       !	var marketIds = ["1.217663912"];   =  var d7 = await client.listMarketBook(marketIds: marketIds);     d7.forEach((element) {   *		print(encoder.convert(element.toMap()));     });5��    :                      �      �              5�_�                    ;        ����                                                                                                                                                                                                                                                                                                                            ;           ;           V        d�*�    �   :   ;           5��    :                      �                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        d�*�    �                >import 'package:din/services/betfair/account.dart' as account;   >import 'package:din/services/betfair/betting.dart' as betting;5��                          �      ~               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        d�*�    �   
             5import 'package:din/models/betfair/market_type.dart';   :import 'package:din/models/betfair/match_projection.dart';   :import 'package:din/models/betfair/order_projection.dart';   :import 'package:din/models/betfair/price_projection.dart';5��    
                      �      �               5�_�                            ����                                                                                                                                                                                                                                                                                                                            	                      V        d�*�    �                8import 'package:din/models/betfair/account_detail.dart';   7import 'package:din/models/betfair/account_funds.dart';   <import 'package:din/models/betfair/competition_result.dart';   6import 'package:din/models/betfair/event_result.dart';   4import 'package:din/models/betfair/event_type.dart';   5import 'package:din/models/betfair/market_book.dart';   :import 'package:din/models/betfair/market_catalogue.dart';5��                                 �              5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        d�,�    �      !   2       �      !   1    5��                          �                     �                          �                     �                        �                    �                         �                     �                         �                     �                         �                     �                         �                     �                         �                     �                         �                    5�_�                             ����                                                                                                                                                                                                                                                                                                                                                  V        d�,�    �                 RawSecureSocket5��                          �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        d�*Z    �         �    �         �   �   import 'dart:convert';       8import 'package:din/models/betfair/account_detail.dart';   7import 'package:din/models/betfair/account_funds.dart';   <import 'package:din/models/betfair/competition_result.dart';   6import 'package:din/models/betfair/event_result.dart';   4import 'package:din/models/betfair/event_type.dart';   5import 'package:din/models/betfair/market_book.dart';   :import 'package:din/models/betfair/market_catalogue.dart';   7import 'package:din/models/betfair/market_filter.dart';   5import 'package:din/models/betfair/market_type.dart';   :import 'package:din/models/betfair/match_projection.dart';   :import 'package:din/models/betfair/order_projection.dart';   :import 'package:din/models/betfair/price_projection.dart';   ;import 'package:din/services/betfair/login.dart' as llogin;   >import 'package:din/services/betfair/account.dart' as account;   >import 'package:din/services/betfair/betting.dart' as betting;       '// Singleton client for the betfair API   class Betfair {     late final String appKey;     late final String token;     late final String product;       5  static final Betfair _shared = Betfair._internal();         Betfair._internal();       %  factory Betfair({String? appKey}) {       if (appKey != null) {         _shared.appKey = appKey;       }       return _shared;     }       )  Future<void> loginInteractive() async {   5    var data = await llogin.loginInteractive(appKey);       token = data["token"];       product = data["product"];       print("Token: $token");       print("Product: $product");     }         Future<void> login() async {   *    var data = await llogin.login(appKey);   !    token = data["sessionToken"];   #    print("sessionTokenk: $token");     }       3  Future<AccountDetail> getAccountDetails() async {   >    var data = await account.getAccountDetails(appKey, token);       return data;     }       0  Future<AccountFunds> getAccountFunds() async {   <    var data = await account.getAccountFunds(appKey, token);       return data;     }       8  Future<List<EventTypeResult>> listEventTypes() async {   ;    var data = await betting.listEventTypes(appKey, token);       return data;     }       3  Future<List<CompetitionResult>> listCompetitions(   ;      {MarketFilter filter = const MarketFilter()}) async {   S    var data = await betting.listCompetitions(appKey, token, marketFilter: filter);       return data;     }       \  Future<List<EventResult>> listEvents({MarketFilter filter = const MarketFilter()}) async {   M    var data = await betting.listEvents(appKey, token, marketFilter: filter);       return data;     }       1  Future<List<MarketTypeResult>> listMarketTypes(   ;      {MarketFilter filter = const MarketFilter()}) async {   R    var data = await betting.listMarketTypes(appKey, token, marketFilter: filter);       return data;     }       4  Future<List<MarketCatalogue>> listMarketCatalogue(   ;      {MarketFilter filter = const MarketFilter()}) async {   V    var data = await betting.listMarketCatalogue(appKey, token, marketFilter: filter);       return data;     }       *  Future<List<MarketBook>> listMarketBook(         {   $				required List<String> marketIds,   %				PriceProjection? priceProjection,   %				OrderProjection? orderProjection,   %				MatchProjection? matchProjection,   (				bool? includeOverallPosition = true,   0				bool? partitionMatchedByStrategyRef = false,   '				List<String>? customerStrategyRefs,   				String? currencyCode,   				String? locale,   				DateTime? matchedSince,   				List<String>? betIds,   			}) async {   ,    var data = await betting.listMarketBook(   				appKey,   
				token,   				marketIds: marketIds,   %				priceProjection: priceProjection,   %				orderProjection: orderProjection,   %				matchProjection: matchProjection,   3				includeOverallPosition: includeOverallPosition,   A				partitionMatchedByStrategyRef: partitionMatchedByStrategyRef,   /				customerStrategyRefs: customerStrategyRefs,   				currencyCode: currencyCode,   				locale: locale,   				matchedSince: matchedSince,   				betIds: betIds,       		);       return data;     }   }       void main() async {       3  var client = Betfair(appKey: 'yLIDQe5l1hDbD4Vf');     await client.login();       4	JsonEncoder encoder = JsonEncoder.withIndent('  ');       ,  var d0 = await client.getAccountDetails();     print("data: $d0");       *  var d1 = await client.getAccountFunds();     print("data: $d1");       ,  // var d2 = await client.listEventTypes();     // d2.forEach((element) {     //   print("$element");     // });       W  // var d3 = await client.listCompetitions(filter: MarketFilter(eventTypeIds: ["1"]));     // d3.forEach((element) {     //   print("$element");     // });     //   Z  // var d4 = await client.listEvents(filter: MarketFilter(competitionIds: ["12242357"]));     // d4.forEach((element) {     //   print("$element");     // });       V  var d5 = await client.listMarketTypes(filter: MarketFilter(eventIds: ["32582102"]));     d5.forEach((element) {       print("$element");     });       T	var filter = MarketFilter(eventIds: ["32582102"], marketTypeCodes: ["MATCH_ODDS"]);   <  var d6 = await client.listMarketCatalogue(filter: filter);     // d6.forEach((element) {   -		// print(encoder.convert(element.toMap()));     // });       !	var marketIds = ["1.217663912"];   =  var d7 = await client.listMarketBook(marketIds: marketIds);     d7.forEach((element) {   *		print(encoder.convert(element.toMap()));     });         // var client2 = Betfair();   /  // print(identical(client, client2)); // true   &  // print(client == client2); // true   }5��                   �                      A      5�_�                             ����                                                                                                                                                                                                                                                                                                                                                  V        d�*[    �               5��                                                  5��