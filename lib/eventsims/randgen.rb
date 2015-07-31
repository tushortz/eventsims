
module Eventsims


# Generating random outcomes and probabilities
class Generate
	def initialize(*args)
		''' Initialisation of all values'''
		# Starting variables that change result depending on the if statements
		start, stop, jump = 0, 10, 1
		@@outcome, @@occur, @@unique, @@problist, @@cumprob = [], [], [], [], []
		amount = (2..20).step(jump).to_a.sample
		amount.times{@@outcome << (start..stop).step(jump).to_a.sample}
		
	# If statements to run different functions
		if args.size == 0
			@@outcome = @@outcome

		elsif args.size == 1
			if args[0].is_a?(Integer) 
				amount, @@outcome = args[0], []
				amount.times{@@outcome << (start..stop).step(jump).to_a.sample}
				
			elsif args[0] == "r"
				@@outcome.sort!{|x,y| y<=>x}

			elsif args[0] == "s"
				@@outcome.sort!

			else
				raise "\nInvalid argument: Use (amount, 'r' or 's')"
			end

		elsif args.size == 2
			if args.all?{|x| x.is_a?(Integer)}
				start, stop, @@outcome = args[0], args[1], []
				amount.times{@@outcome << (start..stop).step(jump).to_a.sample} 
				
			elsif args[1] == "r"
				amount, @@outcome = args[0], []
				amount.times{@@outcome << (start..stop).step(jump).to_a.sample}
				@@outcome.sort!{|x,y| y<=>x}
				
			elsif args[1] == "s"
				amount, @@outcome = args[0], []
				amount.times{@@outcome << (start..stop).step(jump).to_a.sample}
				@@outcome.sort!

			else
				raise "\nInvalid argument: Use (start, stop) or (amount, 'r' or 's')'"
			end

		elsif args.size == 3
			if args.all?{|x| x.is_a?(Integer)}
				start, stop, amount, @@outcome = args[0], args[1], args[2], []
				amount.times{@@outcome << (start..stop).step(jump).to_a.sample} 
				
			elsif args[2] == "r"
				start, stop, @@outcome = args[0], args[1], []
				amount.times{@@outcome << (start..stop).step(jump).to_a.sample} 
				@@outcome.sort!{|x,y| y<=>x}

			elsif args[2] == "s"
				start, stop, @@outcome = args[0], args[1], []
				amount.times{@@outcome << (start..stop).step(jump).to_a.sample} 
				@@outcome.sort!

			else
				raise "\nInvalid argument: Use (start, stop, amount) or (amount, 'r' or 's')'"
			end

		elsif args.size == 4
			if args.all?{|x| x.is_a?(Integer)}
				start, stop, jump, amount, @@outcome = args[0], args[1], args[2], args[3], []
				amount.times{@@outcome << (start..stop).step(jump).to_a.sample}
				
			elsif args[3] == "r"
				start, stop, amount, @@outcome = args[0], args[1], args[2], []
				amount.times{@@outcome << (start..stop).step(jump).to_a.sample}
				@@outcome.sort!{|x,y| y<=>x}

			elsif args[3] == "s"
				start, stop, amount, @@outcome = args[0], args[1], args[2], []
				amount.times{@@outcome << (start..stop).step(jump).to_a.sample}
				@@outcome.sort!

			else
				raise "\nInvalid argument: Use (start, stop, step, amount) or \n\t(start, stop, amount, 'r' or 's')'"
			end

		elsif args.size == 5	
			if args[4] == "r"
				start, stop, jump, amount, @@outcome = args[0], args[1], args[2], args[3], []
				amount.times{@@outcome << (start..stop).step(jump).to_a.sample}
				@@outcome.sort!{|x,y| y<=>x}

			elsif args[4] == "s"
				start, stop, jump, amount, @@outcome = args[0], args[1], args[2], args[3], []
				amount.times{@@outcome << (start..stop).step(jump).to_a.sample}
				@@outcome.sort!

			else
				raise "\nInvalid argument: Use (start, stop, step, amount, 'r' or 's')'"
			end
		end
	
		#Generates a set and times of occurrence ofoutcome
		@@outcome.each{|item| @@unique << item  unless @@unique.include?(item)}
		result = @@outcome.each_with_object(Hash.new(0)) { |word, counts| counts[word] += 1 }
		result.each{|x,y| @@occur << y}
		
	end

	# Returns a probability list of all items in its argument
	def getprob()
		probability = []
		'''Returns a probability list of all items in its argument'''
		@@occur.each{|i| probability << (i*1.0/@@outcome.size).round(4)}

		return probability
	end

	# Returns a cummulative probability list of all items in its argument
	def getcum()
		'''Returns a cummulative probability list of all items in its argument'''
		increase, probability, cumlist = 0, getprob(), []
		probability.each{|i| increase +=i
			cumlist << increase.round(4) }
		cumlist[-1] = 1.0      #makes sure the last value is 1.0
		return cumlist
	end

	# Returns the outcome
	def outcome()
		''' Returns a generated outcome '''
		return @@outcome
	end

	# Returns the unique outcome
	def unique()
		'''Returns the unique outcome'''
		return @@unique
	end

# 	# Returns the number of times the unique item is found
	def occur
		'''Returns the number of times the unique item is found'''
		return @@occur
	end


	end
end

