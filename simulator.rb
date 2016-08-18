TESTS_TO_RUN = 1000
MESSAGE_CAP = 1000 # Fail early if we hit 1k messages because that's too damn high

def run_test num_agents, response_rate
	messages_to_process = 1
	total_messages = 0

	while messages_to_process > 0
		return MESSAGE_CAP if total_messages >= MESSAGE_CAP

		messages_to_process -= 1
		total_messages += 1.0

		num_agents.times do
			messages_to_process += 1 if rand(100) <= response_rate
		end
	end

	return total_messages
end


1.upto(20) do |num_agents|
	1.upto(100) do |response_rate|
		test_totals = []

		start_time = Time.now
		1.upto(TESTS_TO_RUN) do |i|
			test_totals << run_test(num_agents, response_rate)
		end
		end_time = Time.now

		average_message_count = test_totals.inject(:+) / TESTS_TO_RUN
		#puts "#{TESTS_TO_RUN} tests for #{response_rate}% response rate across #{num_agents} agents: #{average_message_count} messages (#{end_time - start_time}s)"
		puts "#{num_agents};#{response_rate}%;#{average_message_count}"
	end
end