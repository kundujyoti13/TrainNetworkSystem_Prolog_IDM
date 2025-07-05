/** network_ontario.pl Database for Ontario train network

This files encodes the train network knowledge encoding the
network in file trainCanada.data

This knowledgebase should expose link/4, city/3 and train/2.

@author <your student name and email>
@license GPL
*/

% WRITE YOUR SOLUTION BELOW

link_city('Montreal', 'Sherbrooke', 150, 145).
link_city('Sherbrooke', 'Quebec City', 140, 215).
link_city('Quebec City', 'Montreal', 200, 270).
link_city('Montreal', 'Alexandria', 180, 100).
link_city('Alexandria', 'Ottawa', 180, 100).
link_city('Ottawa', 'Cornwall', 120, 80).
link_city('Ottawa', 'Brockville', 120, 110).
link_city('Ottawa', 'North Bay', 150, 350).
link_city('North Bay', 'Sudbury', 90, 150).
link_city('North Bay', 'Toronto', 150, 350).
link_city('Montreal', 'Cornwall', 200, 100).
link_city('Cornwall', 'Brockville', 210, 100).
link_city('Brockville', 'Kingston', 230, 80).
link_city('Kingston', 'Toronto', 250, 260).
link_city('Toronto', 'Kitchener', 200, 100).
link_city('Kitchener', 'London', 200, 95).
link_city('London', 'Chatham', 200, 105).
link_city('Chatham', 'Windsor', 170, 70).
link_city('Chatham', 'Sarnia', 150, 70).
link_city('Sarnia', 'London', 150, 95).
link_city('London', 'Brantford', 180, 80).
link_city('Brantford', 'Kitchener', 100, 30).
link_city('Brantford', 'Hamilton', 130, 40).
link_city('Hamilton', 'Niagara Falls', 120, 70).
link_city('Hamilton', 'Toronto', 150, 60).

link(From, To, SpeedLimit, Length) :-
        (link_city(From, To, SpeedLimit, Length) ; link_city(To, From, SpeedLimit, Length)).
     
city('Montreal', [stop('Freight', 20),stop('Passenger', 15)]).
city('Sherbrooke',[stop('Freight', 0),stop('Passenger', 3)]).
city('Quebec City',[stop('Freight', 10 ),stop('Passenger', 10 )]).
city('Alexandria',[stop('Freight', 0),stop('Passenger', 3)]).
city('Ottawa',[stop('Freight', 10),stop('Passenger', 10)]).
city('Cornwall',[stop('Freight', 0),stop('Passenger', 3)]).
city('Brockville',[stop('Freight', 0),stop('Passenger', 3)]).
city('North Bay',[stop('Freight', 0),stop('Passenger', 5)]).
city('Sudbury',[stop('Freight', 0),stop('Passenger', 5)]).
city('Toronto',[stop('Freight', 20),stop('Passenger', 15)]).
city('Kingston',[stop('Freight', 10),stop('Passenger', 10)]).
city('Kitchener',[stop('Freight', 0),stop('Passenger', 5)]).
city('London',[stop('Freight', 0),stop('Passenger', 8)]).
city('Chatham',[stop('Freight', 0),stop('Passenger', 3)]).
city('Windsor',[stop('Freight', 10),stop('Passenger', 8)]).
city('Sarnia',[stop('Freight', 10),stop('Passenger', 8)]).
city('Brantford',[stop('Freight', 0),stop('Passenger', 3)]).
city('Hamilton',[stop('Freight', 0),stop('Passenger', 5)]).
city('Niagara Falls',[stop('Freight', 0),stop('Passenger', 3)]).

train('Freight', 120).
train('Passenger', 200).






  
  


        

        







