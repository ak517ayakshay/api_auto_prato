*** Settings ***
Library  SeleniumLibrary

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
${LOGIN}  //a[@class="btn-border nav-login nav-interact "]
${USER_NAME}  //input[@id="username"]
${PASS_WORD}  //input[@id="password"]
${LOGIN_BUTTON}  //button[@id="login"]
${YES}  //div[@class="u-d-inlineblock u-border--practo-blue u-color--practo-blue u-round-corner u-c-pointer u-cushion--medium-left u-cushion--medium-right u-cushion--small-top u-cushion--small-bottom"]
${CONFIRM}  //p[@class="thankyou-layout__header"]
${USERNAME_VALUE}  +918217604494
${PASSWORD_VALUE}  P@ssw0rd@akshay
${COMMENT_TEXT}  Very professional doctor, explained everything in a simple manner. Excellent service! I highly recommend to use his services! I rate him 10/10
${USER_NAME_VALUE}  Akshay
${PHONE_VALUE}  8217604494

*** Test Cases ***
Provide Doctor Feedback
  [Setup]  Open Browser  ${BASE_URL}  Chrome
  Maximize Browser Window
  Wait Until Element is Visible  ${LOGIN}  10s
  Click Element  ${LOGIN}
  Wait Until Element is Visible  ${USER_NAME}
  Input Text  ${USER_NAME}  ${USERNAME_VALUE}
  Wait Until Element is Visible  ${PASS_WORD}
  Input Text  ${PASS_WORD}  ${PASSWORD_VALUE}
  Wait Until Element is Visible  ${LOGIN}  10s
  Click Element  ${LOGIN_BUTTON}
  Navigate To Doctor Page
  Submit Feedback
  [Teardown]  Close Browser

*** Keywords ***
Navigate To Doctor Page
  Wait Until Element Is Visible  ${DOC_LINK}
  ${doc_page}=  Get Element Attribute  ${DOC_LINK}  href
  Go To  ${doc_page}
  Reload Page

Submit Feedback
  Wait Until Element Is Visible  ${FEEDBACK_LINK}
  Click Element  ${FEEDBACK_LINK}
  Wait Until Element Is Visible  ${LIKE_BUTTON}
  Click Element  ${LIKE_BUTTON}
  Wait Until Element Is Visible  ${DROPDOWN_CLINIC}
  Click Element  ${DROPDOWN_CLINIC}
  Wait Until Element Is Visible  ${CHOOSE_CLINIC}
  Click Element  ${CHOOSE_CLINIC}
  Wait Until Element Is Visible  ${COMMENT_FIELD}
  Input Text  ${COMMENT_FIELD}  ${COMMENT_TEXT}
  Wait Until Element Is Visible  ${NAME_INPUT}
  Input Text  ${NAME_INPUT}  ${USER_NAME_VALUE}
  Wait Until Element Is Visible  ${PHONE_FIELD}
  Input Text  ${PHONE_FIELD}  ${PHONE_VALUE}
  Wait Until Element Is Visible  ${SUBMIT_BUTTON}
  Click Element  ${SUBMIT_BUTTON}
  Wait Until Element Is Visible  ${YES}
  Click Element  ${YES}
  Wait Until Element is Visible  ${CONFIRM}