---
name: ai-agents-workflow
description: How work is done in the `ai-agents/` folder of the Webship Workspace — what an agent is there and the shape it has, how the agents of the folder are listed, pulled from the shared repository, added from any GitHub repository, installed into the AI CLI or into one project, checked and updated, copied to adapt and proposed back with `cmd-tools-ai-items.sh`, with every flag of the command and the settings keys of the folder. Use when asked to "write an agent", "install an agent", "update the installed agents", "pull the shared agents", or when a file of `ai-agents/` is about to be written.
argument-hint: '[what you are about to do in ai-agents]'
---

# ai-agents-workflow

`~/workspace/ai-agents` is the AI Agents folder of a Webship Workspace (container-based, DDEV by default).
AI Agents holds the agents of the workspace as items a person edits in place: one agent is one file, `~/workspace/ai-agents/<name>.md`. It comes with the AI Agents plugin (`@webship.co/workspace-ai-agents`), which places the commands below in the folder. Every command finds the workspace from its own path; run it from the folder, and read `bash <command> --help` before quoting a flag.

## The order of work

1. **See what is where**: `bash cmd-tools-ai-items.sh`.
2. **Start from one that exists**: `bash cmd-tools-ai-items.sh my-agent --clone-to my-agent-2`, or write
   `~/workspace/ai-agents/my-agent.md` in the shape below.
3. **Read it as its reader would**: an AI assistant that knows nothing else about the work.
4. **Install**: `bash cmd-tools-ai-items.sh my-agent --install` (add `--to dev/mysite` for one project).
5. **Keep it in step**: `bash cmd-tools-ai-items.sh --check`, then `bash cmd-tools-ai-items.sh --update`.

## Commands

| Command | What it does | Flags |
| --- | --- | --- |
| `cmd-tool-backup-agent.sh` | One agent as an archive, into `backups/ai-agents/`: `<name>` | none |
| `cmd-tools-ai-items.sh` | The agents of this folder against the AI CLI and the shared repository: `[name]`. With no flag it shows what each place has | `--add` `--check` `--clone-to` `--confirm` `--fetch` `--filter` `--install` `--list-remote` `--propose` `--pull` `--purpose` `--source` `--status` `--summary` `--to` `--update` |

## The shape of an agent

An agent is a markdown file with a frontmatter, then the instructions the agent works by:

| Part | What it holds |
| --- | --- |
| `name` | The agent's name: the name of the file, without `.md` |
| `description` | When to use it, with the phrases a person says; this is what an AI assistant reads to decide whether to hand the work over |
| `model`, `tools` | The model it runs on and the tools it may use, in the words of the default AI CLI; another CLI ignores what it does not know |
| The body | Plain Markdown any AI CLI can follow: what the agent does, the commands it runs, its rules |

Names are short, lowercase, with hyphens, and start with what the agent belongs to. An agent that is already in the folder under a name is kept when a plugin brings one of the same name.

## Settings

| Key | File | What it says |
| --- | --- | --- |
| `doc.name` | `core/config/workspace.ai-agents.settings.yml` | The folder under the workspace root: `ai-agents` |
| `type` | `core/config/workspace.ai-agents.settings.yml` | `ai-items`: the page lists AI items, with its own install, fetch and propose actions |
| `presentation.icon`, `presentation.subtitle` | `core/config/workspace.ai-agents.settings.yml` | The icon and the words of the folder's card |
| `assistant.name`, `assistant.placeholder` | `core/config/workspace.ai-agents.settings.yml` | What the assistant is called on this page; `default` takes the workspace's |
| `workspaces` | `core/config/settings.yml` | The active folders; `ai-agents` is on it once the plugin is activated |
| `sources.ai_items.repo`, `sources.ai_items.ref` | `core/config/settings.yml` | The shared repository `--list-remote`, `--pull` and `--propose` talk to, and its branch |

## Rules

- **The folder is the draft, the AI CLI is the copy.** Change an agent here, then install it again; never edit the installed copy.
- **`--pull` and `--add` bring in what somebody else wrote.** Read an agent before it is installed: it tells an AI assistant what to do on this machine.
- **`--propose` prints its plan and stops**; `--confirm` files an issue and opens a request on the shared repository: only when asked.
- **Nothing private in an agent**: no password, no token, no personal path; addresses are example addresses.
- **The body is plain Markdown any AI CLI can follow.** Claude Code is the default shape (the frontmatter, the launch line of a prompt), never a requirement.
- **Back up before a rewrite**: `bash cmd-tool-backup-agent.sh <name>`.
- The workspace is container-based (DDEV by default): an agent that describes it says so.

The AI Agents plugin places these beside this one, each in the workspace folder of its kind: the agent `ai-agents-keeper` (`ai-agents/`), the command `/ai-agents-install` (`ai-commands/`) and the prompt `ai-agents-write-a-new-agent` (`ai-prompts/`).

## The book

For any automated functional testing in this work (a Gherkin feature, a step definition, choosing a
step, a test run and its failures), read the book *Automated Functional Testing Recipes* first.

- **Where.** Use the first that exists: `.claude/automated-functional-testing-recipes/` in the project,
  `~/.claude/automated-functional-testing-recipes/` (installed by webship/webship-js-ai-agent,
  webship/webship-js-skills or webship/ai-agents), or
  https://github.com/webship/webship-js-ai-agent/tree/2.0.x/automated-functional-testing-recipes
- **How.** Its `README.md` first, then the chapter that matches the task (one file per chapter,
  named by its subject), not the single complete file.
- **Which wins.** The installed webship-js package and the step pack are the source of truth for
  step phrasing. When they differ from the book, follow them and say so.
