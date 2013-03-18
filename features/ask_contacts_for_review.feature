Feature:
	In order to have myself reviewed
	As a registered person
	I need to ask contacts to review myself

Scenario: ask for review from my contacts
	Given I am a registered person
	And I am logged in
	And I have contacts
	When I ask contacts to review me
	Then a new review item will be assigned to the contacts
	And I will be the subject of the review item