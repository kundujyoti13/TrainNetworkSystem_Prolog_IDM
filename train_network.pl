/** train_network.pl Train Network Reasoning System

This files encodes the solutions for Exercises 2-5

Write your solutions in the corresponding places below.
NOTE: Do not load/consult the database encoding a specific network system here
You can consult the particular database separately, as this file should work with ANY
database.

@author <your student name and email>
@license GPL
*/

/** Exercise 1

This should be done in markdown file EXERCISE_01.md, not here.
*/



/** Exercise 2

Write below your solution by defining well_formed/1, non_redundant/1, and acceptable/2
*/

well_formed(City_list):-
    City_list = [HeadCity|TailCity],
    TailCity = [HeadCity2|X],
    link(HeadCity, HeadCity2, _, _),
    well_formed(TailCity).

  %  It is calling well formed and checking lenght
well_formed(City_list2) :-
        (length(City_list2, ListLenght), ListLenght < 3) ->
        (
        City_list2 = [HeadCity3|TailCity3],
        TailCity3 = [HeadCity4|A],
        link(HeadCity3, HeadCity4, B, C)).

%  It is checking non_redundant base condition

non_redundant([_]).

%  It is checking non_redundant  condition for list of cities
non_redundant([H | T]) :-
\+ member(H, T),
non_redundant(T). 


%  It is checking acceptable  condition for list of cities
acceptable(Path, Type, Duration) :-
  check_totalTime(Path,Type,Duration),
  well_formed(Path),
  non_redundant(Path).

%  It is skipping first city, i.e. origin

  check_totalTime([HeadCity|TailCity],Type,Duration) :-
    check_sum_duration(TailCity,Type,StopoverTime),
    StopoverTime =< Duration.

  check_sum_duration([], _, 0).

%  It is checking if city is last
  check_sum_duration([LastCity], _, 0) :- !.

%  It is checking stopover time  condition for list of cities
  check_sum_duration([HeadCity|TailCity], Type, StopoverTime) :-
    city(HeadCity, Stops),
    member(stop(Type, SingleStopOverTime), Stops),
    %Checking stopover time from city predicate
    check_sum_duration(TailCity, Type, LeftStopoverTime),
    StopoverTime is SingleStopOverTime + LeftStopoverTime.


/** Exercise 3

Write below your solution by defining route/6
*/
% A route will be described by the list of cities it traverses.

route(Origin, Origin, TrainType, Path, Length, Duration):-
    Path = [Origin],
    Length is 0,
    Duration is 0.
% route method that calls findroute, findlenght and route_duration methods further
route(Origin, Destination, TrainType, Path, Length, Duration):- 
    train(TrainType, MaxSpeed), 
    findroute(Origin, Destination,[Origin],Path),
    findlength(Path, Length),
    route_duration(Path, TrainType, 0 ,Duration).
      
  % findroute method  is taking Origin, Destination,ListCityPath,FinalPath as param here and appending to list for base case
  findroute(Origin, Destination,ListCityPath,FinalPath):-
    link(Origin, Destination, _, _),
    append( ListCityPath,[Destination], FinalPath),
    non_redundant(FinalPath).

 % Recursive use case of findroute method  is taking Origin, Destination,ListCityPath,FinalPath 
  findroute(Origin, Destination,ListCityPath,FinalPath):-
    link(Origin, X, _, _),
    \+ member(X, ListCityPath),
    append( ListCityPath,[X], Fullcitypath),
    findroute(X,Destination,Fullcitypath,FinalPath).

   % the length of a route is simply the sum of the lengths of the links traversed by this route.
    findlength([City1, City2], Length) :-
        link(City1, City2, _, Length).
   % Find length using links and return updated length
    findlength([City1, City2|Rest], Length):-
        link(City1, City2, _, LinkLength),
        findlength([City2|Rest], RestLength),
        Length is LinkLength + RestLength. 

    % the duration of a given route is depended on the speed limit of speed on each  connected link,
    % the maximum speed at which a particular train can travel, and the stop-over in intermediate cities.

    route_duration([City1, City2|[]], TrainType, AccDuration, Duration):-
            train(TrainType, MaxSpeed),
            link(City1, City2, SpeedLimit, Length),
            %Fidning min speed to use
            findmin(MaxSpeed, SpeedLimit, MinSpeed),
            LinkDuration is Length / MinSpeed,
            Duration is AccDuration+LinkDuration.   
 % Iterative use case to find route duration
    route_duration([City1, City2|Rest], TrainType, AccDuration, Duration) :-
                train(TrainType, MaxSpeed),
                link(City1, City2, SpeedLimit, Length),
                findmin(MaxSpeed, SpeedLimit, MinSpeed),
                %Cal link duration from lenght and speed
                LinkDuration is Length / MinSpeed,
                city(City2, Stops),
                member(stop(TrainType, Stopovertime), Stops), 
                %Calculating stopover time from city predicate
                TotalDuration is AccDuration+ LinkDuration + (Stopovertime/60),
                route_duration([City2|Rest], TrainType, TotalDuration, Duration).   
 % Find the minimum from Max and SpeedLimit
    findmin(MaxSpeed, SpeedLimit, MinSpeed) :-
                    MaxSpeed < SpeedLimit,
                    MinSpeed is MaxSpeed.
    findmin(MaxSpeed, SpeedLimit, MinSpeed) :-
                    MaxSpeed >= SpeedLimit,
                    MinSpeed is SpeedLimit.  
    


/** Exercise 4

Write below your solution by defining bounded_route/7
*/ 
route_duration_LimitCheck([City1, City2|[]], TrainType, Limit, AccDuration, Duration):-
    train(TrainType, MaxSpeed),
    link(City1, City2, SpeedLimit, Length),
    %Fidning min speed to use
    findmincheck(MaxSpeed, SpeedLimit, MinSpeed),
    LinkDuration is Length / MinSpeed,
    Duration is AccDuration+LinkDuration.   
% Iterative use case to find route duration and exit if limit is greater than duration
route_duration_LimitCheck([City1, City2|Rest], TrainType, Limit, AccDuration, Duration) :-
    train(TrainType, MaxSpeed),
    link(City1, City2, SpeedLimit, Length),
    findmincheck(MaxSpeed, SpeedLimit, MinSpeed),
    % Calculate link duration from length and speed
    LinkDuration is Length / MinSpeed,
    city(City2, Stops),
    member(stop(TrainType, Stopovertime), Stops),
    % Calculate stopover time from city predicate
    TotalDuration is AccDuration + LinkDuration + (Stopovertime/60),
     % exit if limit is greater than duration
    TotalDuration < Limit,
    route_duration_LimitCheck([City2|Rest], TrainType, Limit, TotalDuration, Duration).

  % Find the minimum from Max and SpeedLimit
  findmincheck(MaxSpeed, SpeedLimit, MinSpeed) :-
                    MaxSpeed < SpeedLimit,
                    MinSpeed is MaxSpeed.
  findmincheck(MaxSpeed, SpeedLimit, MinSpeed) :-
                    MaxSpeed >= SpeedLimit,
                    MinSpeed is SpeedLimit.  

/**  Here , it will check in route the limit and duration*/

  route_check(Origin, Origin, TrainType, Limit,Path, Length, Duration):-
      Path = [Origin],
      Length is 0,
      Duration is 0.
  % route method that calls findroute, findlenght and route_duration methods further
  route_check(Origin, Destination, TrainType, Limit,Path, Length, Duration):- 
      train(TrainType, MaxSpeed), 
      findroute(Origin, Destination,[Origin],Path),
      findlength(Path, Length),
      /**  Here , passed the  limit to route_duration_LimitCheck */
      route_duration_LimitCheck(Path, TrainType, Limit,0 ,Duration).

/*Write below your solution by defining bounded_route/7 */ 
    bounded_route(Origin, Destination, TrainType, Limit,  Path, Length, Duration):-
     % Here Limit  is greater  than zero 
     Limit >0,
      % I do find a route between given origin and destination
     route_check(Origin, Destination, TrainType, Limit, Path, Length, Duration),
      % Duration is less than Limit 
     Duration < Limit.

 
 /** Exercise 5
 
 Write below your solution by defining fastest_route/6
 */
     /** Exercise 5
     
     Write below your solution by defining fastest_route/6
     */
    
% Helper class as predicate that iteratively searches for the fastest route with a given depth limit
fastest_route_finder(Origin, Destination, TrainType, Path, Length, Duration, DepthLimitValue) :-
  % Base case  is:  if depth limit is 0, return failure
  DepthLimitValue = 0,!, fail. 
% Recursive case is : if depth limit is greater than 0, continue searching
fastest_route_finder(Origin, Destination, TrainType, Path, Length, Duration, DepthLimitValue) :-
  % Check condtion if there's a route from Origin to Destination with the given TrainType
  route(Origin, Destination, TrainType, Path, Length, Duration),
  % Check condition if the duration of the route is less than the current best-known duration
  \+ (bounded_route(Origin, Destination, TrainType, Duration, _, _, _)),
  % If matches, yes, return current route
  !.  
% If  route is not found by given depth limit value, code retry again with a greater depth limit value
fastest_route_finder(Origin, Destination, TrainType, Path, Length, Duration, DepthLimitValue) :-
  DepthLimitValue > 0,
  NewDepthLimitValue is DepthLimitValue - 1,
  fastest_route_finder(Origin, Destination, TrainType, Path, Length, Duration, NewDepthLimitValue).  
fastest_route(Origin, Destination, TrainType, Path, Length, Duration) :-
  DepthLimitValue = 1,
  fastest_route_finder(Origin, Destination, TrainType, Path, Length, Duration, DepthLimitValue).


