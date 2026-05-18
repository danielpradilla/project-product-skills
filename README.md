# Project + Product Skills

This is a practical skill kit for the weekly work of running projects and products across Codex, Claude Code, and Gemini CLI.

It is built around the documents and decisions that keep work moving: meeting notes, status briefs, product requirements, discovery synthesis, roadmap narratives, prioritization, delivery planning, launch readiness, workshops, offsites, interview kits, onboarding plans, and PRINCE2 project packs.

The goal is simple: give an AI agent enough structure to produce useful operating artifacts without turning every request into a consulting deck. Most of these skills are meant to create something you can paste into a working doc, review with a team, or use in a project meeting the same day.

The set is deliberately focused at 42 skills. The bias is toward project and product management work that repeats often and benefits from a clear format.

Note: this repo is inspired by Mohit Aggarwal's open-source Claude skills library. I reshaped the collection around my own project/product workflow and packaged this version for Codex, Claude Code, and Gemini CLI.

## Install

### macOS or Linux

Codex:

```bash
cd /Users/dpradilla/dev/project-product-skills
./scripts/install-codex.sh
```

Claude Code:

```bash
cd /Users/dpradilla/dev/project-product-skills
./scripts/install-claude.sh
```

Gemini CLI:

```bash
cd /Users/dpradilla/dev/project-product-skills
./scripts/install-gemini.sh
```

### Windows PowerShell

Codex:

```powershell
.\scripts\install-codex.ps1
```

Claude Code:

```powershell
.\scripts\install-claude.ps1
```

Gemini CLI:

```powershell
.\scripts\install-gemini.ps1
```

The macOS/Linux installers symlink skills into the agent skill folder. The Windows installers copy skills by default because symlinks can require Developer Mode or elevated permissions.

## Requirements

- Git, if you are cloning the repo.
- Codex, Claude Code, or Gemini CLI depending on which agent you use.
- Bash on macOS/Linux.
- PowerShell on Windows.
- Gemini CLI on your `PATH` if you use the Gemini installer.

## Test It

After installing, restart the agent and try:

```text
Use product-requirements-blueprint to draft requirements for a customer onboarding dashboard.
```

Or:

```text
Use prince2-documentation-map to list the management products needed for a medium-risk software project.
```

## Skill Set

### Run The Work

- `decision-meeting-notes`
- `delivery-status-brief`
- `stakeholder-decision-note`
- `executive-product-note`
- `workshop-runbook`
- `team-offsite-agenda`

### Define The Product

- `product-requirements-blueprint`
- `technical-alignment-brief`
- `outcome-map`
- `roadmap-story-brief`
- `roadmap-review-outline`
- `strategic-story-builder`

### Learn From Customers

- `discovery-conversation-guide`
- `interview-signal-synthesis`
- `research-evidence-brief`
- `assumption-risk-ledger`
- `job-to-be-done-map`

### Make Better Decisions

- `metric-architecture`
- `product-health-diagnostic`
- `retention-diagnostic`
- `dashboard-decision-brief`
- `market-landscape-scan`
- `priority-decision-system`
- `learning-experiment-plan`
- `pricing-packaging-brief`

### Deliver And Launch

- `delivery-commitment-map`
- `sprint-kickoff-brief`
- `retrospective-insight-brief`
- `handoff-readiness-brief`
- `launch-readiness-review`
- `launch-control-checklist`
- `market-activation-plan`

### Run PRINCE2 Projects

- `prince2-startup-brief`
- `prince2-initiation-pack`
- `prince2-direction-gate-brief`
- `prince2-stage-control-pack`
- `prince2-product-delivery-pack`
- `prince2-stage-boundary-pack`
- `prince2-closure-pack`
- `prince2-documentation-map`

### Build The Team

- `role-interview-kit`
- `team-onboarding-plan`

## How I Use It

I do not think of these as prompts. I think of them as reusable operating artifacts.

When a product review is messy, I use `roadmap-story-brief`.
When a project is drifting, I use `delivery-status-brief`.
When the team has too many opinions and not enough evidence, I use `assumption-risk-ledger`.
When a launch feels vague, I use `launch-readiness-review`.
When a governed project needs structure, I use `prince2-documentation-map` first and then the phase-specific PRINCE2 skill.

That is the point of this repo: fewer skills, stronger defaults, and names that match the work.

