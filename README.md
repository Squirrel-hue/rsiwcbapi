# Deposit Funds to Coinbase Using Sign In with Coinbase API

**Note: I have not tested any of this.  This is offered without any guarantee.**
**When I have additional time after the January 12, 2024, I will test this**
**further.  Until then, it is meant as a sketch of a solution.**

## Basic Procedure

The basic process is as follows:
            
1. Know the API key and the secret key.  I am not yet sure if this will be the same 
as the Advanced Trade API.
Make sure that proper care is taken to safeguard the secret key.
2. Get payment account information (it is assumed that this has already been added to Coinbase)
3. Get account information of the account into which you wish to deposit funds.
4. Submit Funds Transfer 

## List Accounts 

It is assumed that API key and the secret key is known.  Add them in the place 
of "" below.

``` r
api_key = ""
secret_key = ""

list_accounts_var <- interact_SWCB_API_keys(api_key = api_key,
                                            secret_key = secret_key,
                                            method = "GET",
                                            reqPath = "accounts")
```

Here we need to extract the information from the variable `list_variable_var`  
The proper account will need to be identified if there is more than one.
What we need here is the account id.

I do not have access the Coinbase API since I am traveling.  Some of the documentation
in the [rcbatapi repository](https://github.com/Squirrel-hue/rcbatapi) might 
assist with extracting this information.

## Get Payment Methods

``` r
api_key = ""
secret_key = ""

list_payment_methods_var <- interact_SWCB_API_keys(api_key = api_key,
                                            secret_key = secret_key,
                                            method = "GET",
                                            reqPath = "payment-methods")

list_payment_methods_var
```

Once again, you will receive a list of possible payment methods.  I am unable to
access the API right now, so I will need to examine the format more in terms of 
how to extract the information.  But the id for all the payment methods should 
in principle be included in this `list_payment_methods_var`

## Deposit

Hopefully, you should have the `Payment Methods id` from which you wish to 
deposit and the `Account id` into which you wish to deposit. With this, you 
should be ready to deposit.

Using the above API and secret keys, something like the following code should 
permit the deposit an amount of $10 in USD to an account to be specified.

``` r
amount <- "10"
currency <- "USD"
payment_method <- "" #Use payment method id from above.
account_deposit_id <- "" #Use account id from above for account into which deposit was desired.

payload <- paste0('{\"amount\":\"',amount,'\",\"currency\":\"',currency,'\",\"payment_method\":\"',payment_method,'\"}')

rsiwcbapi::interact_SWCB_API_keys(api_key = api_key,
                                  secret_key = secret_key,
                                  method = "POST",
                                  reqPath = paste0("accounts/",
                                                   account_deposit_id,"/deposits"),
                                  body = payload)

```

**I have not tested any of this.  This is offered without any guarantee.**
