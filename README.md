[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-c66648af7eb3fe8bc4f294546bfd86ef473780cde1dea487d3c4ff354943c9ae.svg)](https://classroom.github.com/online_ide?assignment_repo_id=10522393&assignment_repo_type=AssignmentRepo)
# Train Network System Assignment Specification

You must read fully and carefully this assignment specification and instructions detailed in this file. You are NOT to modify this file in any way.

This is an **individual** assignment. It has 100 points in total and is worth 20% of the overall course grade. You may not collude with any other individual, or plagiarise their work. Students are expected to  present the results of their own thinking and writing. Never copy another student’s work (even if the other student "explains it to you first.") and never give your written work to others. Never copy from the web or any other resource. Remember you are meant to generate the solution to the questions by yourself. Suspected collusion or plagiarism will be dealt with according to RMIT University policy.

* **Course:** COSC2780/2973 Intelligent Decision Making @ Semester 1, 2023
* **Instructor:** Prof. Sebastian Sardina
* **Deadline:** Sunday April 2nd, 2023 @ 11:59pm (end of Week 5)
  * **Preliminary (exercises 1+2; for 2% bonus):** Sunday March 19th, 2023 @ 11:59pm (end of Week 3)
* **Course Weight:** 30%
* **Assignment type:** Individual (or groups of two students with approval from instructor)
* **CLOs covered:** 1-4
* **Submission method:** by git tagging `final` (before deadline). Use tag `preliminary` if submitting a preliminary submission

The purpose of this project is familiarise yourself with declarative logic programming for problem solving and knowledge-intensive decision making, and to get you used to thinking as a "logic programmer".

In particular, the project involves incrementally building a system to reason about a train network system, so that decisions are made on how to route trains can be supported.

 <p align="center">
    <img src="logo-mel.png" alt="logo project" width="400">
    <img src="rmitlogo.png" alt="logo rmit" width="400">
 </p>

-------------------

## Overview

This assessment can be done individually or in a group of two students.

**Your task** is to develop an train network system to support route decision making for different trains in a map, by completing the various exercises below.

You should only edit files [`EXERCISE_01.md`](EXERCISE_01.md), [`network_ontario.pl`](network_ontario.pl), and [`train_network.pl`](train_network.pl). Submitted Prolog files should compile/consult & run error-free in [SWI-Prolog](https://www.swi-prolog.org/). The code submitted should be internally commented at high standards and be error-free and _never crash_. See below for more information on language restrictions and general guidelines for quality work.

**Corrections:** From time to time, students or staff find errors (e.g., typos, unclear instructions, etc.) in the assignment specification. In that case, a corrected version of this or other files will be produced, announced, and distributed for you to commit and push into your repository.  Because of that, you are NOT to modify this specification file in any way to avoid conflicts.

**Submissions:** You must submit by _tagging_ the commit you want to submit and be marked. The final submission should use tag `final` and be performed in the `main` branch (so if you were working one branch, you should merge to `main`). We will clone your repo at exactly that tag in the history. The tagging should be performed before the deadline. Remember that a git _tag_ is a name given to a specific commit in your git history. It is NOT a branch nor a commit message nor a release (none of these will be be counted as tags and no marking will be done on them). For more info on (re)tagging, please read [this question](https://github.com/RMIT-COSC2780-IDM23/IDM23-DOC/blob/main/FAQ-GIT.md#how-do-i-change-the-submission-tag-if-i-have-already-tagged-one-commit-for-submission).

**Late submissions & extensions:** A penalty of 10% of the maximum mark per day will apply to late assignments. Extensions will only be permitted in _exceptional_ circumstances under RMIT policy (e.g., health or unexpected emergency issues). A heavy load, other course assessments, or other commitments outside are not grounds for extensions; students should manage their time and workload accordingly.

**We are here to help!:** But we don't know you need help unless you tell us. We expect reasonable effort from your side, but if you get stuck or have doubts, please seek help (lectures, workshops, forum, consultation time). Remember, if in doubt whether a questions is appropriate, you can make a _PRIVATE_ post a to the teaching staff.

**Silent Policy:** A silent policy will take effect 2 days before this assignment is due. This means that no question about this assignment will be answered, whether it is asked on the newsgroup, by email, or in person after that time.

### Basic rules & guidelines

When developing and submitting a solution, please make absolutely sure you adhere to the following base rules and guidelines:

* You must ALWAYS keep your fork **private** and **never share it** with anybody in or outside the course, except your teammates, _even after the course is completed_. You are **not allowed to make another repository copy outside the provided GitHub Classroom** without the written permission of the teaching staff.

* Your code **must compile and run _error-free_ on [SWI-Prolog](https://www.swi-prolog.org/)**. Staff will not debug/fix any code. If your code crashes, it will attract zero marks and will not warrant re-submission. See [`GENERAL_GUIDELNES.md`](GENERAL_GUIDELINES.md) for general guidelines and recommendations.

* If you are in a group, you must **use your project Github** repository and GitHub team to collaborate among the members. The group will have write access to the same repository, and also be members of a GitHub team, where members can, and are expected to, engage in discussions and collaboration.

### Language restrictions and guidelines

For this project, **you may not use** `forall/2`, `functor`, `arg`, `=..`, `assert/1`, `retract/1`, `fail/0` or any extra logical or advanced predicate like `findall/n`, `setof/n`, `once/1`, etc.

Nevertheless, **you may use** `=/2`, `\=/2`, `\+/1`, arithmetic symbols, and parentheses for grouping, as well as basic built-in predicates like `member/2`, `append/3`, or `length/2`. You are also allowed to use the _if-then-else_ operator `->` in combination with `;`, and the _cut_ operator `!`, but be very careful and limited in their use (they often subvert the pure logic programming paradigm and may have unexpected consequences in your code).

If you’re in doubt about whether you can use a particular feature or built-in predicate of SWI-Prolog, please **consult us in the forum.**

When printing/showing solutions, you should do it _via the built-in Prolog answering system_ (binding of variables) and _not_ by printing it using predicates like `writeln/1`. For testing and debugging, you may want to use predicates like `writeln/1`, but these have to be removed prior to submission.

Remember and refer to the [argument modes](https://www.swi-prolog.org/pldoc/man?section=preddesc) specify the "direction in which information carried by a predicate argument is supposed to flow" (e.g., `?` means the argument may or may not be instantiated, while `-` refers to an expected output of the predicate).

For other general guidelines and recommendations, please  check [`GENERAL_GUIDELNES.md`](GENERAL_GUIDELINES.md).

## Marking guidelines

Exercises will be automarked, and inspected manually to guarantee guidelines have been followed (e.g., no forbidden built-in predicates have been used). Both can affect the final result, but only the automarker can award points.

* Points system will be used; some test cases can award or deduct points; manual inspection can only deduct points. This means that the submitted code must pass tests to collect points.
* Code that does not compile or run error-free will not be marked, will attract zero marks, and will not be warrant for re-submission.
* We will use a different train network than the one given here to test your code. Your solutions are expected to work for _any_ legal train network configuration.
* Many aspects, at automarking and manual inspection, will be taken into consideration when judging a solution to a predicate, including for example whether:
  * it yields the correct answers and respects the restrictions;
  * it yields wrong answers (answers that should not be there);
  * it respects parameters' modes and is as general as possible;
  * it returns in reasonable amount of time;
  * it is properly indented (e.g., putting every subgoal on a new line is a good idea), documented, and easy to read/understand;
  * it uses only legal SWI-Prolog features and predicates;
  * it yields redundant answers multiple times;
  * it uses unification adequately;
  * it uses intuitive names for variables and predicates;
  * it uses singleton variables;
  * etc.

Remember also, simpler, shorter code generally receives more marks than _unnecessary_ long code... :-)

### Good SE & Git practices

Finally, we  will inspect the commit history in your **remote repo** to check for quality and professional SE practices and evidence of meaningful contributions,  including good use of Git version control during your development. Please refer to the course [SE and Git Best Practice](SE-PRACTICES.md) page. Note that because this is an individual assessment, the team-related information there is not relevant here.

Note that the results of these checks can affect the overall individual marks significantly, as point deductions may be applied when poor SE practices have been used or no clear evidence of contributions can be found. For example, few commits with a lot of code changes, or no or poor communication in the corresponding GitHub team may result in deductions, even if the performance of the submission is excellent. **We reserve the right to call for team and/or individual interviews when needed.** The interview can affect the final mark of the team or of an individual.

## Academic Integrity

This is an advanced course, so we expect full professionalism and ethical conduct. Because it is small, the teaching staff is well aware of each student contributions.

Plagiarism, or just cheating, is a serious offense. Please **don't let us down and risk our trust**.  If you do, we will pursue the strongest consequences available to us according to the **University Academic Integrity policy**. In a nutshell, **never look at solution done by others**, either in (e.g., classmate) or outside (e.g., web) the course: they have already done their learning, this is your opportunity! If you refrain from this behavior, you are safe.

Please refer to the course [Academic Integrity](ACADEMIC_INTEGRITY.md) page for more information, including when [integrity when dealing with code](CODE-INTEGRITY.md). You must read this and be fully aware of the "rules of the game"; not reading it will not be an excuse.

Whenever in doubt whether something is acceptable or not, contact the teaching staff to discuss and check. They will appreciate you checking beforehand.

We expect enrolled students/learners to take full **ownership** of their work and **respect** the work of teachers and other fellow students. Any behaviour or code providing an unfair advantage or causing harm will be treated very seriously. We trust you, do not let us down.

### Course Code of Honour & Fair Play

We expect every RMIT student taking this course to adhere to the **Course Code of Honour** under which every learner-student should:

* Submit their own original work.
* Do not share answers with others.
* Report suspected violations.
* Not engage in any other activities that will dishonestly improve their results or dishonestly improve or damage the results of others.

If you are in doubt of whether something would break the good spirit of the project, you must check with us early, not wait to be discovered. Remember: **we are here to help you learn**, so _**help us to help you!**_

-------------------------

## Exercise 1: Train Network System Database - 5%

A database can be naturally represented in Prolog as a set of facts. Create a Prolog database to hold all the information in file [train.data](trainCanada.data) regarding links, stop-overs, and train types. You may need to do some syntax adaptations to fit Prolog syntax.

Then, relying on your design for the train Prolog database, you are to provide the following interface to it:

The query

```prolog
?- link(From, To, SpeedLimit, Length).
```

must produce all the possible links in both directions with the speed limit in km/h and the length in km. Note that your database should only list each link once.

The query

```prolog
?- city(City, StopOvers).
```

must produce all the cities with the stop-over times in minutes. Here `StopOvers` is a list of terms `stop(TrainType, Time)`, where `TrainType` is the type of the train and `Time` is the stop-over time in minutes.

The query

```prolog
?- train(Type, MaxSpeed).
```

must produce both train types with their maximum speed in km/h.

Here is an example of a query and its result for the given database:

```prolog
?- link(toronto,X,150,Z).
X = north_bay,
Z = 350 ;
X = hamilton,
Z = 60.
```

If instead of `150` in the third argument you use a Prolog variable, you should get more connections.

Build and place your knowledgebase in the Prolog file [`network_ontario.pl`](network_ontario.pl).

Then, for each of questions listed below, write a Prolog query (not a predicate!) that will answer the question using the interface `link/4`, `city/2`, and `train/2` defined above. For this task, you may not use helper predicates or the exclusions mentioned above (see Language Restrictions). Note that your queries must still work if we are given a different train data file for a different train system with the same interface. For each, show the query and its result when you run it. Remember you can run over all solutions of a query by pressing `;` after each solution.

1. What links have a speed limit of 100 km/h or less?
2. What cities are directly connected to Toronto?
3. What pairs of distinct cities can be connected using exactly two links? (Only show the first five answers when running the query.)
4. On which links can a passenger train travel at its maximum speed?
5. Which city is the closest one to Toronto?

Place your answers in file [`EXERCISE_01.md`](EXERCISE_01.md).

### Additional task for teams

If you are doing this in a team, as part of this exercise, you should also produce at least one interesting network instance that you plan to use for testing. You can use a totally fictitious network or rely on any existing real-world network. Use file name [`test_network.pl`](test_network.pl) to encode your test network.

Using file [`test_network.md`](test_network.md), explain what interesting features your network have, and how it is a good network to test your system effectively. You may modify your network example as you progress in the project and re-submit this part in the final submission.

## Exercise 2: Basic path reasoning tools - 5%

A **route path** will be described by the list of cities it traverses. For example, if we plan a freight train route from Toronto to Ottawa via Kingston and Brockville, we would write this route as a list `[toronto,kingston,brockville,ottawa]`.

In this part you should implement the following predicate tools:

- `well_formed/1`, where `well_formed(++Path)` is true whenever `Path` is a well-formed legal path, in that there is a indeed link in the network between each consecutive cities in the path.
- `non_redundant/1`, where `non_redundant(++Path)` is true whenever `Path` is _non-redundant_, in that it has no unnecessary loops, that is, it never goes through the same city more than once.
- `acceptable/3`, where `acceptable(++Path, ++Type, ++Duration)` is true whenever `Path` is a well-formed and non-redundant path and with no stop-over longer than `Duration` minutes for a train of type `Type`.

Place your answers in file [`train_network.pl`](train_network.pl).

## Exercise 3: Basic routes - 30%

In this exercise and the following ones, we will extend the train railway knowledge developed above. In particular, you are going to write Prolog code that will find ways to plan routes for freight and passenger trains on our railway system. The same language restrictions apply---consult the forum if in doubt. Your code for all the exercises should work for _any_ train network specified via the interface in Exercise 1, namely, `link/4`, `city/2`, and `train/2`.

First some definitions and notation:

* **Route Path:** a route will be described by the list of cities it traverses. For example, if we plan a freight train route from Toronto to Ottawa via Kingston and Brockville, we would write this route as a list `[toronto,kingston,brockville,ottawa]`.
* **Route Length:** the length of a route is simply the sum of the lengths of the links traversed by this route. The length is always an integer and is expressed in km.
* **Route Duration:** the duration of a route depends on the speed limit on each link, the maximum speed at which a particular train can travel, and the stop-over in intermediate cities.
  * For example, a freight train may go up to a certain speed because it costs too much in fuel to travel any faster, and reducing costs is a key concern for freight trains. Passenger trains, on the other hand, are much lighter and the priority is to get the passengers to a destination as fast as possible, so they may be allowed to travel faster.
  * The speed limit on each link indicates how fast any train can travel on that link without risk of derailing. When you calculate the duration of a route, assume that trains always travel as fast as possible on each link, that is, at the least of their own maximum speed and the link's speed limit.
  * Thus, the duration of a route is the sum of the time it takes to traverse each link, plus the stop-over time at each city in the path, excluding the end points.
  * Note that stop-overs are time stopping in a city _on the way to another destination_. If it is zero (0), it means there is no stop-over time in such city. However, the train can have that as the actual destination (or origin). That is why we do not account for stop-overs at the two endpoints.
  * Finally, the duration is expressed in hours and always as a float. To make sure and expression yields a float, one can always add `0.0` (e.g., `X is 3 + 0.0` will yield `X = 3.0`).

In the most classical use case, when planning a route for a particular train, we have an origin city, a destination city, and the type of train we are planning this route for. Given these as input, we would like to find a route and give its path, length and duration. Other times, we may have the origin city and the train type, and would like to extract all possible destinations that could be reached from that city (and how). Yet other times, we may be interested to know all the possible paths for a given train type.

Write a predicate `route/6`:

```prolog
route(?Origin, ?Destination, ?TrainType, -Path, -Length, -Duration)
```

that holds _iff_ `Path` is a _non-redundant_ path from `Origin` to `Destination` of length `Length` which would take `Duration` hours for a train of type `TrainType` to traverse.

A _non-redundant path_ is one which has no unnecessary loops, that is, it never goes through the same city more than once from the origin to the destination.

For example, the query:

```prolog
?- route(toronto, montreal, Type, Path, Length, Duration).
```

would yield, as one of a number of answers:

```prolog
Type = passenger
Path = [toronto, north_bay, ottawa, cornwall, montreal]
Length = 880
Duration = 6.133333333333333
```

while the following query would yield just one answer:

```prolog
?- route(montreal, montreal, freight, Path, Length, Duration).
Path = [montreal]
Length = 0
Duration = 0
```

Place your answers in file [`train_network.pl`](train_network.pl).

## Exercise 4: Bounded routes - 30%

The `route/6` predicate above is useful in finding _a_ route between two cities, but it has a severe limitation for decision making use, in that it doesn't discriminate between fast and slow routes. In our railway planning, we want to find the fastest route, or at least a reasonably fast route.

Write a predicate `bounded_route/7`:

```prolog
bounded_route(?Origin, ?Destination, ?TrainType, ++Limit, -Path, -Length, -Duration)
```

which works like `route/6` but only holds if `Duration` is less than `Limit`.

For example:

```prolog
?- bounded_route(toronto, montreal, passenger, 8, Path, Length, Duration).
Path = [toronto, kingston, brockville, cornwall, ottawa, alexandria, montreal],
Length = 720,
Duration = 4.461111111111111 ;
Path = [toronto, kingston, brockville, ottawa, alexandria, montreal],
Length = 650,
Duration = 4.161111111111111 ;
Path = [toronto, north_bay, ottawa, alexandria, montreal],
Length = 900,
Duration = 6.0777777777777775 ;
Path = [toronto, kingston, brockville, cornwall, montreal],
Length = 540,
Duration = 2.966666666666667 ;
Path = [toronto, north_bay, ottawa, brockville, cornwall, montreal],
Length = 1010,
Duration = 6.933333333333333 ;
Path = [toronto, kingston, brockville, ottawa, cornwall, montreal],
Length = 630,
Duration = 4.216666666666667 ;
Path = [toronto, north_bay, ottawa, cornwall, montreal],
Length = 880,
Duration = 6.133333333333333 ;
false.
```

While you are not meant to go beyond reasonable limits and you should stay within the language restrictions, your solution needs to be reasonably efficient and not based on mere brute force. Consider your system may be used in huge networks with lots of connections! ;-)

However, it is very interesting to think first what would be the shortest, simplest, solution for this predicate, *can you say?*

Place your answers in file [`train_network.pl`](train_network.pl).

## Exercise 5: Fastest routes - 30%

To obtain the fastest route between two cities in an efficient manner, we could employ an _iterative_ search technique based on the following idea: given a known best-so-far route, we can try to find a faster route, which will become the new best-so-far route, and so on until we find the fastest one.

Write a predicate `fastest_route/6`:

```prolog
fastest_route(?Origin, ?Destination, ?TrainType, -Path, -Length, -Duration)
```

which holds _iff_ `Path`, `Length` and `Duration` describe the *fastest* route from `Origin` to `Destination` for a train of type `TrainType`. This predicate should use the iterative search technique described above and use `route/6` and `bounded_route/7` implemented above.

For example:

```prolog
$ fastest_route(toronto, montreal, passenger,  Path, Length, Duration).
Path = [toronto, kingston, brockville, cornwall, montreal],
Length = 540,
Duration = 2.966666666666667.
```

Place your answers in file [`train_network.pl`](train_network.pl).

## Conclusions

This is the end of the project assessment specification.

If you still have doubts about the project and/or this specification do not hesitate asking me the [Course EdStem Discussion Forum](https://edstem.org/au/courses/11583/discussion/) and I will try to address it as quickly as we can. Remember I am here to help you learn!

**I very much hope you enjoy this project and new way of thinking & programming...**

**GOOD LUCK & HAPPY PROLOG!**

Sebastian
