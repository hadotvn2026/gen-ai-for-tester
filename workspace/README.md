# GenAI for Testers — Workspace

Workspace thực hành cho khóa học **Generative AI for Testers**.
Mở folder này trong VS Code và bắt đầu ngay.

---

## Cài đặt lần đầu

### Bước 1 — Mở workspace trong VS Code

```bash
code workspace/
```

Khi VS Code hỏi "Install recommended extensions?" → chọn **Install All**.

Các extension cần thiết (tự động cài):
- **GitHub Copilot** — AI pair programming
- **Playwright Test for VS Code** — chạy test ngay trong editor
- **Antigravity** — AI-assisted test automation
- **Markdown All in One** — preview notes và prompts

---

### Bước 2 — Cài Playwright

```bash
cd playwright-tests
npm install
npx playwright install --with-deps chromium
```

Chạy test thử:
```bash
npm test
# Xem report:
npm run report
```

---

### Bước 3 — Cài đặt MCP Servers (cho Claude Code)

MCP cho phép Claude Code tương tác trực tiếp với Jira và trình duyệt.

#### 3a. Jira MCP

```bash
# Tạo file .env từ template
cp .env.example .env

# Điền thông tin Jira vào .env:
# JIRA_BASE_URL=https://yourcompany.atlassian.net
# JIRA_EMAIL=your-email@company.com
# JIRA_API_TOKEN=<token từ https://id.atlassian.com/manage-profile/security/api-tokens>
```

Đăng ký MCP với Claude Code:
```bash
claude mcp add jira \
  --env JIRA_BASE_URL \
  --env JIRA_EMAIL \
  --env JIRA_API_TOKEN \
  -- npx -y @modelcontextprotocol/server-jira
```

#### 3b. Playwright MCP

```bash
claude mcp add playwright -- npx -y @playwright/mcp@latest
```

Kiểm tra MCP đã cài:
```bash
claude mcp list
```

---

### Bước 4 — Cài đặt Antigravity

1. Cài extension **Antigravity** từ VS Code Marketplace (đã có trong recommended)
2. Tạo tài khoản tại [antigravity.dev](https://antigravity.dev)
3. Trong VS Code: `Cmd/Ctrl + Shift + P` → "Antigravity: Sign In"
4. Chọn project hoặc tạo mới → liên kết với repo này

---

## Cấu trúc workspace

```
workspace/
├── .vscode/
│   ├── extensions.json     # Extension recommendations
│   └── settings.json       # VS Code settings
├── .claude/
│   ├── CLAUDE.md           # Context cho Claude Code
│   └── mcp-config.json     # MCP server config (tham khảo)
├── prompt-library/
│   └── my-prompts.md       # Prompt của bạn — tích lũy theo khoá học
├── context-cards/
│   └── project-context-template.md  # Template Context Card
├── session-artifacts/
│   ├── s1-mindset/         # Notes & reflections từ Session 1
│   ├── s2-technique/       # Prompt experiments từ Session 2
│   ├── s3-context/         # Context Card dự án thực tế (Session 3)
│   ├── s4-automation/      # Test scripts + Jira templates (Session 4)
│   ├── s5-agent/           # QA Agent design docs (Session 5)
│   └── s6-capstone/        # Capstone project output (Session 6)
├── playwright-tests/
│   ├── tests/              # Test specs
│   ├── pages/              # Page Object Models
│   ├── playwright.config.ts
│   └── package.json
├── .env.example            # Template biến môi trường
└── README.md               # File này
```

---

## Dùng Claude Code trong workspace

```bash
# Mở Claude Code từ thư mục workspace
cd workspace && claude

# Một số lệnh hay dùng trong khóa học:
```

| Lệnh | Session |
|------|---------|
| "Generate Playwright tests cho [feature]" | S4 |
| "Review file tests/login.spec.ts, suggest improvements" | S4 |
| "Tạo Jira bug report từ [test failure output]" | S4+S5 |
| "Thiết kế QA Agent cho workflow regression testing" | S5 |
| "Chạy playwright test và tóm tắt kết quả" | S5+S6 |

---

## Troubleshooting

**Playwright không chạy được?**
```bash
npx playwright install --with-deps
```

**Claude Code không thấy MCP Jira?**
```bash
# Kiểm tra biến môi trường
cat .env  # đảm bảo đã điền đủ 3 biến JIRA_*
claude mcp list  # kiểm tra jira có trong danh sách
```

**Antigravity extension không hoạt động?**
- Đảm bảo đã sign in: `Cmd+Shift+P` → "Antigravity: Sign In"
- Restart VS Code sau khi sign in
