
module Eventsims
#module Simevent

class Randomsim
	def initialize(*args)
		''' Initialisation '''
	
		stop, amount, @_intarrival,  @_service = 10, (2..20).step(1).to_a.sample, [], []

		if args.size == 0
			amount.times{@_intarrival << (1..stop).step(1).to_a.sample}
			amount.times{@_service << (1..stop).step(1).to_a.sample}	

		elsif args.size == 1
			args[0].times{@_intarrival << (1..stop).step(1).to_a.sample}
			args[0].times{@_service << (1..stop).step(1).to_a.sample}	

		elsif args.size == 2
			args[1].times{@_intarrival << (1..args[0]).step(1).to_a.sample}
			args[1].times{@_service << (1..args[0]).step(1).to_a.sample}	

		elsif args.size == 3
			args[2].times{@_intarrival << (1..args[0]).step(1).to_a.sample}
			args[2].times{@_service << (1..args[1]).step(1).to_a.sample}

		else
			raise "Arguments must be between 0 to 3"
		end

		#Sets its first value to zero
		@_intarrival[0] = 0

		# Required variables
		@_arrival, @_preservstart, @_servstart = [], [0], []
		@_queue, @_servend, @_custspend, @_idle = [], [], [], [0]

		def getarrive_()
			'''Returns arrival time'''
			increase = 0
			@_intarrival.each {|i| increase +=i
				@_arrival << increase }
			return @_arrival
		end
		
		def servbegins_()
			'''Returns time when service begin'''
			increase = 0
			i = 0; while i < @_service.size
				increase+= @_service[i]
				@_preservstart << increase
				i+=1
			end
			@_preservstart.pop
			return @_preservstart
		end

		#populate @_servend with values. just to get same size
		@_intarrival.each{|i| @_servend << i}
			
		#Please maintain order if you are editing the code!
		# Calling functions
		getarrive_()	#Returns arrival time
		servbegins_()	#Returns time when servce begin

		def get_servend_()
			'''Retuns time when service ends'''
			x = 0; while x < ((@_preservstart).size)
				@_servend[x] = @_preservstart[x] + @_service[x]
				s = 1; while s < (@_preservstart).size
					if @_preservstart[s] < (maximum = @_arrival[s] > @_servend[x]? @_arrival[s] : @_servend[x])
						@_preservstart[s] = (maximum)
					end
					s+=1 
				end
				x+=1
			end

			return @_servend
		end

		# Method used to calculate the rest of the data like
		#time when service begins
		#wait time in queue, (_queue)
		#time customer spent in the system (_custspend)
		def otherresults(list1, list2, list3)
			''' Stores and return the value of (list2 - list3) in list1 '''
			x = 0; while x < list2.size
				list1 << (list2[x] - list3[x]) 
				x+=1
			end
			list1[0] = 0 if list1[0] < 0	
		end

		def idletime_()
			'''Returns the idle time of server'''
			x,y = 0,1
			while y < @_servend.size
				(@_idle) << (@_servstart[y] - @_servend[x])
				x+=1; y+=1
			end
			return @_idle
		end

		# Calling other methods
		get_servend_()
		otherresults(@_servstart, @_servend, @_service) 
		otherresults(@_queue, @_servstart, @_arrival) 
		otherresults(@_custspend, @_servend, @_arrival)
		idletime_()
	end

	#Methods to be used outside of initialize returning necessary values
	#Main methods
	
	def intarrival()
		'''Returns the interarrival time'''
		return @_intarrival
	end

	def arrival()
		'''Returns the arrival time'''
		return @_arrival
	end

	def service()
		'''Returns the service time'''
		return @_service
	end

	def servbegin()
		'''Returns the time when service began'''
		return @_servstart
	end

	def queuewait()
		"""Returns the customer's waiting time in the queue"""
		return @_queue
	end

	def servend()
		'''Returns the time service ended'''
		return @_servend
 	end

	def custspend()
		'''Returns the time customer spends in system'''
		return @_custspend
	end

	def idle()
		'''Returns the idle time of server'''
		return @_idle
	end

end


class Simulate < Randomsim
	def initialize(*args)
		''' Initialisation '''

		stop, amount = 10, (2..20).step(1).to_a.sample
		@_intarrival, @_service = [], []

		if args.size == 1
			@_intarrival = args[0]
			raise "Argument must be a list" unless args[0].is_a?(Array)	
			(args[0].size).times{@_service << (1..stop).step(1).to_a.sample}	

			args[0].each{|y| 
				raise "Only numbers allowed in Arrays" if y.is_a?(String) } 
			
		elsif args.size == 2
			#checks if both arguments are arrays
			unless args.all?{|x| x.is_a?(Array)	}
				raise "Argument one and two must be Arrays"  
			end
			@_intarrival = args[0]
			@_service = args[1]
		
			args[0].each{|y| 
				raise "Only numbers allowed in Arrays" if y.is_a?(String) } 
			args[1].each{|y| 
				raise "Only numbers allowed in Arrays" if y.is_a?(String) } 
			
			#Check length of both lists and throw error if not equal
			if args[0].size != args[1].size
				raise "List arguments must be of equal length"
			end

		else
			raise "You must supply one or two Array arguments"
		end

		# If first value less than 0 set it to zero
		@_intarrival[0] = 0 if @_intarrival[0] < 0
			
		# Required variables and input error handling
		@_preservstart = []; @_preservstart << args[0][0]
		@_preservstart[0] = 0 if @_preservstart[0] < 0

		# Other variable declaration
		@_arrival, @_servstart, @_queue = [], [], []
		@_servend, @_custspend, @_idle = [], [], [0]

		# Makes display less annoying
		def makenice(thelist)
			temp = []
			thelist.each{|i| if i.is_a?(Integer)
				temp << i
				else
					temp << i.round(4) 
				end  }
			thelist = temp
			return thelist
		end

		def getarrive_()
			'''Returns arrival time'''
			increase = 0
			@_intarrival.each{|i| increase +=i
				@_arrival << increase  }
			return @_arrival
		end

		def servbegins_()
			'''Returns time when service begin'''
			increase, i = 0, 0
			while i < @_service.size
				increase += @_service[i]
				@_preservstart << increase
				i+=1
			end
			@_preservstart.pop()

			return @_preservstart
		end

		#populate @_servend with values. just to get same size
		@_intarrival.each{|i| @_servend << i}

		# #Please maintain order if you are editing the code!
		# # Calling functions
		getarrive_()	#Returns arrival time
		servbegins_()	#Returns time when servce begin

		def get_servend_()
			'''Retuns time when service ends'''
			x = 0; while x < ((@_preservstart).size)
				@_servend[x] = @_preservstart[x] + @_service[x]
				s = 1; while s < (@_preservstart).size
					if @_preservstart[s] < (maximum = @_arrival[s] > @_servend[x]? @_arrival[s] : @_servend[x])
						@_preservstart[s] = (maximum)
					end
					s+=1 
				end
				x+=1
			end

			return @_servend
		end

		# Method used to calculate the rest of the data like
		#time when service begins
		#wait time in queue, (_queue)
		#time customer spent in the system (_custspend)
		def otherresults(list1, list2, list3)
			''' Stores and return the value of (list2 - list3) in list1 '''
			x = 0; while x < list2.size
				list1 << (list2[x] - list3[x]) 
				x+=1
			end
			list1[0] = 0 if list1[0] < 0	
		end

		def idletime_()
			'''Returns the idle time of server'''
			x,y = 0,1
			while y < @_servend.size
				(@_idle) << (@_servstart[y] - @_servend[x])
				x+=1; y+=1
			end
			return @_idle
		end

		# Calling other methods
		get_servend_()
		otherresults(@_servstart, @_servend, @_service) 
		otherresults(@_queue, @_servstart, @_arrival) 
		otherresults(@_custspend, @_servend, @_arrival)
		idletime_()
	end
	#Simulation class will inherit methods from the Randomsim class

end

#end
end

