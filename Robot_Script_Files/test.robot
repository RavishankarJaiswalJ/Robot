*** Settings ***
Library    SeleniumLibrary
Library    ExcelLibrary
Library    Collections
Library    OperatingSystem
# Library    WebDriverManager




*** Variables ***
${Browser}    chrome
${Firefox}    firefox
${url}    https://www.w3schools.com/  
${Driver}    C:/Driver/geckodriver-v0.33.0-win-aarch64/geckodriver.exe
${ChromeDriver}    C:/Driver/DriverRed(2)/chromedriver.exe
 
*** Test Cases ***
TC001_Test
             
    # Create WebDriver    Firefox
    # Open Chrome Browser to Page    ${url}         
    Append To Environment Variable    ${ChromeDriver}
    Open Browser    ${url}    ${Browser}       
    Go To    ${url}    
    Maximize Browser Window
    Sleep    15
    

# Library    SeleniumLibrary

# *** Test Cases ***
# Open Firefox and Navigate
    # Open Browser    https://www.w3schools.com/    firefox    executable_path=/C:/Driver/geckodriver-v0.33.0-win-aarch64/geckodriver
    # Maximize Browser Window
    # Sleep    2   # Add a short sleep to allow the page to load
    # Capture Page Screenshot  # Take a screenshot for verification
    # Close Browser

  

*** Keywords ***

Open Chrome Browser to Page
    [Documentation]     Opens _Google Chrome_ to a given web page.
    ...                 For more information on what capabilities that _Google Chrome_
    ...                 supports, see [https://sites.google.com/a/chromium.org/chromedriver/capabilities%7Cthis Capabilities & ChromeOptions page].
    [Arguments]    ${URL}
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    WebDriverManager.chromedriver().setup();
    Run Keyword If    os.sep == '/'    Create Webdriver    Chrome    my_alias    chrome_options=${chrome_options}    executable_path=C:/Driver/chromedriver.exe
    ...    ELSE    Create Webdriver    Chrome    my_alias    chrome_options=${chrome_options}
    # Maximize Browser Window  # doesn't work under XVFB
    Set Window Size    1200    1000
    Go To    ${URL}
       
    
    
