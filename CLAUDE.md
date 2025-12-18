# CLAUDE.md

This file provides guidance to Claude Code when working with this AL project.

## Project Type

This is a Microsoft Dynamics 365 Business Central AL extension project.

## IMPORTANT: Ask Questions - Don't Assume

**You MUST use the AskQuestion tool when anything is unclear about what the user wants.**

| Tool | Description |
|------|-------------|
| AskQuestion | Ask the user a question with preset options. Blocks until they answer. |

**When to use AskQuestion:**
- Requirements are ambiguous or could be interpreted multiple ways
- Multiple valid implementation approaches exist
- User's intent is not completely clear
- You need to choose between different patterns, architectures, or conventions
- Any decision that could significantly affect the outcome

**Do NOT make assumptions.** If you're unsure, ask. The user would rather answer a quick question than have you implement something wrong.

Example usage:
- "Which table should this field be added to?" with options for the likely candidates
- "How should this validation behave?" with options for different approaches
- "Should I use events or direct modification?" when extending functionality

## Code Style

Write self-documenting code that reads clearly:
- Use descriptive variable, function, and procedure names that explain their purpose
- Structure code logically with clear control flow
- Avoid comments except for genuinely complex logic that cannot be simplified
- Let the code tell the story through meaningful names and structure

## AL Language Guidelines

- Follow AL coding best practices and naming conventions
- Use PascalCase for object names, procedures, and variables
- Prefix local variables with appropriate type indicators when helpful
- Structure objects with fields, keys, and triggers in standard order

## Available Tools

This project uses the BC Builder MCP server. Available tools:

### AL Compilation & Packaging
| Tool | Description |
|------|-------------|
| compile | Compile AL package using alc.exe |
| GetPackageManifest | Retrieve manifest from .app file |
| CreateSymbolPackage | Create symbol-only package from .app |
| GetLatestSupportedRuntimeVersion | Get latest AL runtime for platform |
| DownloadSymbols | Download symbol packages from connected BC environment |

### Symbol Browsing (USE FOR CONTEXT)
| Tool | Description |
|------|-------------|
| GetAppSymbols | Get summary of all packages with object counts |
| ListObjects | List AL objects (tables, pages, codeunits, etc.) from .app files |
| GetObjectDetails | Get summary info about an object (counts, primary key) |
| GetObjectFields | Get fields/controls/values with pagination (offset, limit) |
| GetObjectMethods | Get methods with pagination (offset, limit) |
| SearchSymbols | Search for symbols by name across all packages |
| GetDependencies | Get dependencies declared in an app package |
| ListIntegrationEvents | List integration events (summary), filter by objectType/objectId/query |
| GetIntegrationEventDetails | Get full details of an event (parameters, includeSender, etc.) |

**When to use symbol tools:**
- **Understanding available objects**: Use ListObjects to see what tables, pages, codeunits exist
- **Getting object summary**: Use GetObjectDetails to see counts and primary key
- **Getting fields/methods**: Use GetObjectFields and GetObjectMethods with pagination
- **Finding symbols**: Use SearchSymbols to find objects or members by name pattern
- **Finding events to subscribe to**: Use ListIntegrationEvents to discover integration events
- **Checking dependencies**: Use GetDependencies to understand app relationships

### Project Memory & Context (USE PROACTIVELY)

**IMPORTANT: You MUST use memory tools to persist knowledge across sessions.**

| Tool | Description |
|------|-------------|
| CreateMemory | Store facts/context about this project |
| GetMemories | Retrieve stored project memories |
| UpdateMemory | Update existing memory entries |
| DeleteMemory | Remove memory entries |

**When to use memories:**
- **Start of every session**: Call GetMemories first to load project context
- **Architectural decisions**: Store why patterns/approaches were chosen
- **Conventions discovered**: Record coding patterns, naming conventions, structure
- **User preferences**: Remember how the user prefers things done
- **Complex context**: Store information that took effort to discover

Use categories: 'architecture', 'convention', 'context', 'decision', 'preference'

### Change Tracking (USE AFTER EVERY CHANGE)

**IMPORTANT: You MUST create changelog entries after completing code changes.**

| Tool | Description |
|------|-------------|
| CreateChangeLog | Record changes made to the project |
| GetChangeLogs | Retrieve change history |
| UpdateChangeLogSummary | Update change log descriptions |

**When to use changelogs:**
- **After completing any task**: Log all files changed and summarize work done
- **Before starting work**: Review recent changelogs to understand modifications
- **After fixing bugs**: Document what was fixed and why

### Project Settings
| Tool | Description |
|------|-------------|
| SetProjectSetting | Store project configuration |
| GetProjectSetting | Retrieve specific setting |
| GetAllProjectSettings | List all project settings |
| DeleteProjectSetting | Remove a setting |

### Conversation Search (USE WHEN USER REFERENCES PAST)

**IMPORTANT: You have FULL ACCESS to all previous conversations for this project.**

| Tool | Description |
|------|-------------|
| SearchConversations | Search messages across all project conversations by text or regex pattern |
| GetConversationContext | Retrieve a message with surrounding messages for context |

**When to use conversation search:**
- **User references past discussions**: Any temporal language suggesting prior conversations or sessions
- **User expects existing knowledge**: When phrasing implies you should already know something
- **Missing context**: When user mentions concepts, decisions, or details you lack context for
- **Continuing previous work**: When resuming tasks that may span multiple sessions
- **Verifying past decisions**: When discussing previous architectural choices or implementations

**Trigger patterns - search conversations when you detect:**
- References to prior interactions or shared history with the user
- Expectations that you recall previously discussed information
- Mentions of decisions, preferences, or context established in past sessions
- Questions about "why" something was done a certain way (may reference past reasoning)

### Git Integration (FOLLOW PROJECT SETTINGS)

**IMPORTANT: Check git settings at the start of each session and follow the configured mode.**

| Tool | Description |
|------|-------------|
| GitGetStatus | Get current git status (branch, dirty state, staged/modified/untracked files) |
| GitGetSettings | Get project git mode and commit style settings |
| GitCreateBranch | Create and switch to a new branch |
| GitStageAll | Stage all modified and untracked files |
| GitCommit | Stage all changes and create a commit with message |
| GitGetDiff | Get summary of uncommitted changes |
| GitGenerateBranchName | Generate a descriptive branch name from task description |
| GitGetBranches | List all branches in the repository |
| GitSwitchBranch | Switch to an existing branch |

**Git Modes (check with GitGetSettings):**
- **auto-branching**: Create a new branch at session start using GitGenerateBranchName, commit per style
- **auto-commit**: Commit to current branch per commit style
- **manual**: Only report status when asked, user handles git operations

**Commit Styles:**
- **practical**: Commit after each response that modifies files
- **bundled**: Single commit at the end of the session/task

**At session start (when git configured):**
1. Call GitGetSettings to check mode and style
2. If auto-branching: Call GitGenerateBranchName with the task description, then GitCreateBranch
3. If auto-commit or manual: Continue on current branch

**During work (when mode != manual):**
1. After making code changes, check if there are uncommitted changes with GitGetStatus
2. If practical style: Commit after each response that modified files
3. If bundled style: Track changes, commit at session end when user is done

## Project Structure

- src/ - AL source files (.al)
- .alpackages/ - Symbol packages (do not commit)
- app.json - Extension manifest
- .vscode/ - VS Code configuration
