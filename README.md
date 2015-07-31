# Eventsims

## Description
Eventsims is a Ruby package that uses various useful tools in simulating discrete system events based on outcome and probabilities easily. 

## Requirements
* Any version of Ruby

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'eventsims'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install eventsims


## Module name --> Eventsims
It contains four main classes and two methods.

## Module Classes

### Calculate
**Calculate** has six methods for calculating/generating ``probability``, ``estimated variance``, ``estimated mean``, ``estimated standard deviation``, ``expectation value`` and ``discreteEmp``.

Eventsims' "`Calculate` class" takes `two arguments`: ``outcome`` and ``cummulative probability`` or a third optional argument which is `amount of times to be generated` (``steps``). 

#### Methods

Calculate methods are:

* prob() ----> To calculate the probability based on the given outcome list(second argument of the **Calculate** instance).
* discreteemp() ----> To generate a random outcome depending on its probability of occurrence.
* expectval() ----> To generate an expectation value i.e. the mean of the outcome depending on its probability
* estmean() ----> Same as expectval() because they always give the same output.
* estvar() ----> To calculate the estimated variance of the list data
* eststddev ----> To calculate the estimated standard deviation of the list data


#### Usage 
You can use the Calculate class in the following way:

##### Example 1

**Two arguments** 

Usage: Calculate.new(**outcome list**, **cummulative probability list**)


```ruby
require "Eventsims"

a = [-1,0,3,4]
b = [0.1, 0.4, 0.7, 1]

sample = Eventsims::Calculate.new(a, b)

puts "Probability: #{sample.prob()}" 
puts "DiscreteEmp: #{sample.discreteemp()}" 
puts "Expectation value: #{sample.expectval()}" 
puts "Estimated Mean: #{sample.estmean()}" 
puts "Estimated Variance: #{sample.estvar()}" 
puts "Estimated Standard deviation: #{sample.eststddev()}" 
```

##### Result 1


```ruby
Probability: [0.1, 0.3, 0.3, 0.3]
DiscreteEmp: 3
Expectation value: 2.0
Estimated Mean: 2.0
Estimated Variance: 3.6
Estimated Standard deviation: 1.8974
```

##### Example 2

**three arguments**

Usage: Calculate.new(**outcome list**, **cummulative probability list**, "`Optional: amount/steps`")

```ruby
require "Eventsims" 

a = [-1,0,3,4]
b = [0.1, 0.4, 0.7, 1]

sample = Eventsims::Calculate.new(a, b, 10)

puts "Probability: #{sample.prob() }" 
puts "DiscreteEmp: #{sample.discreteemp() }" 
puts "Expectation value: #{sample.expectval() }" 
puts "Estimated Mean: #{sample.estmean() }" 
puts "Estimated Variance: #{sample.estvar() }" 
puts "Estimated Standard deviation: #{sample.eststddev() }"
```

##### Result 2

```ruby
Probability: [0.1, 0.3, 0.3, 0.3]
DiscreteEmp: [3, 0, 4, 4, 4, 4, 3, 0, 0, 0]
Expectation value: 20.0
Estimated Mean: 20.0
Estimated Variance: 36.0
Estimated Standard deviation: 6.0
```


> **argument one** of the Calculate class should be the **outcome** list while **argument two** should be the **cummulative probability** list. **Argument three (steps)** is optional and only needed if any of the data is to be calculated after a certain number of times or to generate a list of discreteEmp values. 

> If no optional argument is given (same as if an optional argument is set to 1), discreteemp will generate only one outcome but if more the optional argument is more than one e.g. 5, then *discreteemp* will generate a list containing several generated outcomes (5 items in a list in this case).



### Generate

**Generate** takes integer values as arguments (from `no arguments` up to and including `five arguments`) with optional `string` arguments being **"r"** or **"s"**. **r** for **reverse (descending order) ** sorting and **s** for **ascending order** sorting. It has five methods which can be called on its instance namely:

#### Methods

* outcome() ----> generate outcomes based on the inputs supplied as arguments.
* unique() ----> generate unique outcomes based on the inputs supplied as arguments. You can think of it as a *set* of the outcome() method result.
* occur() ----> generate the number of times a unique item is found.
* getprob() ----> generate the probability of the outcome with respect to the unique outcome.
* getcum() ----> generate the cummulative probability of occurrence with respect to the unique outcome.


#### Usage

You can use the Generate class in the following ways:

> The following examples will cover how arguments are used in the Generate class. In the examples, we assume that the class has been required first as

```ruby
require "Eventsims"
```


##### Example 1a

**zero arguments**

Usage: Eventsims::Generate.new()

What this does is populate the outcome list with random values (between 0 and 10) the default amount of times (i.e. a random number between 2 and 20).

```ruby
sample = Eventsims::Generate.new()

puts "Outcome: #{sample.outcome() }"
puts "Unique Outcome: #{sample.unique() }" 
puts "Occurrence: #{sample.occur() }" 
puts "Probability: #{sample.getprob() }" 
puts "Cummulative Probability: #{sample.getcum() }" 
```

##### Result 1a

```ruby
Outcome: [10, 4, 0, 5, 5, 2, 8, 4]
Unique Outcome: [10, 4, 0, 5, 2, 8]
Occurrence: [1, 2, 1, 2, 1, 1]
Probability: [0.25, 0.5, 0.25, 0.5, 0.25, 0.25]
Cummulative Probability: [0.25, 0.75, 1.0, 1.5, 1.75, 1.0]
```

##### Example 1b

**Optional string argument**

Usage: Eventsims::Generate.new('optional: **sort** ')

Adding an optional string argument *"r"* will *sort* the *outcome* in *descending* order whereas using the *"s"* string argument will *sort* the *outcome* in *ascending* order

```ruby
sample = Eventsims::Generate.new("r")

puts "Outcome: #{sample.outcome() }"
puts "Unique Outcome: #{sample.unique() }"
puts "Occurrence: #{sample.occur() }"
puts "Probability: #{sample.getprob() }"
puts "Cummulative Probability: #{sample.getcum() }"
```

##### Result 1b
```ruby
Outcome: [5, 3, 2, 2, 1]
Unique Outcome: [5, 3, 2, 1]
Occurrence: [1, 1, 2, 1]
Probability: [0.2, 0.2, 0.4, 0.2]
Cummulative Probability: [0.2, 0.4, 0.8, 1.0]
```

##### Example 2a

**one argument**

Usage: Eventsims::Generate.new(**amount**)

What this does is populate the outcome list with random values (between 0 and 10) the amount of times specified in the argument. For example if 10 was specified in the argument, it will populate the outcome list with values ten times

```ruby
sample = Eventsims::Generate.new(8)

puts "Outcome: #{sample.outcome() } "
puts "Unique Outcome: #{sample.unique() } "
puts "Occurrence: #{sample.occur() } "
puts "Probability: #{sample.getprob() } "
puts "Cummulative Probability: #{sample.getcum() } "
```

##### Result 2a
```ruby
Outcome: [8, 4, 8, 1, 2, 9, 2, 9]
Unique Outcome: [8, 4, 1, 2, 9]
Occurrence: [2, 1, 1, 2, 2]
Probability: [0.25, 0.125, 0.125, 0.25, 0.25]
Cummulative Probability: [0.25, 0.375, 0.5, 0.75, 1.0
```

##### Example 2b

**Optional string argument**

Usage: Eventsims::Generate.new(**amount**, 'optional: **sort**')

Adding an optional string argument *"r"* will *sort* the *outcome* in *descending* order whereas using the *"s"* string argument will *sort* the *outcome* in *ascending* order

```ruby
sample = Eventsims::Generate.new(10,"s")

puts "Outcome: #{sample.outcome() } "
puts "Unique Outcome: #{sample.unique() } "
puts "Occurrence: #{sample.occur() } "
puts "Probability: #{sample.getprob() } "
puts "Cummulative Probability: #{sample.getcum() } "

```

##### Result 2b
```ruby
Outcome: [0, 1, 1, 1, 3, 4, 7, 7, 9, 10]
Unique Outcome: [0, 1, 3, 4, 7, 9, 10]
Occurrence: [1, 3, 1, 1, 2, 1, 1]
Probability: [0.1, 0.3, 0.1, 0.1, 0.2, 0.1, 0.1]
Cummulative Probability: [0.1, 0.4, 0.5, 0.6, 0.8, 0.9, 1.0]
```

##### Example 3a

**two arguments**

Usage: Eventsims::Generate.new(**start**, **stop**)

What this does is populate the outcome list with values (between argument one and argument two) the default amount of times (i.e. a random number between 2 and 20).

```ruby
sample = Eventsims::Generate.new(3, 7)

puts "Outcome: #{sample.outcome() } "
puts "Unique Outcome: #{sample.unique() } "
puts "Occurrence: #{sample.occur() } "
puts "Probability: #{sample.getprob() } "
puts "Cummulative Probability: #{sample.getcum() } "

```
##### Result 3a
```ruby
Outcome: [4, 7, 7, 4, 3, 3, 4, 4]
Unique Outcome: [4, 7, 3]
Occurrence: [4, 2, 2]
Probability: [0.5, 0.25, 0.25]
Cummulative Probability: [0.5, 0.75, 1.0]
```


##### Example 3b

**Optional string argument**

Usage: Eventsims::Generate.new(**start**, **stop**, 'optional: **sort** ')

Adding an optional string argument *"r"* will *sort* the *outcome* in *descending* order whereas using the *"s"* string argument will *sort* the *outcome* in *ascending* order

```ruby
sample = Eventsims::Generate.new(2, 6, "r")

puts "Outcome: #{sample.outcome() } "
puts "Unique Outcome: #{sample.unique() } "
puts "Occurrence: #{sample.occur() } "
puts "Probability: #{sample.getprob() } "
puts "Cummulative Probability: #{sample.getcum() } "

```

##### Result 3b

```ruby
Outcome: [6, 5, 5, 5, 4, 4, 4, 4, 2, 2]
Unique Outcome: [6, 5, 4, 2]
Occurrence: [1, 3, 4, 2]
Probability: [0.1, 0.3, 0.4, 0.2]
Cummulative Probability: [0.1, 0.4, 0.8, 1.0]
```

##### Example 4a

**three arguments**

Usage: Eventsims::Generate.new(**start**, **stop**, **amount**)

What this does is populate the outcome list with values (between argument one and argument two) the amount of times supplied in argument three. i.e. if 4 was supplied as the third argument, there will be four values in the outcome list.

```ruby
sample = Eventsims::Generate.new(2, 5, 7)

puts "Outcome: #{sample.outcome() } "
puts "Unique Outcome: #{sample.unique() } "
puts "Occurrence: #{sample.occur() } "
puts "Probability: #{sample.getprob() } "
puts "Cummulative Probability: #{sample.getcum() } "

```
##### Result 4a

```ruby
Outcome: [5, 5, 4, 4, 4, 2, 3]
Unique Outcome: [5, 4, 2, 3]
Occurrence: [2, 3, 1, 1]
Probability: [0.2857, 0.4286, 0.1429, 0.1429]
Cummulative Probability: [0.2857, 0.7143, 0.8572, 1.0]
```

##### Example 4b

**Optional string argument**

Usage: Eventsims::Generate.new(**start**, **stop**, **amount**, 'optional: **sort** ')

Adding an optional string argument *"r"* will *sort* the *outcome* in *descending* order whereas using the *"s"* string argument will *sort* the *outcome* in *ascending* order

```ruby
sample = Eventsims::Generate.new(2, 5, 7, "s")

puts "Outcome: #{sample.outcome() } "
puts "Unique Outcome: #{sample.unique() } "
puts "Occurrence: #{sample.occur() } "
puts "Probability: #{sample.getprob() } "
puts "Cummulative Probability: #{sample.getcum() } "

```

##### Result 4b

```ruby
Outcome: [2, 3, 3, 4, 4, 5, 5]
Unique Outcome: [2, 3, 4, 5]
Occurrence: [1, 2, 2, 2]
Probability: [0.1429, 0.2857, 0.2857, 0.2857]
Cummulative Probability: [0.1429, 0.4286, 0.7143, 1.0]
```


##### Example 5a

**four arguments**

Usage: Eventsims::Generate.new(**start**, **stop**, **step**, **amount**)

What this does is populate the outcome list with values (between argument one and argument two) in steps of argument three value the amount of times in argument four's value. 

```ruby
sample = Eventsims::Generate.new(2, 20, 3, 10)

puts "Outcome: #{sample.outcome() } "
puts "Unique Outcome: #{sample.unique() } "
puts "Occurrence: #{sample.occur() } "
puts "Probability: #{sample.getprob() } "
puts "Cummulative Probability: #{sample.getcum() } "

```

##### Result 5a

```ruby
Outcome: [20, 8, 11, 5, 11, 17, 20, 17, 14, 20]
Unique Outcome: [20, 8, 11, 5, 17, 14]
Occurrence: [3, 1, 2, 1, 2, 1]
Probability: [0.3, 0.1, 0.2, 0.1, 0.2, 0.1]
Cummulative Probability: [0.3, 0.4, 0.6, 0.7, 0.9, 1.0]
```


##### Example 5b

**Optional string argument**

Usage: Eventsims::Generate.new(**start**, **stop**, **step**, **amount**, 'optional: **sort** ')

Adding an optional string argument *"r"* will *sort* the *outcome* in *descending* order whereas using the *"s"* string argument will *sort* the *outcome* in *ascending* order

```ruby
sample = Eventsims::Generate.new(2, 20, 3, 10, "r")

puts "Outcome: #{sample.outcome() } "
puts "Unique Outcome: #{sample.unique() } "
puts "Occurrence: #{sample.occur() } "
puts "Probability: #{sample.getprob() } "
puts "Cummulative Probability: #{sample.getcum() } "

```

##### Result 5b

```ruby
Unique Outcome: [20, 17, 14, 11, 8, 5, 2]
Occurrence: [3, 1, 1, 1, 1, 1, 2]
Probability: [0.3, 0.1, 0.1, 0.1, 0.1, 0.1, 0.2]
Cummulative Probability: [0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 1.0]
```


### Randomsim

**Randomsim** helps to quickly simulate and generate a scenario with random values by just passing your desired argument values into it. It takes between 0 to 3 arguments. The generated results are then stored into the inter-arrival time and service time list needed to generate the rest of the values.

#### Methods

This class has eight methods that can be called on its instance namely:

* intarrival() ----> Displays the inter-arrival time in a list.
* arrival() ----> Displays the arrival time in a list.
* service() ----> Displays the service time in a list.
* servbegin() ----> Display the time service begins in a list.
* servend() ----> Display the time service ends in a list.
* queuewait() ----> Display the time the customer spent waiting in a list.
* custspend() ----> Display the time the customer spent in the system i.e. total time of service.
* idle() ---> Display the idle time of the server (cashier).

#### Usage
You can use the Randomsim class the following ways:


> The following examples will cover how arguments are used in the Generate class. In the examples, we assume that the class has been required first as

```ruby
require "Eventsims"
```

and you can then respectively use it like in the following examples:

##### Example 1a

**zero arguments**

What this does is populate the inter-arrival and service time list with random numbers (between 1 and 10) random amount of times (2 to 20). The first value of the inter-arrival time defaults to 0.

```ruby

sample = Eventsims::Randomsim.new()
 
puts "Inter-arrival time: #{sample.intarrival() } "
puts "Arrival time: #{sample.arrival() } "
puts "Service time: #{sample.service() } "
puts "Time when Service begins: #{sample.servbegin() } "
puts "Time when Service ends: #{sample.servend() } "
puts "Time customer spends waiting in Queue: #{sample.queuewait() } "
puts "Time customer spends in system: #{sample.custspend() } "
puts "Idle time of server: #{sample.idle() } "
```

##### Result 1a

```ruby
Inter-arrival time: [0, 8, 4, 10, 1]
Arrival time: [0, 8, 12, 22, 23]
Service time: [2, 9, 4, 5, 5]
Time when Service begins: [0, 8, 17, 22, 27]
Time when Service ends: [2, 17, 21, 27, 32]
Time customer spends waiting in Queue: [0, 0, 5, 0, 4]
Time customer spends in system: [2, 9, 9, 5, 9]
Idle time of server: [0, 6, 0, 1, 0]
```


##### Example 1b

**one argument**

Usage: Eventsims::Randomsim.new(**list size**)

What this does is populate the inter-arrival and service time list with random numbers (between 1 and 10) the amount of times supplied as the only argument value. The first value of the inter-arrival time defaults to 0.

```ruby
sample = Eventsims::Randomsim.new(6)
 
puts "Inter-arrival time: #{sample.intarrival() }"
puts "Arrival time: #{sample.arrival() }"
puts "Service time: #{sample.service() }"
puts "Time when Service begins: #{sample.servbegin() }"
puts "Time when Service ends: #{sample.servend() }"
puts "Time customer spends waiting in Queue: #{sample.queuewait() }"
puts "Time customer spends in system: #{sample.custspend() }"
puts "Idle time of server: #{sample.idle() }"
```

##### Result 1b


```ruby
Inter-arrival time: [0, 4, 10, 9, 1, 9]
Arrival time: [0, 4, 14, 23, 24, 33]
Service time: [4, 10, 1, 8, 10, 5]
Time when Service begins: [0, 4, 14, 23, 31, 41]
Time when Service ends: [4, 14, 15, 31, 41, 46]
Time customer spends waiting in Queue: [0, 0, 0, 0, 7, 8]
Time customer spends in system: [4, 10, 1, 8, 17, 13]
Idle time of server: [0, 0, 0, 8, 0, 0]
```


##### Example 1c

**two arguments**

Usage: Eventsims::Randomsim.new(**max value**, **list size**)

What this does is populate the inter-arrival and service time list with numbers not more than the first argument starting from 1. The list is populated the amount of times specified as the second argument.

```ruby
sample = Eventsims::Randomsim.new(4,6)
 
puts "Inter-arrival time: #{sample.intarrival() }"
puts "Arrival time: #{sample.arrival() }"
puts "Service time: #{sample.service() }"
puts "Time when Service begins: #{sample.servbegin() }"
puts "Time when Service ends: #{sample.servend() }"
puts "Time customer spends waiting in Queue: #{sample.queuewait() }"
puts "Time customer spends in system: #{sample.custspend() }"
puts "Idle time of server: #{sample.idle() }"
```


##### Result 1c

```ruby
Inter-arrival time: [0, 1, 2, 2, 2, 4]
Arrival time: [0, 1, 3, 5, 7, 11]
Service time: [1, 2, 1, 4, 2, 4]
Time when Service begins: [0, 1, 3, 5, 9, 11]
Time when Service ends: [1, 3, 4, 9, 11, 15]
Time customer spends waiting in Queue: [0, 0, 0, 0, 2, 0]
Time customer spends in system: [1, 2, 1, 4, 4, 4]
Idle time of server: [0, 0, 0, 1, 0, 0]
```


##### Example 1d

**three arguments**

Usage: Eventsims::Randomsim.new(**max value for inter-arrival time**, **max value for service time**, **list size**)

What this does is populate the inter-arrival with numbers between 1 and the value passed into the first argument, service time is populated with values between 1 and the second argument while the third argument is the amount/size of the two lists.

```ruby
sample = Eventsims::Randomsim.new(4, 6, 8)
 
puts "Inter-arrival time: #{sample.intarrival() } "
puts "Arrival time: #{sample.arrival() } "
puts "Service time: #{sample.service() } "
puts "Time when Service begins: #{sample.servbegin() } "
puts "Time when Service ends: #{sample.servend() } "
puts "Time customer spends waiting in Queue: #{sample.queuewait() } "
puts "Time customer spends in system: #{sample.custspend() } "
puts "Idle time of server: #{sample.idle() } "
```


##### Result 1d


```ruby
Inter-arrival time: [0, 3, 2, 2, 3, 3, 3, 4]
Arrival time: [0, 3, 5, 7, 10, 13, 16, 20]
Service time: [6, 2, 2, 2, 4, 5, 6, 4]
Time when Service begins: [0, 6, 8, 10, 12, 16, 21, 27]
Time when Service ends: [6, 8, 10, 12, 16, 21, 27, 31]
Time customer spends waiting in Queue: [0, 3, 3, 3, 2, 3, 5, 7]
Time customer spends in system: [6, 5, 5, 5, 6, 8, 11, 11]
Idle time of server: [0, 0, 0, 0, 0, 0, 0, 0]
```


### Simulate

**Simulate** helps to quickly simulate and generate a scenario with user-defined values. It is more flexible in that it allows you to input your own data rather than input just numbers as compared to **Randomsim**. It can take one or two arguments which are inter-arrival time list and service time list. They must be of the same length.

#### Methods

This class has eight methods (same as `Randomsim`) that can be called on its instance namely:

* intarrival() ----> Displays the inter-arrival time in a list.
* arrival() ----> Displays the arrival time in a list.
* service() ----> Displays the service time in a list.
* servbegin() ----> Display the time service begins in a list.
* servend() ----> Display the time service ends in a list.
* queuewait() ----> Display the time the customer spent waiting in a list.
* custspend() ----> Display the time the customer spent in the system i.e. total time of service.
* idle() ---> Display the idle time of the server (cashier).


#### Usage

>The following examples will cover how arguments are used in the Simulate class. In the examples, we assume that the class has been required first as:

```ruby
require "Eventsims"
```

##### Example 2a

**one argument**

Usage: Eventsims::Simulate.new(**inter-arrival list**)

What this does is populate the inter-arrival time with the user-defined argument (**must be a list**) and service time would be automatically generated (populated with numbers between 1 and 10 with the same size as inter-arrival time). 

```ruby
sample = Eventsims::Simulate.new([7, 9, 6])
 
puts "Inter-arrival time: #{sample.intarrival() } "
puts "Arrival time: #{sample.arrival() } "
puts "Service time: #{sample.service() } "
puts "Time when Service begins: #{sample.servbegin() } "
puts "Time when Service ends: #{sample.servend() } "
puts "Time customer spends waiting in Queue: #{sample.queuewait() } "
puts "Time customer spends in system: #{sample.custspend() } "
puts "Idle time of server: #{sample.idle() } "
```

##### Result 2a

```ruby
Inter-arrival time: [7, 9, 6]
Arrival time: [7, 16, 22]
Service time: [2, 5, 1]
Time when Service begins: [7, 16, 22]
Time when Service ends: [9, 21, 23]
Time customer spends waiting in Queue: [0, 0, 0]
Time customer spends in system: [2, 5, 1]
Idle time of server: [0, 7, 1]
```


##### Example 2b

**two arguments**

Usage: Eventsims::Randomsim.new(**inter-arrival list**, **service time list**)

What this does is populate the inter-arrival with the first list argument and the service time with the second argument which is then used to calcuate the the rest.

```ruby
sample = Eventsims::Simulate.new([0, 5, 6, 3, 7, 9, 3], [4, 7, 2, 1, 3, 11, 7])

puts "Inter-arrival time: #{sample.intarrival() } "
puts "Arrival time: #{sample.arrival() } "
puts "Service time: #{sample.service() } "
puts "Time when Service begins: #{sample.servbegin() } "
puts "Time when Service ends: #{sample.servend() } "
puts "Time customer spends waiting in Queue: #{sample.queuewait() } "
puts "Time customer spends in system: #{sample.custspend() } "
puts "Idle time of server: #{sample.idle() } "
```

##### Result 2b


```ruby
Inter-arrival time: [0, 5, 6, 3, 7, 9, 3]
Arrival time: [0, 5, 11, 14, 21, 30, 33]
Service time: [4, 7, 2, 1, 3, 11, 7]
Time when Service begins: [0, 5, 12, 14, 21, 30, 41]
Time when Service ends: [4, 12, 14, 15, 24, 41, 48]
Time customer spends waiting in Queue: [0, 0, 1, 0, 0, 0, 8]
Time customer spends in system: [4, 7, 3, 1, 3, 11, 15]
Idle time of server: [0, 1, 0, 0, 6, 6, 0]
```


## Module methods
### trimval

**trimval** that takes in one argument, (numbers or lists and strips it of leading zeros and round up to 4 decimal places 

### trimlist

**trimlist** that takes in as many arguments as possibe and does the same thing **trimval** does but very useful if there is a nested list in the list of arguments.


> They both help to display lists and numbers in a better and easier way to read rather than have values with many leading decimal numbers in a list(Array) keeping it concise. `

#### Usage

Usage: Eventsims::trimval(**single argument**)
Usage: Eventsims::trimlist(**any Array argument**)

##### example
```ruby
require "Eventsims"

sample = Eventsims.trimval([3.6789876])
puts "new value: #{sample}"

sample = Eventsims.trimlist([3.6789876], "dog", [2.76542, "rat", [4]])
puts "new list: #{sample}"
```
	
##### Result
```ruby
new val: [[3.679]]
new list: [[3.679], "dog", [2.7654, "rat", [4]]
```



<!-- ## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).
 -->
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tushortz/eventsims.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
