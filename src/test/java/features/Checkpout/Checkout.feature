@checkOutApi
Feature: Check out API tests

    Background:
        * def requestData = read('classpath:resources/requests/checkout.json')
        * def responeData = read('classpath:resources/respones/checkout.json')

    Scenario: Call check out with wrong database name
        Given url baseUrl
        And path 'confirm_lostconnect'
        And request {}
        When method post
        Then status 503
        Then match response contains {"error":"Oops! Unable to connect to the database. Please try again later."}


    Scenario: Sucessfully checkout with  1 product
        Given url  baseUrl
        Given path 'confirm'
        And request requestData.checkoutRequest
        When method post
        Then status 200
        Then match response.orderdetail contains deep responeData.orderdetail
        And def productPrice = response.orderdetail[0].product_price
        Then assert productPrice > 0


    Scenario: Sucessfully checkout with high volume of products
        Given url baseUrl
        And path 'confirm_order_allProduct'
        And request requestData.checkoutRequest
        When method post
        Then status 200
        Then match response.orderdetail contains deep responeData.orderdetail
        And def productPrice = response.orderdetail[0].product_price
        Then assert productPrice > 0

    # @prepare @ignore
    Scenario Outline: Sucessfully checkout with multiple users in sort period times
        Given url baseUrl
        And path 'confirm'
        And request { "userID":<userID>,"name" : "LE TRAN HUY HIEN","phone":"0889382009","email":"huyhien1901@gmail.com","street":"15B Nguyễn Lương Bằng, P. Phú Thuận, Quận 7","province":"202","district" : "2090","ward" : "22406","voucherCode" : null,"shipping" : "Free_Ship","deliver-note" : null,"provinceName" : "Hồ Chí Minh","dictrictName": "Huyện Cần Giờ","warldName" : "Xã Tam Thôn Hiệp", "shippingFee" : "34001","getsubtotal" : "37683","total_vnpay" : "71684"}
        When method post
        Then status 200
        Then match response.orderdetail contains deep responeData.orderdetail
        And def productPrice = response.orderdetail[0].product_price
        Then assert productPrice > 0

        Examples:
            | userID |
            | 1      |
            | 2      |
            | 3      |
            | 4      |
            | 5      |
            | 6      |
            | 7      |
            | 8      |
            | 9      |
            | 10     |
            | 11     |
            | 12     |
            | 13     |
            | 14     |
            | 15     |
            | 16     |
            | 17     |
            | 18     |
            | 19     |
            | 20     |
            | 21     |
            | 22     |
            | 23      |
            | 24      |
            | 25      |
            | 26      |
            | 27      |
            | 28      |
            | 29      |
            | 30     |
            | 31     |
            | 32     |
            | 33     |
            | 34     |
            | 35     |
            | 36     |
            | 37     |
            | 38     |
            | 39     |
            | 40     |
            | 41     |
            | 42     |

    Scenario:  Checkout Cart with 0 Item
        # * def prepareTest = call read('Checkout.feature@prepare')
        Given url baseUrl
        And path 'confirm_order_cart_empty'
        And request {}
        When method post
        Then status 200
        Then match response contains 'Have some issue with your checkout!! Please try again!'




