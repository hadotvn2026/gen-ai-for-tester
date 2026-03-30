# 🤖 Generative AI for Testers

> Khóa học tự học thực hành — ứng dụng AI vào kiểm thử phần mềm theo đúng workflow thực tế của bạn

![Sessions](https://img.shields.io/badge/Sessions-6-purple)
![Duration](https://img.shields.io/badge/Duration-3h%2Fsession-teal)
![Language](https://img.shields.io/badge/Language-Tiếng%20Việt-blue)
![Level](https://img.shields.io/badge/Level-Beginner%20→%20Advanced-orange)
![Format](https://img.shields.io/badge/Format-Self--Study-green)

---

## 📌 Giới thiệu khóa học

Khóa học **Generative AI for Testers** được thiết kế dành cho tất cả mọi người trong vòng đời phần mềm — không chỉ QA kỹ thuật:

- **Manual Tester** — tăng tốc test case, bug report, phân tích regression scope
- **QA Automation Engineer** — viết và debug script nhanh hơn với AI pair programming
- **Business Analyst** — review AC tự động, phát hiện gap requirement sớm
- **Product Owner** — hiểu AI risk, governance và đặt kỳ vọng đúng với team
- **QA Lead** — chuẩn hóa AI workflow cho team, xây dựng quality gate
- **QA Manager** — lộ trình adoption, đo ROI, quản lý rủi ro tổ chức

**Phương pháp học:** 40% lý thuyết · 60% thực hành · Tự học theo tốc độ của bạn

> **💡 Không cần biết code để bắt đầu.** Mỗi session đều có hướng dẫn riêng cho từng role — kể cả những bài tập kỹ thuật cũng có lối đi cho người không lập trình.

---

## 🔵 3-Circle Model — Nền tảng toàn khóa học

Ba nguyên tắc này xuất hiện xuyên suốt mọi session. Khi AI cho output kém, hãy tự hỏi: bạn đang thiếu nguyên tắc nào?

```
        ┌─────────────┐
        │   MINDSET   │  ← Hiểu AI, giữ hoài nghi lành mạnh
        └──────┬──────┘
               │
        ┌──────▼──────┐
        │  TECHNIQUE  │  ← Prompt engineering, làm chủ AI
        └──────┬──────┘
               │
        ┌──────▼──────┐
        │   CONTEXT   │  ← Bối cảnh cụ thể = Output giá trị
        └─────────────┘
```

---

## 🎯 Học theo role của bạn

> Bắt đầu từ lộ trình phù hợp với công việc hằng ngày — sau đó mở rộng dần. Mỗi role có **kỹ năng cốt lõi** và **công cụ chính** riêng.

### 👩‍🔬 Manual Tester

| | |
|---|---|
| **Mục tiêu** | Tăng tốc viết test case, bug report chuyên nghiệp, xác định regression scope thông minh |
| **Kỹ năng đạt được** | Prompt Library cá nhân · Context Card cho dự án · AI-assisted bug report · Test Execution Report tự động |
| **Công cụ chính** | ChatGPT · Claude.ai · NotebookLM |
| **Lộ trình** | [S1](./sessions/session-01-mindset.md) → [S2](./sessions/session-02-technique.md) *(Prompt 1,2,5,6)* → [S3](./sessions/session-03-context.md) → [S4](./sessions/session-04-skill-building.md) *(Bước 1–4)* |
| **Có thể bỏ qua** | S4 Bước 5 (chạy code), phần lab kỹ thuật trong S5–S6 |

### ⚙️ QA Automation Engineer

| | |
|---|---|
| **Mục tiêu** | Viết và debug script nhanh hơn, tạo test data thông minh, xây AI-assisted framework |
| **Kỹ năng đạt được** | AI pair programming với Copilot · POM generation · Flaky test analysis · QA Agent đơn giản |
| **Công cụ chính** | GitHub Copilot · VS Code · Claude.ai · Node.js (Playwright) |
| **Lộ trình** | [S1](./sessions/session-01-mindset.md) → [S2](./sessions/session-02-technique.md) → [S3](./sessions/session-03-context.md) → [S4](./sessions/session-04-skill-building.md) → [S5](./sessions/session-05-ai-agent.md) → [S6](./sessions/session-06-agentic-ai.md) |
| **Có thể bỏ qua** | Không — tất cả đều relevant |

### 📋 Business Analyst

| | |
|---|---|
| **Mục tiêu** | Review AC tự động, phát hiện gap requirement, viết Gherkin scenarios từ mô tả nghiệp vụ |
| **Kỹ năng đạt được** | AC Review Prompt · User Story từ meeting notes · Gherkin generation · Context injection cho QA |
| **Công cụ chính** | ChatGPT · Claude.ai · NotebookLM |
| **Lộ trình** | [S1](./sessions/session-01-mindset.md) → [S2](./sessions/session-02-technique.md) *(Prompt 1,5)* → [S3](./sessions/session-03-context.md) → [S6](./sessions/session-06-agentic-ai.md) *(phần 1.4)* |
| **Có thể bỏ qua** | S4 Bước 4–5, phần technical lab trong S5 |

### 🎯 Product Owner

| | |
|---|---|
| **Mục tiêu** | Hiểu AI risk, đặt kỳ vọng đúng với team, nắm governance khi team áp dụng AI |
| **Kỹ năng đạt được** | AI risk framework · Data privacy checklist · Hiểu luồng từ requirement đến AI-generated test |
| **Công cụ chính** | ChatGPT · Claude.ai · NotebookLM |
| **Lộ trình** | [S1](./sessions/session-01-mindset.md) → [S6](./sessions/session-06-agentic-ai.md) *(phần 1.4)* → [S2](./sessions/session-02-technique.md) *(đọc nhanh)* → [S3](./sessions/session-03-context.md) |
| **Có thể bỏ qua** | Lab kỹ thuật trong S4–S5 |

### 🏆 QA Lead

| | |
|---|---|
| **Mục tiêu** | Chuẩn hóa AI workflow cho team, xây quality gate cho AI-generated artifacts, onboard team member |
| **Kỹ năng đạt được** | Team Prompt Library · Shared Context Card · Quality gate checklist · QA Team Agent design |
| **Công cụ chính** | Claude.ai (Projects) · GitHub Copilot · VS Code · Antigravity |
| **Lộ trình** | Toàn bộ 6 sessions — cần đủ để hiểu từng bước team đang làm |
| **Có thể bỏ qua** | Không |

### 📊 QA Manager

| | |
|---|---|
| **Mục tiêu** | Adoption roadmap, đo ROI, quản lý rủi ro tổ chức, thuyết phục stakeholder |
| **Kỹ năng đạt được** | AI maturity self-assessment · KPI framework · Vendor evaluation criteria · Governance policy |
| **Công cụ chính** | ChatGPT · Claude.ai · NotebookLM |
| **Lộ trình** | [S1](./sessions/session-01-mindset.md) → [S6](./sessions/session-06-agentic-ai.md) → [S2](./sessions/session-02-technique.md) → [S3](./sessions/session-03-context.md) |
| **Có thể bỏ qua** | Lab kỹ thuật trong S4–S5 *(đọc overview là đủ)* |

> **💡 Xu hướng 2025:** Ranh giới giữa các role đang mờ dần — Manual Tester cần đọc được automation output; BA tham gia shift-left quality từ giai đoạn grooming; "vibe-coding" với Copilot/Cursor đang trở thành kỹ năng mặc định. Lộ trình trên là điểm khởi đầu — không phải giới hạn.

---

## 📚 Chương trình học

| Session | Chủ đề | Nguyên tắc | Thời lượng |
|---------|--------|------------|------------|
| [Session 1](./sessions/session-01-mindset.md) | Mindset — AI là Co-Pilot của bạn | 🔵 Mindset | 3 giờ |
| [Session 2](./sessions/session-02-technique.md) | Technique — Prompt Engineering cho Tester | 🟢 Technique | 3 giờ |
| [Session 3](./sessions/session-03-context.md) | Context — Biến AI hiểu dự án của bạn | 🔴 Context | 3 giờ |
| [Session 4](./sessions/session-04-skill-building.md) | Skill Building — Automation với AI | 🟡 Apply | 3 giờ |
| [Session 5](./sessions/session-05-ai-agent.md) | AI Agent — Từ trợ lý đến Tester tự động | 🔵 Agent | 3 giờ |
| [Session 6](./sessions/session-06-agentic-ai.md) | Agentic AI — QA Team Agent & Capstone | 🟢 Advanced | 3 giờ |

---

## 🛠️ Công cụ sử dụng trong khóa học

### AI Tools — Dùng ngay, không cần cài đặt

| Công cụ | Mục đích trong khóa học | Miễn phí? |
|---------|------------------------|-----------|
| [ChatGPT](https://chat.openai.com) | Test case generation, bug analysis, brainstorm | ✅ Free tier |
| [Claude.ai](https://claude.ai) | Skill builder, AI Agent, long-context analysis | ✅ Free tier |
| [Gemini](https://gemini.google.com) | Tổng quát, tích hợp Google Workspace | ✅ Free |
| [NotebookLM](https://notebooklm.google.com) | Tổ chức ghi chú khóa học, tạo Q&A từ tài liệu dự án, nghiên cứu tài liệu dài | ✅ Free |

### Developer Tools — Cần cài đặt (Session 4 trở đi)

| Công cụ | Mục đích trong khóa học | Cài đặt |
|---------|------------------------|---------|
| [VS Code](https://code.visualstudio.com) | IDE cho automation script, tích hợp GitHub Copilot | ✅ Free · [Tải về](https://code.visualstudio.com/download) |
| [GitHub Copilot](https://github.com/features/copilot) | AI pair programming trong VS Code | 💰 30 ngày trial · [Đăng ký](https://github.com/features/copilot) |
| [Antigravity](https://antigravity.dev) | AI-assisted test automation, tích hợp với pipeline | ✅ Free tier |
| **Node.js** | Runtime cần thiết để chạy Playwright (Session 4) | ✅ Free · Xem hướng dẫn bên dưới |

### Cài đặt Node.js

Node.js là bắt buộc nếu bạn muốn chạy **Playwright** (framework automation testing hiện đại nhất 2025). Manual Tester và BA có thể bỏ qua bước này.

```bash
# Bước 1 — Tải và cài Node.js LTS (Long Term Support)
# Vào https://nodejs.org → chọn phiên bản LTS → cài đặt

# Bước 2 — Kiểm tra cài đặt thành công
node --version    # kết quả: v20.x.x hoặc cao hơn
npm --version     # kết quả: 10.x.x hoặc cao hơn

# Bước 3 — Cài Playwright
npm init playwright@latest

# Bước 4 — Chạy thử test mẫu
npx playwright test
```

> 💡 **Gợi ý:** Nếu gặp lỗi permission trên macOS/Linux, thêm `sudo` trước lệnh npm. Trên Windows, chạy terminal với quyền Administrator.

---

## 🚀 Bắt đầu nhanh

1. Xác định role của bạn trong bảng **"Học theo role"** ở trên
2. Mở session đầu tiên theo lộ trình được đề xuất
3. Cài đặt công cụ AI (ChatGPT hoặc Claude.ai — chọn 1 là đủ để bắt đầu)
4. Dùng `resources/prompt-library.md` để tra cứu nhanh khi làm việc thực tế

---

*Được tạo bởi QA Automation Trainer — 10 năm kinh nghiệm*
