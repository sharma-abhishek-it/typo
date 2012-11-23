Feature: Write Articles
  As a blog administrator
  In order to reduce redundant information
  I want to be able to merge articles to my blog

    Background:
        Given the blog is set up
        And I am logged into the admin panel
        And the following articles exist
            | id | title    | content | author    |
            | 1  | Dummy #1 | Dummy 1 | Author #1 |
            | 2  | Dummy #2 | Dummy 2 | Author #2 |
        And the following comments exist
            | id | content    | article_id |
            | 1  | Comment #1 | 1          |
            | 2  | Comment #2 | 2          |

    Scenario: Just look that view is in place
        Given I am on the edit Article page for id=2
        Then I should see "merge_with" input box

    Scenario: Check whether everything is correct on merging
        Given I am on the edit Article page for id=2
        And I enter 1 in the "merge_with" input box
        And I press "merge" button
        Then I should see "Dummy 2 \n Dummy 1" in the "content" box
        And I should see comment with id 1
        And I should see comment with id 2
        And when I go to edit Article page for id=1
        Then I should see an error "Article does not exist"
