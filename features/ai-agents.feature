Feature: The AI Agents workspace plugin
  Once the plugin is activated and installed, the ai-agents workspace is on the dashboard, and the
  Plugins page lists the plugin with its four steps.

  Scenario: The workspace page is there
    Given I am on "/ai-agents"
     Then I should see "AI Agents"

  Scenario: The plugin is listed on the Plugins page
    Given I am on "/settings/plugins"
     Then I should see "AI Agents"
      And I should see "@webship/workspace-ai-agents"
