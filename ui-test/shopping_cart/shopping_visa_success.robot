*** Settings ***
Library    SeleniumLibrary
Suite Teardown  Close All Browsers

*** Variables ***
*** Test Cases ***
user ซื้อของเล่นให้ลูกสาว เลือกวิธีจัดส่งเป็น kerry ชำระเงินด้วยบัตรเครดิต visa และชำระเงินสำเร็จ
    แสดงสินค้า
    แสดงรายละเอียดสินค้า
    ระบุจำนวนสินค้าที่ซื้อ
    นำสินค้าใส่ตะกร้า
    ยืนยันการสั่งซื้อและชำระเงินด้วยบัตรเครดิตวีซ่าคาร์ด
    ขอบคุณ

*** Keywords ***
แสดงสินค้า
    Open Browser    https://dminer.in.th/Product-list.html  chrome
    Element Text Should Be    id:productName-1    43 Piece Dinner Set
    Element Text Should Be    id:productPrice-1    12.95 USD

แสดงรายละเอียดสินค้า
    Click Button    id=viewMore-1
    Wait Until Page Contains    Add to Cart
    Element Text Should Be    id:productName    43 Piece dinner Set
    Element Text Should Be    id:productBrand    CoolKidz
    Element Text Should Be    id:productPrice    12.95 USD

ระบุจำนวนสินค้าที่ซื้อ
    Input Text    id:productQuantity    1

นำสินค้าใส่ตะกร้า
    Click Button    id:addToCart

ยืนยันการสั่งซื้อและชำระเงินด้วยบัตรเครดิตวีซ่าคาร์ด
    Wait Until Page Contains    ยืนยันคำสั่งซื้อ
    Element Text Should Be    id:receiverName    ณัฐญา ชุติบุตร
    Element Text Should Be    id:totalProductPrice    12.95 USD
    Element Text Should Be    id:productName-1    43 Piece dinner Set
    Element Text Should Be    id:productPrice-1    12.95
    Click Button    id:confirmPayment
    Wait Until Page Contains    ยืนยันการชำระเงิน
    Input Text    id:cardNumber    4719700591590995
    Input Text    id:expiredMonth    7
    Input Text    id:expiredYear    20
    Input Text    id:cvv    752
    Input Text    id:cardName    Karnwat Wongudom
    Click Button    id:Payment

ขอบคุณ
    Wait Until Page Contains    กลับไปหน้าหลัก
    Element Text Should Be    id:title    ชำระเงินสำเร็จ