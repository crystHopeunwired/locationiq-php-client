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
    api_instance = openapi_client.MatchingApi(api_client)
    coordinates = '-0.16102,51.523854;-0.15797,51.52326;-0.161593,51.522550' # str | String of format {longitude},{latitude};{longitude},{latitude}[;{longitude},{latitude} ...] or polyline({polyline}) or polyline6({polyline6}). polyline follows Google's polyline format with precision 5
generate_hints = 'false' # str | Adds a Hint to the response which can be used in subsequent requests, see hints parameter. Input Value - true (default), false Format - Base64 String (optional)
approaches = 'curb;curb;curb' # str | Keep waypoints on curb side. Input Value - {approach};{approach}[;{approach} ...] Format - curb or unrestricted (default) (optional)
exclude = 'toll' # str | Additive list of classes to avoid, order does not matter. input Value - {class}[,{class}] Format - A class name determined by the profile or none. (optional)
bearings = None # str | Limits the search to segments with given bearing in degrees towards true north in clockwise direction. List of positive integer pairs separated by semi-colon and bearings array should be equal to length of coordinate array. Input Value :- {bearing};{bearing}[;{bearing} ...] Bearing follows the following format : bearing {value},{range} integer 0 .. 360,integer 0 .. 180 (optional)
radiuses = None # str | Limits the search to given radius in meters Radiuses array length should be same as coordinates array, eaach value separated by semi-colon. Input Value - {radius};{radius}[;{radius} ...] Radius has following format :- double >= 0 or unlimited (default) (optional)
steps = 'true' # str | Returned route steps for each route leg [ true, false (default) ] (optional)
annotations = 'false' # str | Returns additional metadata for each coordinate along the route geometry.  [ true, false (default), nodes, distance, duration, datasources, weight, speed ] (optional) (default to 'false')
geometries = 'polyline' # str | Returned route geometry format (influences overview and per step) [ polyline (default), polyline6, geojson ] (optional) (default to 'polyline')
overview = 'simplified' # str | Add overview geometry either full, simplified according to highest zoom level it could be display on, or not at all. [ simplified (default), full, false ] (optional) (default to 'simplified')
timestamps = '200;300;900' # str | Timestamps for the input locations in seconds since UNIX epoch. Timestamps need to be monotonically increasing. [ {timestamp};{timestamp}[;{timestamp} ...]  integer seconds since UNIX epoch (optional)
gaps = 'split' # str | Allows the input track splitting based on huge timestamp gaps between points. [ split (default), ignore ] (optional) (default to 'split')
tidy = 'false' # str | Allows the input track modification to obtain better matching quality for noisy tracks. [ true, false (default) ] (optional) (default to 'false')
waypoints = '0;1;2' # str | Treats input coordinates indicated by given indices as waypoints in returned Match object. Default is to treat all input coordinates as waypoints. [ {index};{index};{index}... ] (optional)

try:
    # Matching Service
    api_response = api_instance.matching(coordinates, generate_hints=generate_hints, approaches=approaches, exclude=exclude, bearings=bearings, radiuses=radiuses, steps=steps, annotations=annotations, geometries=geometries, overview=overview, timestamps=timestamps, gaps=gaps, tidy=tidy, waypoints=waypoints)
    pprint(api_response)
except ApiException as e:
    print("Exception when calling MatchingApi->matching: %s\n" % e)