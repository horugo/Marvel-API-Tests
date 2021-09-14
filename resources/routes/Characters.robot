*Settings*
Documentation    Ações sa rota /characters


*Keywords*
POST New Character
    [Arguments]    ${payload}

    ${response}    POST                     
    ...            ${API_URL}/characters    
    ...            json=${payload}          
    ...            headers=${HEADERS}
    ...            expected_status=any

    [return]    ${response}