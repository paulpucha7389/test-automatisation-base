Feature: Test de API súper simple

  Background:
    * configure ssl = true

    @id:1 @ObtenerTodos
    Scenario: Obtener todos los characters 200
      Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/pppucha/api/characters'
      When method get
      Then status 200

    @id2 @CrearCharacter
    Scenario: Crear character
      Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/pppucha/api/characters'
      And def user = read('classpath:../data/crearCharacterData.json')
      * request user
      * print user
      When method POST
      Then status 201

