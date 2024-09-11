*** Settings ***
Library Browser


*** Variables ***
${URL}              https://www.saucedemo.com/
${LOGO}             css=div.login_logo


*** Keyword ***
Abrir Pagina inicial
    New Page                    ${URL}
    Wait for Elements State     ${LOGO}     visible


*** Test Cases ***
Acessar página Saucedemo
    Abrir Pagina inicial
    Close Browser