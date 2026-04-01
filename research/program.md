# Research Program — GenAI for Testers

## Mission

Keep the course "Generative AI for Testers" current, accurate, and practical.
The course teaches Vietnamese QA testers to apply AI in their daily workflows.

## Course Structure

| Session | Topic | Key Tools |
|---------|-------|-----------|
| S1 | Mindset & AI Limitations | ChatGPT, Claude |
| S2 | Prompt Engineering Techniques | Any LLM |
| S3 | Context Management | RAG, Context Cards |
| S4 | Skill Building & Automation | GitHub Copilot, Playwright |
| S5 | AI Agents | Claude Code, MCP |
| S6 | Agentic AI & QA Teams | Multi-agent pipelines |

## Research Scope

Search for developments in the **past 7 days** across topics listed in `topics.md`.

## Output Format

Write findings to `research/daily/YYYY-MM-DD.md` using this structure:

```markdown
# Research — YYYY-MM-DD

## Findings

### [Title of finding]
- **Source**: URL
- **Affects**: Session X — [section name]
- **Why it matters**: One sentence
- **Suggested update**: Concrete edit (1–3 sentences)

## No-action items
Brief list of things checked but not worth updating.
```

After writing the daily file, append one line to `research/changelog.md`:
```
YYYY-MM-DD | [finding count] findings | [one-line summary]
```

## Rules

- Only suggest updates that directly affect course accuracy or relevance
- Do not rewrite whole sessions — suggest targeted patches
- Prefer adding new examples over changing existing explanations
- Keep Vietnamese tone and QA-tester audience in mind
- Skip findings that are marketing/hype without substance
