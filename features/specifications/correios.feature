@lololo
Feature: GET 

@QAready
Scenario Outline: Many successfull requests

When I request GET "<json>"
Then the JSON response code should be 200
And the JSON key "cep" should include "<cep>"
And the JSON key "uf" should include "<uf>"
And the JSON key "localidade" should include "<localidade>"
And the JSON key "bairro" should include "<bairro>"
And the JSON key "logradouro" should include "<logradouro>"
And show final json

Examples:
| json 			 | cep 		| uf | localidade 		| bairro 				| logradouro 																		|
| /04505001.json | 04505001	| SP | São Paulo		| Vila Nova Conceição 	| Avenida Santo Amaro 																|
| /04555000.json | 04555000	| SP | São Paulo		| Brooklin Paulista 	| Avenida Santo Amaro 																|
| /88040900.json | 88040900	| SC | Florianópolis	| Trindade		 		| Rua Roberto Sampaio Gonzaga, s/n - UFSC - Universidade Federal de Santa Catarina 	|

@QAready
Scenario: Case normal success

When I request GET "/04505001.json"
Then the JSON response code should be 200
And the JSON key "cep" should include "04505001"
And the JSON key "uf" should include "SP"
And the JSON key "localidade" should include "São Paulo"
And the JSON key "bairro" should include "Vila Nova Conceição"
And the JSON key "logradouro" should include "Avenida Santo Amaro"
And show final json

@QAready
Scenario: Case invalid characters

When I request GET "/zzzz.json"
Then the JSON response code should be 200
Then the response should include erro
And show final json

@QAready
Scenario: Case lots of numbers

When I request GET "/12312312.json"
Then the JSON response code should be 200
Then the response should include erro
And show final json

@QAready
Scenario: Non existing CEP

When I request GET "/00000001.json"
Then the JSON response code should be 200
Then the response should include erro
And show final json
