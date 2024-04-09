*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                     http://www.automationpractice.pl/index.php
${SingIn}                  //a[@class='login'][contains(.,'Sign in')]
${TextCreatAccount}        Create an account
${TextREGISTERED}          Already registered?
${CampoTextEmail}          //input[@type='text'][contains(@id,'create')]
${NovoEmail}               teste1001@teste.com
${Email}                   teste1000@teste.com
${BotaoCreatAccount}       //span[contains(.,'Create an account')]
${RadioBotaoMr}            //input[@type='radio'][contains(@id,'gender1')]
${TextFirstname}           //input[@type='text'][contains(@id,'firstname')]
${TextLastname}            //input[@type='text'][contains(@id,'lastname')]
${TextPassword}            //input[contains(@type,'password')]
${Senha}                   123456
${TextInicial}             Your personal information
${SelectDay}               //select[contains(@name,'days')]
${Daybirthday}             //option[@value='30'][contains(.,'30')]
${SelectMonths}            //select[contains(@name,'months')]
${Months}                  //option[@value='7'][contains(.,'July')]
${SelectYears}             //select[contains(@name,'years')]
${Years}                   //option[@value='1986'][contains(.,'1986')]
${ButtonRegister}          //span[contains(.,'Register')]
${AccountCreated}          Your account has been created.
${TextEmailCadastrado}     An account using this email address has already been registered. Please enter a valid password or request a new one. 	
${InputEmailCadastrado}    //input[@id='email']
${BtnSindIn}               //span[contains(.,'Sign in')]
${TextMyAccount}           My account
${BtnAbaTshirts}           (//a[@href='http://www.automationpractice.pl/index.php?id_category=5&controller=category'][contains(.,'T-shirts')])[2]
${TextTshirt}              T-shirts 
${BtnProduto}              //span[contains(.,'More')]
${Produto}                 Faded Short Sleeve T-shirts
${Selecionartamanho}       //select[@name='group_1'][contains(@id,'1')]
${Tamanho}                 //option[@value='3'][contains(.,'L')]   
${BtmAdd}                  //button[@type='submit'][contains(.,'Add to cart')]
${TextProdAddCart}         Product successfully added to your shopping cart
				

*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome  options=add_experimental_option("detach", True)
    Maximize Browser Window    

Fechar o navegador
    Close Browser

Acessar site
    Go To                            url=${URL}
    Wait Until Element Is Visible    locator=${SingIn}

Clicar SignIn
    Click Element                    locator=${SingIn}
    Wait Until Page Contains         text=${TextCreatAccount}

Preencher Email
    Input Text                       locator=${CampoTextEmail}     text=${NovoEmail}
    Click Element                    locator=${BotaoCreatAccount}

Preencher Email ja existente
    Input Text                       locator=${CampoTextEmail}     text=${Email}
    Click Element                    locator=${BotaoCreatAccount}

Preencher informacoes
    Wait Until Page Contains         text=${TextInicial} 
    Click Element                    locator=${RadioBotaoMr}
    Input Text                       locator=${TextFirstname}     text=João
    Input Text                       locator=${TextLastname}     text=Silva
    Input Text                       locator=${TextPassword}     text=${Senha} 
    Click Element                    locator=${SelectDay} 
    Click Element                    locator=${Daybirthday}
    Click Element                    locator=${SelectMonths}
    Click Element                    locator=${Months} 
    Click Element                    locator=${SelectYears}
    Click Element                    locator=${Years} 
    Click Element                    locator=${ButtonRegister} 

Valida que foi cadastrado com sucesso
    Wait Until Page Contains         text=${AccountCreated}

Validar que o Email ja esta cadastrado
    Wait Until Page Contains         text=${TextEmailCadastrado} 

Logar com Email e senha cadastrados
    Wait Until Page Contains         text=${TextREGISTERED}
    Input Text                       locator=${InputEmailCadastrado}     text=teste1000@teste.com
    Input Password                   locator=//input[contains(@type,'password')]    password=123456
    Click Element                    locator=${BtnSindIn}
    Wait Until Page Contains         text=${TextMyAccount}   

Acessar aba T-shirts
    Click Element                    locator=${BtnAbaTshirts}     
    Wait Until Page Contains         text=${TextTshirt}             

Escolher um produto e adicionar ao carrinho
    Click Element                    locator=//a[@href='http://www.automationpractice.pl/index.php?id_product=1&controller=product#/size-s/color-blue'][contains(@id,'2')]
    Click Element                    locator=//span[contains(.,'More')]
    Wait Until Page Contains         text=${Produto}
    Scroll Element Into View         locator=group_1
    Click Element                    locator=group_1
    Click Element                    locator=${Tamanho} 
    Click Element                    locator=${BtmAdd}                                

Validar Produto add ao carrinho
    Wait Until Page Contains         text=${TextProdAddCart} 

Preencher dados de compra
    Wait Until Page Contains     text=Proceed to checkout
    Wait Until Page Contains     text=There is 1 item in your cart.
    Click Element                locator=//a[contains(@title,'View my shopping cart')]
    Scroll Element Into View     locator=//a[contains(@class,'button btn btn-default standard-checkout button-medium')]
    Click Element                locator=//a[contains(@class,'button btn btn-default standard-checkout button-medium')]
    Input Text                   locator=address1    text=Rua Jaja
    Input Text                   locator=city        text=Austin
    Click Element                locator=id_state 
    Click Element                locator=//option[@value='43'][contains(.,'Texas')] 
    Input Text                   locator=postcode    text=78652 
    Input Text                   locator=phone    text=+15124076310 
    Click Element                locator=submitAddress
    Wait Until Page Contains     text=Your delivery address
    Click Element                locator=processAddress
    Wait Until Page Contains     text=Choose a shipping option for this address: My address
    Click Element                locator=cgv 
    Click Element                locator=processCarrier 
    Wait Until Page Contains     text=Please choose your payment method
    Click Element                locator=//a[@class='bankwire'][contains(.,'Pay by bank wire (order processing will be longer)')]
    Wait Until Page Contains     text=Bank-wire payment
    Click Element                locator=//button[@class='button btn btn-default button-medium'][contains(.,'I confirm my order')] 

Valida que a compra foi efetuada  
    Wait Until Page Contains     text=Your order on My Shop is complete.
            

													