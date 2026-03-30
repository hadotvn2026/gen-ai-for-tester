# 🤖 Generative AI for Testers

> Khóa học thực hành 2 ngày — ứng dụng AI vào kiểm thử phần mềm theo đúng workflow thực tế của bạn

![Sessions](https://img.shields.io/badge/Sessions-6-purple)
![Duration](https://img.shields.io/badge/Duration-2%20Sundays%20×%206hr-teal)
![Language](https://img.shields.io/badge/Language-Tiếng%20Việt-blue)
![Level](https://img.shields.io/badge/Level-Beginner%20→%20Advanced-orange)
![Format](https://img.shields.io/badge/Format-Self--Study%20%2B%20Live-green)

📖 **Website khóa học:** [hadotvn2026.github.io/gen-ai-for-tester](https://hadotvn2026.github.io/gen-ai-for-tester/)

---

## 📌 Giới thiệu

Khóa học dành cho tất cả mọi người trong vòng đời phần mềm:

| Role | Trọng tâm |
|------|-----------|
| **Manual Tester** | Tăng tốc test case, bug report, regression scope |
| **QA Automation Engineer** | AI pair programming, POM generation, flaky test debug |
| **Business Analyst** | AC review tự động, Gherkin generation, User Story |
| **Product Owner** | AI risk framework, governance, đặt kỳ vọng đúng |
| **QA Lead** | Chuẩn hóa AI workflow, quality gate, team prompt library |
| **QA Manager** | Adoption roadmap, KPI/ROI, governance policy |

**Phương pháp:** 40% lý thuyết · 60% thực hành · Kết hợp live 2 ngày + tự học mở rộng

> 💡 Không cần biết code để bắt đầu. Mỗi session có lối đi riêng cho non-coder.

---

## 🗓️ Lịch học 2 ngày

| Ngày | Buổi | Nội dung |
|------|------|----------|
| **Chủ nhật 1** | ☀️ Sáng 8:30–11:30 | Mindset + Technique (Prompt 1–3) |
| | 🌤️ Chiều 13:00–16:00 | Technique (Prompt 4–6) + Context |
| **Chủ nhật 2** | ☀️ Sáng 8:30–11:30 | Skill Building — Automation với AI |
| | 🌤️ Chiều 13:00–16:00 | AI Agent + Agentic AI + Capstone |

---

## 📚 Chương trình học

| Session | Chủ đề | Nguyên tắc |
|---------|--------|------------|
| [Session 1](./docs/sessions/session-01-mindset.md) | Mindset — AI là Co-Pilot của bạn | 🔵 Mindset |
| [Session 2](./docs/sessions/session-02-technique.md) | Technique — Prompt Engineering cho Tester | 🟢 Technique |
| [Session 3](./docs/sessions/session-03-context.md) | Context — Biến AI hiểu dự án của bạn | 🔴 Context |
| [Session 4](./docs/sessions/session-04-skill-building.md) | Skill Building — Automation với AI | 🟡 Apply |
| [Session 5](./docs/sessions/session-05-ai-agent.md) | AI Agent — Từ trợ lý đến Tester tự động | 🔵 Agent |
| [Session 6](./docs/sessions/session-06-agentic-ai.md) | Agentic AI — QA Team Agent & Capstone | 🟢 Advanced |

---

## 🛠️ Công cụ

**AI Tools (dùng ngay, miễn phí):**
[ChatGPT](https://chat.openai.com) · [Claude.ai](https://claude.ai) · [Gemini](https://gemini.google.com) · [NotebookLM](https://notebooklm.google.com)

**Developer Tools (Session 4+):**
[VS Code](https://code.visualstudio.com) · [GitHub Copilot](https://github.com/features/copilot) · [Antigravity](https://antigravity.dev) · Node.js + Playwright

---

## 🗂️ Cấu trúc repo

```
genai-for-testers/
├── docs/
│   ├── index.md                   ← Trang chủ (MkDocs)
│   ├── workspace-setup.md         ← Hướng dẫn setup môi trường
│   ├── sessions/                  ← Nội dung 6 sessions
│   └── resources/
│       ├── prompt-library.md      ← Thư viện prompt mẫu
│       └── cheat-sheets.md        ← Cheat sheet tổng hợp
├── workspace/                     ← Scaffold thực hành cho học viên
│   ├── .vscode/                   ← VS Code settings + extensions
│   ├── .claude/                   ← CLAUDE.md + MCP config
│   ├── prompt-library/            ← Prompt cá nhân (tích lũy)
│   ├── context-cards/             ← Context Card template
│   ├── session-artifacts/         ← Output từng session (s1–s6)
│   └── playwright-tests/          ← Playwright starter + POM
├── mkdocs.yml
└── README.md
```

---

## 🚀 Bắt đầu nhanh

```bash
git clone https://github.com/hadotvn2026/gen-ai-for-tester.git
cd gen-ai-for-tester/workspace
code .
```

Xem [hướng dẫn setup đầy đủ](./docs/workspace-setup.md) để cài Playwright + MCP Jira + Antigravity.

---

*Được tạo bởi QA Automation Trainer — 10 năm kinh nghiệm*
