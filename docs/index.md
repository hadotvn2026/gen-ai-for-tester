# 🤖 Generative AI for Testers

> Khóa học thực hành ứng dụng AI trong kiểm thử phần mềm

![Sessions](https://img.shields.io/badge/Sessions-6-purple)
![Duration](https://img.shields.io/badge/Duration-3h%2Fsession-teal)
![Language](https://img.shields.io/badge/Language-Tiếng%20Việt-blue)
![Level](https://img.shields.io/badge/Level-Beginner%20→%20Advanced-orange)

---

## 📌 Giới thiệu khóa học

Khóa học **Generative AI for Testers** được thiết kế dành cho:
- Manual Tester muốn tăng năng suất với AI
- Automation Engineer muốn viết script nhanh hơn
- QA Lead muốn xây dựng quy trình AI-assisted

**Phương pháp:** 40% lý thuyết · 60% thực hành · Online via Zoom · Lớp ~30 người

---

## 🔵 3-Circle Model — Nền tảng toàn khóa học

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

> Không phải session nào cũng có cùng mức độ ưu tiên với mọi người. Hãy bắt đầu từ lộ trình phù hợp với công việc hằng ngày của bạn — sau đó mở rộng dần sang các session còn lại.

| Role | Mục tiêu khi học | Lộ trình đề xuất | Có thể bỏ qua (tạm thời) |
|------|-----------------|-----------------|--------------------------|
| **Manual Tester** | Tăng tốc viết test case, bug report, chọn regression scope | S1 → S2 → S3 → S4 *(chỉ Bước 1–4)* | S4 Bước 5, phần technical trong S5–S6 |
| **QA Automation** | Viết script nhanh hơn, debug với AI, xây dựng AI-assisted framework | S1 → S2 → S3 → S4 *(toàn bộ)* → S5 → S6 | Không — tất cả đều relevant |
| **BA** | Review requirement, viết AC testable, tạo Gherkin scenarios | S1 → S2 *(Prompt 1, 5)* → S3 → S6 *(phần 1.4)* | S4 Bước 4–5, phần technical trong S5 |
| **Product Owner** | Hiểu AI risk, governance, đặt kỳ vọng đúng với team | S1 → S6 *(phần 1.4)* → S2 *(đọc nhanh)* | Lab kỹ thuật trong S4–S5 |
| **QA Lead** | Chuẩn hóa AI workflow cho team, quality gate cho AI-generated artifacts | S1 → S2 → S3 → S4 → S5 → S6 *(toàn bộ)* | Không — cần đủ để lead team |
| **QA Manager** | Adoption roadmap, đo ROI, quản lý rủi ro tổ chức | S1 → S6 → S2 → S3 | Lab kỹ thuật trong S4–S5 *(đọc overview là đủ)* |

> **💡 Xu hướng 2025 cần biết:** Ranh giới giữa các role đang mờ dần nhanh chóng — Manual Tester ngày càng cần hiểu automation concepts để cộng tác với AI agents; BA tham gia vào quality process sớm hơn bao giờ hết (*shift-left quality*); "vibe-coding" với Copilot/Cursor đang trở thành kỹ năng mặc định. Lộ trình trên là điểm khởi đầu — không phải giới hạn của bạn.

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

## 🗂️ Cấu trúc thư mục

```
genai-for-testers/
├── README.md                        ← Trang này
├── sessions/
│   ├── session-01-mindset.md
│   ├── session-02-technique.md
│   ├── session-03-context.md
│   ├── session-04-skill-building.md
│   ├── session-05-ai-agent.md
│   └── session-06-agentic-ai.md
├── resources/
│   ├── prompt-library.md            ← Thư viện prompt mẫu
│   ├── cheat-sheets.md              ← Tổng hợp cheat sheet 6 sessions
│   └── context-card-template.md    ← Template Context Card
└── EBOOK.md                         ← Hướng dẫn xuất ebook
```

---

## 🚀 Bắt đầu nhanh

1. Clone repo này về máy
2. Mở `sessions/session-01-mindset.md` để bắt đầu
3. Xem `resources/prompt-library.md` để dùng ngay trong công việc

---

## 🛠️ Công cụ AI được dùng trong khóa học

| Công cụ | Mục đích | Miễn phí? |
|---------|---------|-----------|
| [ChatGPT](https://chat.openai.com) | Test case, bug analysis | ✅ Free tier |
| [Claude.ai](https://claude.ai) | Skill builder, agent | ✅ Free tier |
| [GitHub Copilot](https://github.com/features/copilot) | Automation script | 💰 30 ngày trial |
| [Gemini](https://gemini.google.com) | Tổng quát, docs | ✅ Free |

---

*Được tạo bởi QA Automation Trainer — 10 năm kinh nghiệm*
