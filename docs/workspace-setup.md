# 🛠️ Workspace Setup

> Thiết lập môi trường làm việc trước buổi học — mất khoảng **15–20 phút**.

---

## Tổng quan

Workspace bao gồm:

| Công cụ | Mục đích | Khi nào cần |
|---------|----------|-------------|
| **VS Code** | Editor chính, tích hợp mọi AI tool | Ngay từ đầu |
| **GitHub Copilot** | AI pair programming trong editor | Session 4+ |
| **Antigravity** | AI-assisted test automation | Session 4+ |
| **Playwright** | Test framework thực hành | Session 4+ |
| **Claude Code** | AI agent trong terminal | Session 5+ |
| **MCP Jira** | Tạo Jira issue từ Claude Code | Session 5+ |
| **MCP Playwright** | Điều khiển browser từ Claude Code | Session 5+ |

---

## Bước 1 — Clone workspace

```bash
# Clone repo khóa học
git clone https://github.com/hadotvn2026/gen-ai-for-tester.git
cd gen-ai-for-tester/workspace

# Mở trong VS Code
code .
```

Khi VS Code hỏi **"Install recommended extensions?"** → chọn **Install All**.

---

## Bước 2 — Cài Playwright

```bash
cd playwright-tests
npm install
npx playwright install --with-deps chromium
```

Chạy test mẫu để kiểm tra:
```bash
npm test
# Xem HTML report:
npm run report
```

✅ Thành công khi thấy: `2 passed (Xms)`

---

## Bước 3 — Cài đặt Antigravity

1. Cài extension **Antigravity** từ VS Code Marketplace
   - Trong VS Code: `Ctrl+Shift+X` → tìm "Antigravity" → Install
2. Tạo tài khoản miễn phí tại [antigravity.dev](https://antigravity.dev)
3. Đăng nhập: `Ctrl+Shift+P` → **"Antigravity: Sign In"**
4. Tạo project mới → liên kết với repo này

---

## Bước 4 — Cài đặt MCP Servers *(Session 5+)*

MCP cho phép Claude Code tích hợp trực tiếp với Jira và Playwright.

### 4a. Tạo file biến môi trường

```bash
# Từ thư mục workspace/
cp .env.example .env
```

Mở `.env` và điền thông tin:

```bash
JIRA_BASE_URL=https://yourcompany.atlassian.net
JIRA_EMAIL=your-email@company.com
JIRA_API_TOKEN=<your-token>
```

> Lấy Jira API token tại: [id.atlassian.com/manage-profile/security/api-tokens](https://id.atlassian.com/manage-profile/security/api-tokens)

### 4b. Đăng ký Jira MCP

```bash
claude mcp add jira \
  --env JIRA_BASE_URL \
  --env JIRA_EMAIL \
  --env JIRA_API_TOKEN \
  -- npx -y @modelcontextprotocol/server-jira
```

### 4c. Đăng ký Playwright MCP

```bash
claude mcp add playwright -- npx -y @playwright/mcp@latest
```

### Kiểm tra MCP

```bash
claude mcp list
# Kết quả mong đợi:
# jira: npx -y @modelcontextprotocol/server-jira
# playwright: npx -y @playwright/mcp@latest
```

---

## Cấu trúc workspace

```
workspace/
├── .vscode/                      # VS Code config (auto-applied)
├── .claude/
│   └── CLAUDE.md                 # Context cho Claude Code
├── prompt-library/
│   └── my-prompts.md             # Lưu prompt tích lũy theo khóa học
├── context-cards/
│   └── project-context-template.md
├── session-artifacts/            # Output từ từng session
│   ├── s1-mindset/
│   ├── s2-technique/
│   ├── s3-context/
│   ├── s4-automation/            # Jira bug template có sẵn
│   ├── s5-agent/
│   └── s6-capstone/
├── playwright-tests/
│   ├── tests/example.spec.ts     # Starter test
│   ├── pages/BasePage.ts         # Base POM
│   ├── playwright.config.ts
│   └── package.json
└── .env.example                  # Template — copy thành .env
```

---

## Dùng Claude Code trong workspace

```bash
# Mở từ thư mục workspace/
claude
```

Một số lệnh hay dùng:

```
"Generate Playwright tests cho login feature"
"Tạo Jira bug report từ test failure này: [paste output]"
"Review file playwright-tests/tests/example.spec.ts"
"Chạy playwright test và tóm tắt kết quả"
```

---

## Troubleshooting

!!! tip "Playwright báo lỗi browser not found"
    ```bash
    npx playwright install --with-deps chromium
    ```

!!! tip "Claude Code không thấy MCP Jira"
    Kiểm tra `.env` đã điền đủ 3 biến, sau đó re-add:

    ```bash
    cat .env
    claude mcp remove jira
    claude mcp add jira \
      --env JIRA_BASE_URL \
      --env JIRA_EMAIL \
      --env JIRA_API_TOKEN \
      -- npx -y @modelcontextprotocol/server-jira
    ```

!!! tip "Antigravity extension không sign in được"
    Restart VS Code sau khi cài extension. Nếu vẫn lỗi, thử uninstall → reinstall từ Marketplace.

!!! tip "npm install lỗi permission trên macOS"
    ```bash
    sudo npm install
    ```
    Hoặc dùng **nvm** để tránh cần `sudo`: [github.com/nvm-sh/nvm](https://github.com/nvm-sh/nvm)

!!! tip "Không thấy tab Playwright trong VS Code"
    Cài extension **Playwright Test for VS Code** từ Marketplace, sau đó chạy:
    ```bash
    npx playwright install
    ```
    Mở Activity Bar → icon beaker (Testing) để thấy test explorer.
