Vim�UnDo� ���ڵ�b� I������p��ɕV      2import 'package:din/services/betfair/client.dart';      %                       d�.    _�                             ����                                                                                                                                                                                                                                                                                                                                                             d��    �                   �               5��                   3                      �      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             d��    �                  5��                                                  5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        d��    �                Ifinal selectedEventTypeProvider = StateProvider<EventType?>((_) => null);       enum BrowseSelection {     none,     eventTypes,     competitons,   	  events,   
  markets,     individualMarket,   }       final browseSelectionProvider =   @    StateProvider<BrowseSelection>((_) => BrowseSelection.none);       Ifinal selectedEventTypeProvider = StateProvider<EventType?>((_) => null);5��                          k       _              5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        d��    �                Gfinal selectedEventProvider = StateProvider<EventResult?>((_) => null);   Mfinal selectedMarketProvider = StateProvider<MarketTypeResult?>((_) => null);       Nfinal eventTypesProvider = FutureProvider<List<EventTypeResult>>((ref) async {     var client = Betfair();   '  return await client.listEventTypes();   });5��                          �       ,              5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        d��    �                final eventsProvider =   3    FutureProvider<List<EventResult>>((ref) async {   			var client = Betfair();   >			final competition = ref.watch(selectedCompetitionProvider);   O			final marketFilter = MarketFilter(competitionIds: [competition?.id ?? '1']);   8			return await client.listEvents(filter: marketFilter);   });       final marketsProvider =   8    FutureProvider<List<MarketTypeResult>>((ref) async {   			var client = Betfair();   2			final event = ref.watch(selectedEventProvider);   I			final marketFilter = MarketFilter(eventIds: [event?.event.id ?? '1']);   =			return await client.listMarketTypes(filter: marketFilter);   });    5��                          �      _              5�_�                       2    ����                                                                                                                                                                                                                                                                                                                                                  V        d��    �              �               Mfinal selectedCompetitionProvider = StateProvider<Competition?>((_) => null);5��       2                 �                     �       6                  �                      �       5                  �                      �       4                  �                      �       3                  �                      �       2                 �                     �       <                  �                      �       ;                  �                      �       :                  �                      �       9                  �                      �       8                  �                      �       7                  �                      �       6                  �                      �       5                  �                      �       4                  �                      �       3                  �                      �       2                 �                     �                                           =       5�_�                       3    ����                                                                                                                                                                                                                                                                                                                                                  V        d��    �                4import 'package:din/models/betfair/event_type.dart';5��                          =       5               5�_�      	              
       ����                                                                                                                                                                                                                                                                                                                                                  V        d��    �             �   	            K			final marketFilter = MarketFilter(eventTypeIds: [eventType?.id ?? '1']);5��    	                    �                    �    	                     �                     �    	                     �                     �    	                     �                     �    	                     �                     �    	                     �                     �    	                    �                    �    	   %                  �                     �    	   $                  �                     �    	   #                  �                     �    	   "                  �                     �    	   !                  �                     �    	                      �                     �    	                     �                     �    	                     �                     �    	                     �                     �    	                     �                     �    	                     �                     �    	                     �                     �    	                     �                     �    	                    �                    �                          =               8       5�_�      
           	      %    ����                                                                                                                                                                                                                                                                                                                                                  V        d�    	 �   
            M			final marketFilter = MarketFilter()(eventTypeIds: [eventType?.id ?? '1']);5��    
   $                  �                     �    
   $                  �                     5�_�   	              
   	       ����                                                                                                                                                                                                                                                                                                                                                  V        d�   
 �             �      
         			var client = Betfair();5��                        a                    �                         c                     �                         b                     �                     	   a             	       �                         i                     �                         h                     �                         g                     �                         f                     �                         e                     �                         d                     �                         c                     �                         b                     �                        a                    �                         g                     �                         f                     �                         e                     �                         d                     �                         c                     �                         b                     �                        a                    �                          u               3       5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                                  V        d�	    �             �   
            :			final eventType = ref.watch(selectedEventTypeProvider);5��    
                    �                    �    
   !                  �                     �    
                      �                     �    
                    �                    �    
   9                  �                     �    
   8                  �                     �    
   7                  �                     �    
   6                  �                     �    
   5                  �                     �    
   4                  �                     �    
   3                  �                     �    
   2                  �                     �    
   1                  �                     �    
   0                  �                     �    
   /                  �                     �    
   .                  �                     �    
   -                  �                     �    
   ,                  �                     �    
   +                  �                     �    
   *                  �                     �    
   )                  �                     �    
   (                  �                     �    
   '                  �                     �    
   &                  �                     �    
   %                  �                     �    
   $                  �                     �    
   #                  �                     �    
   "                  �                     �    
   !                  �                     �    
                      �                     �    
                    �                    �    
   3                  �                     �    
   2                  �                     �    
   1                  �                     �    
   0                  �                     �    
   /                  �                     �    
   .                  �                     �    
   -                  �                     �    
   ,                  �                     �    
   +                  �                     �    
   *                  �                     �    
   )                  �                     �    
   (                  �                     �    
   '                  �                     �    
   &                  �                     �    
   %                  �                     �    
   $                  �                     �    
   #                  �                     �    
   "                  �                     �    
   !                  �                     �    
                      �                     �    
                    �                    �    
   3                  �                     �    
   2                  �                     �    
   1                  �                     �    
   0                  �                     �    
   /                  �                     �    
   .                  �                     �    
   -                  �                     �    
   ,                  �                     �    
   +                  �                     �    
   *                  �                     �    
   )                  �                     �    
   (                  �                     �    
   '                  �                     �    
   &                  �                     �    
   %                  �                     �    
   $                  �                     �    
   #                  �                     �    
   "                  �                     �    
   !                  �                     �    
                      �                     �    
                    �                    �    
   4                  �                     �    
   3                  �                     �    
   2                  �                     �    
   1                  �                     �    
   0                  �                     �    
   /                  �                     �    
   .                  �                     �    
   -                  �                     �    
   ,                  �                     �    
   +                  �                     �    
   *                  �                     �    
   )                  �                     �    
   (                  �                     �    
   '                  �                     �    
   &                  �                     �    
   %                  �                     �    
   $                  �                     �    
   #                  �                     �    
   "                  �                     �    
   !                  �                     �    
                      �                     �    
                    �                    �    
   4                  �                     �    
   3                  �                     �    
   2                  �                     �    
   1                  �                     �    
   0                  �                     �    
   /                  �                     �    
   .                  �                     �    
   -                  �                     �    
   ,                  �                     �    
   +                  �                     �    
   *                  �                     �    
   )                  �                     �    
   (                  �                     �    
   '                  �                     �    
   &                  �                     �    
   %                  �                     �    
   $                  �                     �    
   #                  �                     �    
   "                  �                     �    
   !                  �                     �    
                      �                     �    
                    �                    �    
   7                  �                     �    
   6                  �                     �    
   5                  �                     �    
   4                  �                     �    
   3                  �                     �    
   2                  �                     �    
   1                  �                     �    
   0                  �                     �    
   /                  �                     �    
   .                  �                     �    
   -                  �                     �    
   ,                  �                     �    
   +                  �                     �    
   *                  �                     �    
   )                  �                     �    
   (                  �                     �    
   '                  �                     �    
   &                  �                     �    
   %                  �                     �    
   $                  �                     �    
   #                  �                     �    
   "                  �                     �    
   !                  �                     �    
                      �                     �    
                    �                    �                          �               6       5�_�                        %    ����                                                                                                                                                                                                                                                                                                                                                             d�.    �               2import 'package:din/services/betfair/client.dart';5��       %                  �                      5��