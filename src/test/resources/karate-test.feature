Feature: Test de API súper simple

  Background:
    * configure ssl = true

    @id:1 @ObtenerTodos
    Scenario: Obtener todos los characters 200
      Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/pppucha/api/characters'
      When method get
      Then status 200

    @id2 @CrearCharacter
    Scenario: Crear y eliminar un héroe
      Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/pppucha/api/characters'
      And def user = read('classpath:../data/crearCharacterData.json')
      When request user
      And method POST
      Then status 201
      * def createdId = response.id

      Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/pppucha/api/characters/' + createdId
      When method DELETE
      Then status 204

    @id4 @ActualizarCharacter
    Scenario: Actualizar character
      Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/pppucha/api/characters'
      And def user = read('classpath:../data/crearCharacterData.json')
      When request user
      And method POST
      Then status 201
      * def createdId = response.id

      Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/pppucha/api/characters/' + createdId
      And def updatedUser = read('classpath:../data/actualizarCharacterData.json')
      When request updatedUser
      And method PUT
      Then status 200

      Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/pppucha/api/characters/' + createdId
      When method DELETE
      Then status 204

    @id4 @ObtenerCharacterPorId
    Scenario: Obtener character por id
      Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/pppucha/api/characters'
      And def user = read('classpath:../data/crearCharacterData.json')
      When request user
      And method POST
      Then status 201
      * def createdId = response.id

      Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/pppucha/api/characters/' + createdId
      When method get
      Then status 200

      Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/pppucha/api/characters/' + createdId
      When method DELETE
      Then status 204

  @id5 @EliminarCharacter
  Scenario: Crear y eliminar un héroe
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/pppucha/api/characters'
    And def user = read('classpath:../data/crearCharacterData.json')
    When request user
    And method POST
    Then status 201
    * def createdId = response.id

    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/pppucha/api/characters/' + createdId
    When method DELETE
    Then status 204
