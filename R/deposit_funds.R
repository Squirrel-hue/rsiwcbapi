#' Function to Deposit Funds via Sign In with Coinbase API
#'
#' Remember,
#' Base currency is the first listed (e.g., \code{BTC} in \code{BTC-USD})
#' Quote currency is the last listed (e.g., \code{USD} in \code{BTC-USD})
#'
#' The documentation appears to be wrong, market orders must be specified in
#' quote currencies
#'
#' @param amount Deposit amount
#' @param currency  Currency in which \code{amount} is denominated.
#' @param payment_method ID of payment method to be used for the deposit. List 
#'                       Payment Methods: GET /payment-methods
#' @param commit A boolean, if \code{true} the deposit is to be immediately 
#'               executed. If \code{false}, the the deposit will not be 
#'               immediately executed. In this case, use \code{deposit_commit} 
#'               to execute.
#'   \code{base_size} can be expressed
#' @return A string to pass as payload/body for the Market Immediate-or_Cancel
#' order
#' @export


deposit_funds <- function(amount = "1.00",
                          currency = "USD",
                          payment_method = "",
                          commit = "true",
                          deposit_account_id = ""){

  amount <- amount
  currency = currency

  payload <- paste0('{\"amount\":\"',amount,'\",\"currency\":\"',currency,'\",\"payment_method\":\"',payment_method,'\"}')
  
  rsiwcbapi::interact_SWCB_API_keys(api_key = api_key,
                                    secret_key = secret_key,
                                    method = "POST",
                                    reqPath = paste0("accounts/",
                                                     account_deposit_id,"/deposits"),
                                    body = payload)
  
  
}

