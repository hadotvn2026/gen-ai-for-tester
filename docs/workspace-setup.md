# Thiết lập Workspace

> Hoàn thành trước buổi học đầu tiên — mất khoảng **10 phút**.

---

## Yêu cầu tối thiểu

| Công cụ | Phiên bản | Tải về |
|---------|-----------|--------|
| **Node.js** | 18 trở lên | [nodejs.org](https://nodejs.org) |
| **VS Code** | Mới nhất | [code.visualstudio.com](https://code.visualstudio.com) |
| **Git** | Bất kỳ | [git-scm.com](https://git-scm.com) |

---

## Bước 1 — Clone repo

```bash
git clone https://github.com/hadotvn2026/gen-ai-for-tester.git
cd gen-ai-for-tester/workspace
```

---

## Bước 2 — Chạy script cài đặt

```bash
bash setup.sh
```

Script tự động: kiểm tra Node.js/Git → cài Playwright + Chromium → chạy 2 test mẫu.

Kết quả mong đợi:

```
✅  Node.js v20.x.x
✅  Git 2.x.x
✅  npm packages installed
✅  Chromium browser ready
✅  All tests passed
```

---

## Bước 3 — Mở trong VS Code

```bash
code .
```

Khi VS Code hỏi **"Install recommended extensions?"** → chọn **Install All**.

Extensions được cài tự động:

- **GitHub Copilot** — AI pair programming *(Session 4+)*
- **Playwright Test for VS Code** — chạy test ngay trong editor
- **Markdown All in One** — xem preview notes và prompts

---

## Xong! Bạn đã sẵn sàng cho Session 1–4.

---

## Cài thêm cho Session 5–6

Session 5 và 6 dùng **Claude Code** và **MCP Servers**. Cài khi đến session đó, không cần làm ngay.

### Claude Code

```bash
npm install -g @anthropic-ai/claude-code
claude
```

### MCP Playwright

```bash
claude mcp add playwright -- npx -y @playwright/mcp@latest
```

### MCP Jira

Lấy API token tại [id.atlassian.com → Security → API tokens](https://id.atlassian.com/manage-profile/security/api-tokens), sau đó:

```bash
cp .env.example .env
# Mở .env, điền JIRA_BASE_URL, JIRA_EMAIL, JIRA_API_TOKEN

claude mcp add jira \
  --env JIRA_BASE_URL \
  --env JIRA_EMAIL \
  --env JIRA_API_TOKEN \
  -- npx -y @modelcontextprotocol/server-jira
```

Kiểm tra:

```bash
claude mcp list
# jira: npx -y @modelcontextprotocol/server-jira
# playwright: npx -y @playwright/mcp@latest
```

---

## Troubleshooting

!!! tip "Node.js không đúng version"
    Dùng [nvm](https://github.com/nvm-sh/nvm) để cài đúng version:
    ```bash
    nvm install 20 && nvm use 20
    ```

!!! tip "Playwright báo lỗi browser not found"
    ```bash
    cd playwright-tests
    npx playwright install --with-deps chromium
    ```

!!! tip "MCP Jira không kết nối được"
    ```bash
    cat .env        # kiểm tra đủ 3 biến JIRA_*
    claude mcp list # kiểm tra jira có trong danh sách
    ```
