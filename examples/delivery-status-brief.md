# Delivery Status Brief Example

Use `delivery-status-brief` when a project needs a clear status update instead of a loose progress narrative.

Prompt:

```text
Use delivery-status-brief for the onboarding dashboard project.

Audience: sponsor and cross-functional leads
Period: May 1-15
Status: amber
Progress: API contract agreed, dashboard wireframes approved, analytics events still open
Blockers: data warehouse table ownership unclear
Risks: launch date slips if event tracking is not agreed this week
Decision needed: should analytics events block beta or ship behind a follow-up flag?
```

Expected output:

- Status summary
- Progress since last update
- Risks and blockers
- Decisions needed
- Next actions with owners and dates

