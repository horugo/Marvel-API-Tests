*Settings*
Documentation    Suite de teste do cadastro de personagens na API da Marvel

Resource    ${EXECDIR}/resources/Base.robot
Library     ${EXECDIR}/resources/factories/Thanos.py
Library     ${EXECDIR}/resources/factories/Deadpool.py


Suite Setup    Super Setup    victorhpdantas@gmail.com

*Test Cases*
Deve cadastrar um personagem

    ${personagem}    Factory Thanos
    ${response}      POST New Character    ${personagem}

    Status Should Be    200    ${response}

Não deve cadastrar com o mesmo nome
    [Tags]    dup

    # Dado que Thanos ja existe no sistema
    ${personagem}         Factory Thanos
    POST New Character    ${personagem}

    # Quando faço uma requisição POST para a rota characters
    ${response}    POST New Character    ${personagem}

    # Então faço uma requisição POST para a rota characters
    Status Should Be    409                          ${response}
    Should Be Equal     ${response.json()}[error]    Character already exists :(
