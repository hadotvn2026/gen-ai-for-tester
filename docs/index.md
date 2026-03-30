# 🤖 Generative AI for Testers

> Khóa học thực hành 2 ngày — ứng dụng AI vào kiểm thử phần mềm theo đúng workflow thực tế của bạn

![Sessions](https://img.shields.io/badge/Sessions-6-purple)
![Duration](https://img.shields.io/badge/Duration-2%20Sundays%20×%206hr-teal)
![Language](https://img.shields.io/badge/Language-Tiếng%20Việt-blue)
![Level](https://img.shields.io/badge/Level-Beginner%20→%20Advanced-orange)
![Format](https://img.shields.io/badge/Format-Self--Study%20%2B%20Live-green)

---

## 📌 Giới thiệu khóa học

Khóa học **Generative AI for Testers** được thiết kế dành cho tất cả mọi người trong vòng đời phần mềm — không chỉ QA kỹ thuật:

- **Manual Tester** — tăng tốc test case, bug report, phân tích regression scope
- **QA Automation Engineer** — viết và debug script nhanh hơn với AI pair programming
- **Business Analyst** — review AC tự động, phát hiện gap requirement sớm
- **Product Owner** — hiểu AI risk, governance và đặt kỳ vọng đúng với team
- **QA Lead** — chuẩn hóa AI workflow cho team, xây dựng quality gate
- **QA Manager** — lộ trình adoption, đo ROI, quản lý rủi ro tổ chức

**Phương pháp học:** 40% lý thuyết · 60% thực hành · Kết hợp live 2 ngày + tự học mở rộng

> **💡 Không cần biết code để bắt đầu.** Mỗi session đều có hướng dẫn riêng cho từng role — kể cả những bài tập kỹ thuật cũng có lối đi cho người không lập trình.

---

## 🗓️ Lịch học 2 ngày

> Khóa học diễn ra **2 buổi Chủ nhật**, mỗi ngày 6 giờ chia thành **buổi sáng** và **buổi chiều** (3hr/buổi). Nội dung self-study đầy đủ vẫn có trong từng session link bên dưới để bạn ôn lại sau.

### Chủ nhật 1 — Nền tảng AI cho Testing

| Buổi | Thời gian | Nội dung | Session |
|------|-----------|----------|---------|
| ☀️ Sáng | 8:30 – 11:30 | **Mindset** — AI là Co-Pilot của bạn + **Technique** (Prompt 1–3) | [S1](./sessions/session-01-mindset.md) + [S2 đầu](./sessions/session-02-technique.md) |
| 🌤️ Chiều | 13:00 – 16:00 | **Technique** (Prompt 4–6 theo role) + **Context** — Biến AI hiểu dự án | [S2 tiếp](./sessions/session-02-technique.md) + [S3](./sessions/session-03-context.md) |

### Chủ nhật 2 — Ứng dụng AI Thực Chiến

| Buổi | Thời gian | Nội dung | Session |
|------|-----------|----------|---------|
| ☀️ Sáng | 8:30 – 11:30 | **Skill Building** — Automation với AI (cả coder và non-coder path) | [S4](./sessions/session-04-skill-building.md) |
| 🌤️ Chiều | 13:00 – 16:00 | **AI Agent** + **Agentic AI** — Capstone Project theo role | [S5](./sessions/session-05-ai-agent.md) + [S6](./sessions/session-06-agentic-ai.md) |

> **💡 Sau khóa học:** Mỗi session có nội dung self-study đầy đủ (~3hr) để bạn thực hành sâu hơn theo tốc độ riêng.

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

> Bạn cần tốc độ + chất lượng output hàng sprint — không cần viết code.

| | |
|---|---|
| **Kết quả sau khóa học** | ✅ Viết test case nhanh gấp 3–5× bằng AI prompt · ✅ Bug report chuẩn format, không cần sửa lại · ✅ Phân tích regression scope có căn cứ, không phải đoán mò · ✅ Tự động hóa Test Execution Report mỗi sprint |
| **Artifact bạn tự tạo** | Prompt Library cá nhân · Context Card cho dự án · AI-assisted bug report template |
| **Công cụ chính** | ChatGPT · Claude.ai · NotebookLM |
| **Lộ trình** | [S1](./sessions/session-01-mindset.md) → [S2](./sessions/session-02-technique.md) *(Prompt 1,2,5,6)* → [S3](./sessions/session-03-context.md) → [S4](./sessions/session-04-skill-building.md) *(Bước 1–4)* |
| **Có thể bỏ qua** | S4 Bước 5 (chạy code), phần lab kỹ thuật trong S5–S6 |

### ⚙️ QA Automation Engineer

> Bạn cần tốc độ viết & debug script — AI là pair programmer, không thay thế bạn.

| | |
|---|---|
| **Kết quả sau khóa học** | ✅ AI pair programming thực chiến với GitHub Copilot · ✅ Generate POM từ UI description trong vài phút · ✅ Debug flaky test bằng AI — không mất giờ đoán nguyên nhân · ✅ Thiết kế QA Agent tự động hóa regression check |
| **Artifact bạn tự tạo** | Playwright test suite từ AI pair programming · POM template · Flaky test debug checklist · QA Agent design doc |
| **Công cụ chính** | GitHub Copilot · VS Code · Claude.ai · Node.js (Playwright) |
| **Lộ trình** | [S1](./sessions/session-01-mindset.md) → [S2](./sessions/session-02-technique.md) → [S3](./sessions/session-03-context.md) → [S4](./sessions/session-04-skill-building.md) → [S5](./sessions/session-05-ai-agent.md) → [S6](./sessions/session-06-agentic-ai.md) |
| **Có thể bỏ qua** | Không — tất cả đều relevant |

### 📋 Business Analyst

> Bạn cần shift-left quality — bắt bug requirement trước khi dev bắt đầu code.

| | |
|---|---|
| **Kết quả sau khóa học** | ✅ Phát hiện missing AC trước khi dev bắt đầu code · ✅ Convert meeting notes thành User Story có cấu trúc · ✅ Generate Gherkin scenarios từ mô tả nghiệp vụ · ✅ Chuẩn hóa handoff context từ BA sang QA team |
| **Artifact bạn tự tạo** | AC Review Prompt · User Story template từ meeting notes · Gherkin scenario generator · Context injection template cho QA |
| **Công cụ chính** | ChatGPT · Claude.ai · NotebookLM |
| **Lộ trình** | [S1](./sessions/session-01-mindset.md) → [S2](./sessions/session-02-technique.md) *(Prompt 1,5)* → [S3](./sessions/session-03-context.md) → [S6](./sessions/session-06-agentic-ai.md) *(phần 1.4)* |
| **Có thể bỏ qua** | S4 Bước 4–5, phần technical lab trong S5 |

### 🎯 Product Owner

> Bạn cần hiểu AI đủ để đặt kỳ vọng đúng — không bị "AI washing" từ team hay vendor.

| | |
|---|---|
| **Kết quả sau khóa học** | ✅ Biết AI làm được gì và không làm được gì trong QA workflow · ✅ Đặt câu hỏi đúng khi team đề xuất dùng AI · ✅ Nhận diện data privacy risk khi team dùng AI tools · ✅ Nắm luồng từ requirement đến AI-generated test |
| **Artifact bạn tự tạo** | AI risk checklist · Data privacy framework · Questions bank khi review AI proposal của team |
| **Công cụ chính** | ChatGPT · Claude.ai · NotebookLM |
| **Lộ trình** | [S1](./sessions/session-01-mindset.md) → [S6](./sessions/session-06-agentic-ai.md) *(phần 1.4)* → [S2](./sessions/session-02-technique.md) *(đọc nhanh)* → [S3](./sessions/session-03-context.md) |
| **Có thể bỏ qua** | Lab kỹ thuật trong S4–S5 |

### 🏆 QA Lead

> Bạn cần chuẩn hóa — AI workflow nhất quán cho cả team, không phải từng cá nhân tự mò.

| | |
|---|---|
| **Kết quả sau khóa học** | ✅ Xây Shared Prompt Library dùng chung toàn team · ✅ Thiết lập quality gate để review AI-generated artifacts · ✅ Chuẩn hóa Context Card cho từng dự án · ✅ Phác thảo QA Team Agent phù hợp quy trình hiện tại |
| **Artifact bạn tự tạo** | Team Prompt Library · Shared Context Card template · Quality gate checklist · QA Team Agent design doc |
| **Công cụ chính** | Claude.ai (Projects) · GitHub Copilot · VS Code · Antigravity |
| **Lộ trình** | Toàn bộ 6 sessions — cần đủ để hiểu từng bước team đang làm |
| **Có thể bỏ qua** | Không |

### 📊 QA Manager

> Bạn cần business case rõ ràng — adoption roadmap, ROI thực tế và governance trước khi scale.

| | |
|---|---|
| **Kết quả sau khóa học** | ✅ Tự đánh giá AI maturity của team hiện tại · ✅ Xây KPI framework đo ROI thực tế · ✅ Đánh giá và lựa chọn AI vendor với tiêu chí rõ ràng · ✅ Draft governance policy khi tổ chức scale AI adoption |
| **Artifact bạn tự tạo** | AI maturity self-assessment scorecard · KPI tracking template · Vendor evaluation criteria · Governance policy draft |
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

## 💡 Ứng dụng AI trong phát triển nghề nghiệp

Ngoài kiểm thử phần mềm, AI còn là công cụ mạnh để **đầu tư vào bản thân**. Dưới đây là một số ứng dụng thực tế bạn có thể làm ngay sau khóa học.

### 📄 Review CV & Job Description

AI có thể đóng vai HR chuyên nghiệp, giúp bạn nhận feedback trước khi nộp đơn thật.

```
[ROLE] Bạn là Senior Recruiter tại công ty công nghệ với 10 năm kinh nghiệm tuyển dụng QA/Testing.

[TASK] Hãy review CV dưới đây theo Job Description này:
- JD: [dán nội dung JD vào đây]
- CV: [dán nội dung CV vào đây]

[FORMAT] Phân tích theo 3 phần:
1. Điểm mạnh — CV đang match tốt với JD ở chỗ nào?
2. Điểm yếu / thiếu sót — JD yêu cầu gì mà CV chưa thể hiện?
3. Gợi ý cụ thể — Viết lại 2–3 bullet point để tăng match rate
```

**Công cụ:** ChatGPT · Claude.ai · [Resume.io](https://resume.io) (AI-powered CV builder)

---

### 🎤 Tạo Mock Interview cá nhân hóa

AI có thể tạo bộ câu hỏi phỏng vấn sát với JD thực tế và phản hồi câu trả lời của bạn.

```
[ROLE] Bạn là Hiring Manager tại [TÊN CÔNG TY / LOẠI CÔNG TY].

[CONTEXT]
- Vị trí: [VD: QA Automation Engineer, 3–5 năm kinh nghiệm]
- Tech stack: [VD: Playwright, TypeScript, CI/CD, Jira]
- Phong cách phỏng vấn: [competency-based / technical deep-dive / case-study]

[TASK] Tạo 10 câu hỏi phỏng vấn sát với JD này, mix giữa:
- 4 câu technical (tool, framework, process)
- 3 câu behavioral (STAR method)
- 3 câu situational (how would you handle...)

Sau đó đóng vai interviewer: tôi sẽ trả lời từng câu, bạn cho feedback theo tiêu chí:
Rõ ràng / Có ví dụ cụ thể / Liên quan đến vị trí.
```

**Mở rộng:** Sau mỗi câu trả lời, hỏi AI: *"Câu trả lời của tôi đạt mấy điểm / 10? Tôi cần cải thiện gì?"*

---

### 🗺️ Lộ trình phát triển kỹ năng

AI giúp bạn xây kế hoạch học có cấu trúc, không bị lạc lối giữa hàng trăm resource trên mạng.

```
[ROLE] Bạn là Career Coach chuyên về lĩnh vực Software Testing & QA.

[CONTEXT]
- Tôi hiện là: [VD: Manual Tester, 2 năm kinh nghiệm, không biết code]
- Mục tiêu trong 6 tháng: [VD: chuyển sang QA Automation, kiếm được job Playwright]
- Thời gian học: [VD: 1–2 tiếng/ngày, buổi tối và cuối tuần]
- Điểm mạnh hiện tại: [VD: test case, Jira, regression testing]

[TASK] Hãy tạo lộ trình học 6 tháng theo từng tháng, gồm:
- Kỹ năng cần đạt
- Resource cụ thể (tên khóa học, tên sách, YouTube channel)
- Milestone để tự đánh giá tiến độ
- Cảnh báo các "bẫy" thường gặp khi tự học automation

[FORMAT] Timeline rõ ràng theo tháng, action item cụ thể có thể làm ngay hôm nay.
```

> **💡 Tips:** Dùng Claude.ai Projects để lưu context career của bạn — mỗi lần chat mới AI vẫn nhớ mục tiêu và tiến độ, không cần kể lại từ đầu.

---

## 🚀 Bắt đầu nhanh

1. Xác định role của bạn trong bảng **"Học theo role"** ở trên
2. Mở session đầu tiên theo lộ trình được đề xuất
3. Cài đặt công cụ AI (ChatGPT hoặc Claude.ai — chọn 1 là đủ để bắt đầu)
4. Dùng `resources/prompt-library.md` để tra cứu nhanh khi làm việc thực tế

---

*Được tạo bởi QA Automation Trainer — 10 năm kinh nghiệm*
