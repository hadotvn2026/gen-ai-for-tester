# Jira Bug Report — từ Playwright Test Failure

> Template dùng với MCP Jira hoặc tạo thủ công trong Jira.
> Session 4 Exercise: Dùng Claude Code + Jira MCP để tạo issue tự động.

---

## Bug Summary
<!-- 1 dòng: [Component] [Action] [Expected vs Actual] -->
[LOGIN] User cannot login with valid credentials — redirected to 404 page

## Jira Fields

| Field | Value |
|-------|-------|
| **Project** | [JIRA_PROJECT_KEY] |
| **Issue Type** | Bug |
| **Priority** | High |
| **Labels** | regression, authentication |
| **Component** | [Login / Checkout / ...] |
| **Affects Version** | [sprint-XX / v1.2.0] |

## Steps to Reproduce
1. Navigate to [URL]
2. Enter valid username: `testuser@example.com`
3. Enter valid password: `Test@1234`
4. Click "Login" button

## Expected Result
User is redirected to dashboard page `/dashboard`

## Actual Result
User is redirected to 404 error page

## Test Evidence
- **Test file:** `playwright-tests/tests/login.spec.ts`
- **Test name:** `should login with valid credentials`
- **Screenshot:** [attach from `test-results/`]
- **Trace:** [attach playwright trace file]

## Environment
- **URL:** [staging URL]
- **Browser:** Chromium (Playwright)
- **OS:** [macOS / Windows / Linux]
- **Build:** [commit hash hoặc build number]

---

## Dùng với Claude Code + Jira MCP

```
Hãy tạo Jira bug report từ test failure sau, trong project [PROJECT_KEY]:

Test failure:
[DÁN OUTPUT LỖI PLAYWRIGHT VÀO ĐÂY]

Fields:
- Priority: High
- Labels: regression, [component-name]
- Assignee: [để trống hoặc account ID]
```
