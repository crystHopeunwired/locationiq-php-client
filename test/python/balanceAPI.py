from __future__ import print_function
import time
import openapi_client
from openapi_client.rest import ApiException
from pprint import pprint

configuration = openapi_client.Configuration()
# Configure API key authorization: key
configuration.api_key['key'] = 'YOUR_API_KEY'
# Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
# configuration.api_key_prefix['key'] = 'Bearer'

# Defining host is optional and default to https://eu1.locationiq.com/v1
configuration.host = "https://eu1.locationiq.com/v1"
# Enter a context with an instance of the API client
with openapi_client.ApiClient(configuration) as api_client:
    # Create an instance of the API class
    api_instance = openapi_client.BalanceApi(api_client)
    
    try:
        api_response = api_instance.balance()
        pprint(api_response)
    except ApiException as e:
        print("Exception when calling BalanceApi->balance: %s\n" % e)