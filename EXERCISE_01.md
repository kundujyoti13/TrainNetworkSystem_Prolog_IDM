# Queries for Exercise 1

Write your answer queries below. 

Keep the formatting, do not change question text or their ordering. Also, when writing code use proper Markdown code format, either inline `like this text` or in a Prolog block like the following one:

```prolog
example(X) :- format("Value of variable X: ~w", [X]).
```

## 1. What links have a speed limit of 100 km/h or less?

```prolog
?- link(City1, City2, SpeedLimit, Lenght), SpeedLimit =< 100.
City1 = 'North Bay',
City2 = 'Sudbury',
SpeedLimit = 90,
Lenght = 150 ;
City1 = 'Brantford',
City2 = 'Kitchener',
SpeedLimit = 100,
Lenght = 30 ;
false.
```

## 2. What cities are directly connected to Toronto?

```prolog
?- link('Toronto', CityName, _, _ ).
CityName = 'Kitchener' ;
CityName = 'North Bay' ;
CityName = 'Kingston' ;
CityName = 'Hamilton'.
```

## 3. What pairs of distinct cities can be connected using exactly two links? (Only show the first five answers when running the query.)

```prolog
?- limit(5, (link(City1, ConnectedViaCity, _, _), link(ConnectedViaCity, City2, _, _), City1 \= City2)).

City1 = 'Montreal',
ConnectedViaCity = 'Sherbrooke',
City2 = 'Quebec City' ;
City1 = 'Sherbrooke',
ConnectedViaCity = 'Quebec City',
City2 = 'Montreal' ;
City1 = 'Quebec City',
ConnectedViaCity = 'Montreal',
City2 = 'Sherbrooke' ;
City1 = 'Quebec City',
ConnectedViaCity = 'Montreal',
City2 = 'Alexandria' ;
City1 = 'Quebec City',
ConnectedViaCity = 'Montreal',
City2 = 'Cornwall'
```

## 4. On which links can a passenger train travel at its maximum speed?

```prolog
?-  link(City1, City2, TrainSpeed,Length ), not((train('Passenger', PassengerMaxSpeed), 
TrainSpeed < PassengerMaxSpeed  )).
City1 = 'Quebec City',
City2 = 'Montreal',
TrainSpeed = 200,
Length = 270 ;
City1 = 'Montreal',
City2 = 'Cornwall',
TrainSpeed = 200,
Length = 100 ;
City1 = 'Cornwall',
City2 = 'Brockville',
TrainSpeed = 210,
Length = 100 ;
City1 = 'Brockville',
City2 = 'Kingston',
TrainSpeed = 230,
Length = 80 ;
City1 = 'Kingston',
City2 = 'Toronto',
TrainSpeed = 250,
Length = 260 ;
City1 = 'Toronto',
City2 = 'Kitchener',
TrainSpeed = 200,
Length = 100 ;
City1 = 'Kitchener',
City2 = 'London',
TrainSpeed = 200,
Length = 95 ;
City1 = 'London',
City2 = 'Chatham',
TrainSpeed = 200,
Length = 105 ;
City1 = 'Montreal',
City2 = 'Quebec City',
TrainSpeed = 200,
Length = 270 ;
City1 = 'Cornwall',
City2 = 'Montreal',
TrainSpeed = 200,
City2 = 'Kingston',
TrainSpeed = 250,
Length = 260 ;
City1 = 'Kitchener',
City2 = 'Toronto',
TrainSpeed = 200,
Length = 100 ;
City1 = 'London',
City2 = 'Kitchener',
TrainSpeed = 200,
Length = 95 ;
City1 = 'Chatham',
City2 = 'London',
TrainSpeed = 200,
Length = 105 ;
false.

```

## 5. Which city is the closest one to Toronto?

```prolog
?- link(City1, 'Toronto', _, CloseLength), 
not((link(City2, 'Toronto', _, City2Length), City2Length < CloseLength)).

City1 = 'Hamilton',
CloseLength = 60 ;
false.
```
