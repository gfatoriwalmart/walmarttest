@json @mulmul
Feature: GET 


Scenario: Case normal success

When I request GET /04505001.json
Then the JSON response code should be 200
And the JSON key "cep" should include "04505001"
And the JSON key "uf" should include "SP"
And the JSON key "localidade" should include "São Paulo"
And the JSON key "bairro" should include "Vila Nova Conceição"
And the JSON key "logradouro" should include "Avenida Santo Amaro"
And show final json

# My remarks on the faliure test cases:
# I don't agree with returning 200 on error cases like below,
# but to pass the tests and make a demonstration
# I'll be letting this tests like they are.

Scenario: Case invalid characters

When I request GET /zzzz.json
Then the JSON response code should be 200
Then the response should include erro
And show final json

Scenario: Case lots of numbers

When I request GET /12312312.json
Then the JSON response code should be 200
Then the response should include erro
And show final json

Scenario: Non existing CEP

When I request GET /00000001.json
Then the JSON response code should be 200
Then the response should include erro
And show final json
