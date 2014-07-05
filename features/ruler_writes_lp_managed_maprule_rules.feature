Feature: Ruler writes LP managed mapRule rules

	In order to maintain the "DaIrY FARM guiding principles"
	And generate the necessary allowlists for LP managed MapRules
	As a Ruler
	I want to write a rule that defines the primary regions of a LP managed MapRule

Scenario: write LP managed mapRule rule
	Given a file name "single_lp_managed_maprule_rules.rb" with:
		"""
		mapRule :S.g => LPOut do
			primary_regions = LPOut.Allowlists.by_maprule_id( it.maprule_id )
		end
		"""
	When I run "blc --load single_lp_managed_maprule_rules.rb"
	Then the stdout should include:
		"""
		mapRule.S.g ... loaded

	  Loaded in ([\d\.]*) seconds

		1 rule
		"""
	Then it should enter irb
