Vim�UnDo� ���$��G�h����`���T)S����UA5�{      (	socket.write('$json.encode(msg))\r\n');            1       1   1   1    d�C(   - _�                             ����                                                                                                                                                                                                                                                                                                                                                             d�8    �                   �               5��                   9                      �      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             d�8    �                  5��                                                  5�_�                            ����                                                                                                                                                                                                                                                                                                                                       
           V        d�8    �                0Map<String, String> makeHeaders(String appKey) {   v  return {'X-Application': appKey, 'Accept': 'application/json', 'Content-Type': 'application/x-www-form-urlencoded'};   }5��                          {       �               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        d�8    �                 5��                          {                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        d�8    �      	   5      &Future<SecureSocket> connect() async {5��                        �                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                       5          V        d�8    �             )   DFuture<Map<String, dynamic>> loginInteractive(String appKey) async {   >  var url = Uri.https('identitysso.betfair.com', 'api/login');   !  var response = await http.post(       url,   X    body: {'username': 'project.din.bet@gmail.com', 'password': 'aHorseByTheSea1992@@'},        headers: makeHeaders(appKey)     );   #  if (response.statusCode == 200) {   *    var data = json.decode(response.body);       return data;   
  } else {   L    throw Exception('Failed to login. Status code: ${response.statusCode}');     }   }           9Future<Map<String, dynamic>> login(String appKey) async {   3    final context = SecurityContext.defaultContext;   9    context.useCertificateChain('certs/client-2048.crt');   3    context.usePrivateKey('certs/client-2048.key');       4    final httpClient = HttpClient(context: context);   (    final client = IOClient(httpClient);       #    late Map<String, dynamic> data;       I    var url = Uri.https('identitysso-cert.betfair.com', 'api/certlogin');   %    var response = await client.post(   
      url,   Z      body: {'username': 'project.din.bet@gmail.com', 'password': 'aHorseByTheSea1992@@'},   "      headers: makeHeaders(appKey)       );       %    if (response.statusCode == 200) {   (      data = json.decode(response.body);       } else {   N      throw Exception('Failed to login. Status code: ${response.statusCode}');       }       client.close();       return data;   }5��           )               !      (              5�_�                       "    ����                                                                                                                                                                                                                                                                                                                                                 V        d�8    �      	         +Future<SecureSocket> authenticate() async {5��       "               
   �               
       �       )                 �                     �       7                  �                      5�_�      	                 "    ����                                                                                                                                                                                                                                                                                                                                                 V        d�8     �      	         @Future<SecureSocket> authenticate(client SecureSocket, ) async {5��       "                  �                      5�_�      
           	      .    ����                                                                                                                                                                                                                                                                                                                                                 V        d�8!   	 �      	         9Future<SecureSocket> authenticate(SecureSocket, ) async {5��       .                  �                      �       2                 �                     �       5                  �                      5�_�   	              
      7    ����                                                                                                                                                                                                                                                                                                                                                 V        d�8'   
 �      	         @Future<SecureSocket> authenticate(SecureSocket client, ) async {5��       7                  �                      �       7                 �                     �       F                 �                     �       G                 �                     �       G                 �                     5�_�   
                 	        ����                                                                                                                                                                                                                                                                                                                            	   P       
          V   Q    d�8�    �      	          f	final client = SecureSocket.connect('stream-api.betfair.com', 443, onBadCertificate: (cert) => true);   	return client;5��                          �       w               5�_�                            ����                                                                                                                                                                                                                                                                                                                            	   P       	          V   Q    d�8�     �      
         	�      
   
    5��                          �                      �                       
   �               
       �                        �                     �                        �                     �                         �                      5�_�                    	       ����                                                                                                                                                                                                                                                                                                                            
   P       
          V   Q    d�8�    �      
         	client.write5��                         �                      5�_�                    	       ����                                                                                                                                                                                                                                                                                                                            
   P       
          V   Q    d�8�    �      
         	client.write()5��                         �                      5�_�                           ����                                                                                                                                                                                                                                                                                                                            
   P       
          V   Q    d�8�    �      
         	�      
       5��                          �                      �                          �                      �                        �                     �                        �                     �                        �                     �                         �                      5�_�                    	       ����                                                                                                                                                                                                                                                                                                                               P                 V   Q    d�8�    �      
         	final authenticatio�   	   
       5��                        �                     5�_�                    	       ����                                                                                                                                                                                                                                                                                                                               P                 V   Q    d�8�    �      
         	final auth = authenticatio�   	   
       5��                     N   �              N       5�_�                    	       ����                                                                                                                                                                                                                                                                                                                               P                 V   Q    d�8�    �               \	final auth = {"op": "authentication", "appKey": "<you-appkey>", "session": "<your-session>}5��                        �                      �    	                     �                     5�_�                    
       ����                                                                                                                                                                                                                                                                                                                               P                 V   Q    d�8�    �   	            O		"op": "authentication", "appKey": "<you-appkey>", "session": "<your-session>}5��    	                                         5�_�                           ����                                                                                                                                                                                                                                                                                                                               P                 V   Q    d�8�     �   
            7		"appKey": "<you-appkey>", "session": "<your-session>}5��    
                                          5�_�                           ����                                                                                                                                                                                                                                                                                                                               P                 V   Q    d�8�    �   
            6		"appKey": "<you-appkey>","session": "<your-session>}5��    
                                         5�_�                           ����                                                                                                                                                                                                                                                                                                                               P                 V   Q    d�8�    �               		"session": "<your-session>}5��                        :                     �                         ;                    5�_�                    	       ����                                                                                                                                                                                                                                                                                                                               P                 V   Q    d�8�    �      
         	final auth = {5��                        �                     �       
                  �                      �       	                 �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       d�8�    �   
            		"appKey": "<you-appkey>",�             5��    
                                        5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       d�8�    �               		"session": "<your-session>5��                        "                    �                        "                    �                         #                     �                        "                    5�_�                       M    ����                                                                                                                                                                                                                                                                                                                                                v       d�8�    �      	         [Future<SecureSocket> authenticate(SecureSocket client, String appKey, String token) async {5��       M                 �                     5�_�                    	       ����                                                                                                                                                                                                                                                                                                                                                v       d�8�    �      
         	final msh = {5��                        �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       d�8�    �               	}5��                         .                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       d�8�    �               	client.write();�             5��                         >                     �                        >                    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                v       d�93    �      	         ]Future<SecureSocket> authenticate(SecureSocket client, String appKey, String session) async {5��                         {                     5�_�                             ����                                                                                                                                                                                                                                                                                                                                                V       d�97    �                (import 'package:http/http.dart' as http;   %import 'package:http/io_client.dart';5��                          *       O               5�_�      !                       ����                                                                                                                                                                                                                                                                                                                                                V       d�98    �                 5��                          *                      5�_�       "           !          ����                                                                                                                                                                                                                                                                                                                                                V       d�;f    �               Mvoid authenticate(SecureSocket client, String appKey, String session) async {�   
             	client.write(json.encode(msg));5��    
                    �                     �                        J                     5�_�   !   #           "          ����                                                                                                                                                                                                                                                                                                                                                V       d�B�     �   
             	socket.write(json.encode(msg));5��    
                     �                      �    
                    �                     5�_�   "   %           #           ����                                                                                                                                                                                                                                                                                                                                                V       d�C   # �   
            "	socket.write('$json.encode(msg));�             5��    
                      �                      �    
                     �                     5�_�   #   &   $       %          ����                                                                                                                                                                                                                                                                                                                                                V       d�C     �               	final msg = {5��                         �                      �                         �                      �                        �                     �                         �                      �                     	   �              	       �                         �                      �                        �                     5�_�   %   '           &          ����                                                                                                                                                                                                                                                                                                                                                V       d�C     �               	final msg = json.encode{5��                         �                      5�_�   &   (           '          ����                                                                                                                                                                                                                                                                                                                                                V       d�C     �               	final msg = json.encode(){5��                         �                      5�_�   '   )           (          ����                                                                                                                                                                                                                                                                                                                                                V       d�C   $ �               	final msg = json.encode{5��                         �                      5�_�   (   *           )          ����                                                                                                                                                                                                                                                                                                                                                V       d�C   % �               	final msg = json.encode(){5��                        �                     �                         �                      �                         �                      �                         �                      �                         �                      5�_�   )   +           *   
       ����                                                                                                                                                                                                                                                                                                                                                V       d�C   & �   	            	};5��    	                     �                      5�_�   *   ,           +          ����                                                                                                                                                                                                                                                                                                                                                V       d�C   ' �   
            (	socket.write('$json.encode(msg))\r\n');5��    
                     �                      5�_�   +   -           ,          ����                                                                                                                                                                                                                                                                                                                                                V       d�C    ( �   
            %	socket.write('$j.encode(msg))\r\n');5��    
                     �                      5�_�   ,   .           -          ����                                                                                                                                                                                                                                                                                                                                                V       d�C    ) �   
            $	socket.write('$jencode(msg))\r\n');5��    
                     �                      5�_�   -   /           .          ����                                                                                                                                                                                                                                                                                                                                                V       d�C    * �   
            	socket.write('$j(msg))\r\n');5��    
                     �                      5�_�   .   0           /          ����                                                                                                                                                                                                                                                                                                                                                V       d�C"   + �   
            	socket.write('$jmsg))\r\n');5��    
                     �                      5�_�   /   1           0          ����                                                                                                                                                                                                                                                                                                                                                V       d�C$   , �   
            	socket.write('$jmsg)\r\n');5��    
                    �                     �    
                     �                      5�_�   0               1          ����                                                                                                                                                                                                                                                                                                                                                V       d�C'   - �   
            	socket.write('$msg)\r\n');5��    
                     �                      5�_�   #           %   $   
       ����                                                                                                                                                                                                                                                                                                                                                V       d�C   " �   
            	�   
            		final en5��    
                      �                      �    
                     �                      �    
                    �                     �    
                    �                     5��