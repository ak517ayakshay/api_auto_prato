*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}  https://www.practo.com/tawang/doctors
${DOC_LINK}  (//h2[@data-qa-id='doctor_name'])[1]/ancestor::a
${FEEDBACK_LINK}  //a[@class='u-primary-text u-t-underline']
${LIKE_BUTTON}  //i[@class="icon-ic_like"]
${DROPDOWN_CLINIC}  //span[@class='Select-arrow-zone']
${CHOOSE_CLINIC}  //div[contains(@class, 'Select-menu')]//div[contains(@class, 'Select-option')][1]
${COMMENT_FIELD}  //textarea
${NAME_INPUT}  //input[@id="user-name"]
${PHONE_FIELD}  //input[@id="user-phone"]
${SUBMIT_BUTTON}  //span[@class="c-feedback-form__submit-text"]
${LOGIN}        //class="btn-border nav-login nav-interact"
*** Test Cases ***
Provide Doctor Feedback
    [Setup]    Open Browser    ${BASE_URL}    Chrome
    Maximize Browser Window

    Navigate To Doctor Page
    Submit Feedback

    Sleep    3s
    [Teardown]    Close Browser

*** Keywords ***
Navigate To Doctor Page
    Wait Until Element Is Visible    ${DOC_LINK}
    ${doc_page}=    Get Element Attribute    ${DOC_LINK}    href
    Go To    ${doc_page}
    Reload Page

Submit Feedback
    Wait Until Element Is Visible    ${FEEDBACK_LINK}
    Click Element    ${FEEDBACK_LINK}
    Sleep  2s
    Wait Until Element Is Visible    ${LIKE_BUTTON}
    Click Element    ${LIKE_BUTTON}
    Sleep  2s
    Wait Until Element Is Visible    ${DROPDOWN_CLINIC}
    Click Element    ${DROPDOWN_CLINIC}
    Sleep  2s
    Wait Until Element Is Visible    ${CHOOSE_CLINIC}
    Click Element    ${CHOOSE_CLINIC}
    Sleep  2s
    Wait Until Element Is Visible    ${COMMENT_FIELD}
    Input Text    ${COMMENT_FIELD}    Very professional doctor, explained everything in a simple manner. Excellent service! i highly recoomend to use his services! i rate him 10/10
    Sleep  2s
    Wait Until Element Is Visible    ${NAME_INPUT}
    Input Text    ${NAME_INPUT}    Akshay
    Sleep  2s
    Wait Until Element Is Visible    ${PHONE_FIELD}
    Input Text    ${PHONE_FIELD}    8217604494

    Wait Until Element Is Visible    ${SUBMIT_BUTTON}
    Click Element    ${SUBMIT_BUTTON}

