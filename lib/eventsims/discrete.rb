module Eventsims
#module Discrete

#Removes leading zeros after decimal and/or approximate to 4dp
def self.trimval(thelist)
	''' Takes in number list or float and removes leading zeros '''
	#Checks if passed argument is a list
	if thelist.is_a?(Array)
		temp = []
		# Loops through each list and convert to 4dp if needed
		thelist.each{|i| temp.push i.is_a?(Float)? i.round(4) : i}	
		thelist = temp
		return thelist

	elsif thelist.is_a?(Float)
		return thelist.round(4)

	else
		return thelist
	end

end

def self.trimlist(*args)
	''' Takes in number list or float and removes leading zeros '''
	store = []
	values = []
	args.each{|mylist| 
		a = []
		mylist.each{|x| 
			if x.is_a?(Float)
				a.push(x.round(4)) 

			elsif x.is_a?(Array)
				inner = []
				x.each{|y| inner.push y.is_a?(Float)? y.round(4) : y}
				a.push(inner)

			else a.push(x)

			end
		}
		values.push(a)
		
	}
	store.push(values)
	return store[0]

end


class Calculate
	def initialize(*args)
		''' Initialising the instances '''
		#Checking for valid arguments and value assignment
		@args = args

		if args.length == 3
			@steps = args[2]
		
		elsif args.length == 2
			@steps = 1

 		else
 			raise "Invalid arguments: must be 2 or 3 -->  Outcome , Cummulative probability, optional: steps"
 		end

		@outcome, @cum_prob, @probability = args[0], args[1], []

 		# Checks in case user hasn't inputted the right information #Error checks for invalid inputs
 		@last_cum = @cum_prob.at(-1)

 		if @outcome.size != @cum_prob.size
 			raise "'prob' arguments must be of same length"

 		elsif @last_cum != 1
 			raise "last value of 2nd argument must be 1"
		end

		args[1].each{|i|
				raise "cummulative probability must be between 0 and 1" if 0 > i or i > 1 }
	end
	# Calculates the probability of an outcome given its cummulative probability
	def prob()
		''' Returns a probability given its cummulative probability '''

		# Starting variables
		y = 1; @probability.push(@cum_prob[0])

		while y < @cum_prob.size
			@probability << (@cum_prob[y] - @cum_prob[y-1]).round(4)
			y+=1
		end

		return Eventsims.trimval(@probability)
	end


	# Generates a discreteEmp for the given outcome 
	def discreteemp()
		'''returns a random number from the outcome list'''
		#--- generating a random number based on discreteemp
		
		emplist = []

		def twoargs()
			count, number = 0, rand()

			while count < (@cum_prob).size
				if @cum_prob[count] < number and number <= @cum_prob[count+1]
					return Eventsims.trimval(@outcome[count+1])
				
				elsif 0 <= number and number <= @cum_prob[0]
				 	return Eventsims.trimval(@outcome[0])
				end
				count+=1
			end
		end
	
		if @args.length == 2
			return Eventsims.trimval(twoargs())

		elsif @args.length == 3
			@amount, increment = @args[2], 0
			if @amount.is_a? (String )
				raise "Only integers allowed as third argument"
			end
			if @amount == 1
				return Eventsims.trimval(twoargs())

			else
				#try:
					while increment < @amount
						generated = twoargs()
						if generated.is_a?(Float)
							generated = Eventsims.trimval(generated)
						end
						emplist << (generated)
						increment +=1
					end
				
				return emplist
			end
		end
	end

	# Calculates the expectation value given its outcome and cummulative probability
	def expectval()
		''' returns the expectation value of the outcomes'''
		
		expectation, increment, probability = 0,0, prob()
		
		while increment < @cum_prob.size
			expectation += probability[increment] * @outcome[increment]
			increment += 1
		end

		if @args.size == 2
			return Eventsims.trimval(expectation)

		elsif @args.size == 3
			expectation *= @steps
			return Eventsims.trimval(expectation)

		else
			raise "arguments must be two or three"
		end
	end

	# Calculates the estimated variance of the given lists
	def eststddev()
		'''returns estimated variance of the outcome'''
		#arguments are: [outcomes], [cummulative probabilities], optional: float(steps)]

		mean = expectval / @steps
		increment, occurtimes = 0, 0
		
		while increment < @cum_prob.size
			occurtimes += @probability[increment] * (@outcome[increment] - mean)**2
			increment +=1
		end

		if @args.size == 2
			return Eventsims.trimval((occurtimes)**0.5)

		elsif @args.size == 3
			return Eventsims.trimval(occurtimes**0.5 * @steps**0.5)
		end
	end

	def estmean()
		return expectval
	end

	# Calculates the estimated standard deviation of the given lists
	def estvar()
		''' Returns the estimated standard deviation of the outcome'''
		#arguments are: [outcomes], [cummulative probabilities], optional: float(steps)]
		variance = eststddev**2
		return Eventsims.trimval(variance)
	end

	end

#end
end

