Feature: Participants list for next dojo session
  In order to know how many people will come
  As an editor
  I want to have a list where people can mark whether they come or not, without registration
  
Scenario: Add two names when logged in
  Given I am logged in
  And there are 1 dojos scheduled starting in 1 days
  And I am on the root page
  When I fill in "participant_name" with "Caue"
  And I press "add_participant"
  And I fill in "participant_name" with "Pedro"
  And I press "add_participant"
  Then I should see "Caue"
  And I should see "Pedro"
  And I should see "Successfully added participant Pedro"

Scenario: Add with no name when logged in
  Given I am logged in
  And there are 1 dojos scheduled starting in 1 days
  And I am on the root page
  When I fill in "participant_name" with ""
  And I press "add_participant"
  Then I should see an empty presence list
  And I should see "Empty name"

Scenario: Add with default name when logged in
  Given I am logged in
  And there are 1 dojos scheduled starting in 1 days
  And I am on the root page
  When I press "add_participant"
  Then I should see an empty presence list
  And I should see "Empty name"

Scenario: Remove a name when logged in
  Given I am logged in
  And there are 1 dojos scheduled starting in 1 days
  And I am on the root page
  And the participant "Caue" has confirmed his/her presence to the next Dojo
  When I follow "remove_Caue"
  Then I should not see "remove_Caue"
  And I should see "Successfully removed participant Caue"

Scenario: Can't add a participant if there isn't a next dojo scheduled
  Given I am logged in
  And there is no scheduled dojo
  And I am on the root page
  Then I should not see a box to put my name

Scenario: Can't add a participant when not logged in
  Given I am not logged in
  And there are 1 dojos scheduled starting in 1 days
  And I am on the root page
  Then I should not see a box to put my name

Scenario: Can't remove a name when not logged in
  Given I am logged in
  And there are 1 dojos scheduled starting in 1 days
  And the participant "Caue" has confirmed his/her presence to the next Dojo
  And I am on the root page
  When I follow "Logout"
  Then I should not see "remove_Caue"