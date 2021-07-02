#TEST CASE-1
Feature: 
    Weather Identifier

Scenario: Call with Valid City Name and Valid Token gives us the weather Update of the City

Given Verb: GET
And HostName: api.openweathermap.org/data/2.5/weather?q=lahore&appid=04cccf0d33c863db428c31fb96533efc
And EndPoint: /data/2.5/weather
And Params: q = lahore, appid = MyAPI'sToken
When Execute the Call
Then Expected Response 200 OK
And Expected message "All Details about the weather"

#TEST CASE-2
Scenario: Call with invalid city name will give us an error

Given Verb: GET
And HostName: api.openweathermap.org/data/2.5/weather?q=lahore&appid=04cccf0d33c863db428c31fb96533efc
And EndPoint: /data/2.5/weather
And Params: q = lahores, appid = MyAPI'sToken
When Execute the Call
Then Expected Response 404 NOT FOUND
And Expected message "City Not Found"

#TEST CASE-3
Scenario: Call with invalid token gives us an error

Given Verb: GET
And HostName: api.openweathermap.org/data/2.5/weather?q=lahore&appid=04cccf0d33c863db428c31fb96533efc
And EndPoint: /data/2.5/weather
And Params: q = lahore, appid = InvalidToken
When Execute the Call
Then Expected Response 401 UnAuthorized
And Expected message "Invalid API Key"


