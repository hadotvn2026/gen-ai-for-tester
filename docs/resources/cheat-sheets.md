# 🗒️ Cheat Sheets — Tổng hợp 6 Sessions

---

## Session 1 — Mindset

```
AI là công cụ, không phải thần thánh → Luôn review output
3-Circle: Mindset → Technique → Context
Hallucination check: Google xác nhận thông tin quan trọng

Prompt cơ bản:
  [Vai trò] + [Bối cảnh] + [Nhiệm vụ] + [Format]

3 câu hỏi review output:
  1. AI có thể sai ở đâu?
  2. AI bỏ sót gì?
  3. Cần thêm context gì?
```

## Session 2 — Technique

```
Zero-shot  : Đưa yêu cầu thẳng
Few-shot   : "Đây là 2 ví dụ... bây giờ làm tương tự..."
CoT        : "Hãy suy nghĩ từng bước trước khi trả lời..."
Role       : "Đóng vai [X] với [N] năm kinh nghiệm..."

Fix output:
  → Thêm context
  → Cho ví dụ mẫu
  → Followup: "Mở rộng thêm edge cases..."
```

## Session 3 — Context

```
GIGO: Garbage In = Garbage Out
5 loại context: Domain | User | Tech | Business rules | Lịch sử lỗi

Limits:
  ChatGPT: ~128K token
  Claude:  ~200K token  (1 token ≈ 4 ký tự)

Context Card: Tạo 1 lần, copy vào mọi prompt
```

## Session 4 — Skill Building

```
Skill Creator: Tên + Mục đích + Input + Quy trình + Output + Ví dụ

Selenium: "Dùng POM, Explicit Wait, TestNG, KHÔNG Thread.sleep"
Playwright: "async/await, getByRole locators, expect assertions"

Review checklist: POM ✓ | Wait ✓ | Assert ✓ | Isolated ✓
```

## Session 5 — AI Agent

```
Agent = Tool + Memory + Planning
Khác ChatGPT: Tự thực hiện nhiều bước, không cần "cầm tay"

Human-in-the-loop: "Trước khi [X], hãy hỏi tôi xác nhận"

KHÔNG để Agent tự: Close bug | Release decision | Security issues
```

## Session 6 — Agentic AI

```
Pattern: Orchestrator → Planner → Executor → Reviewer → Reporter

Bảo mật:
  ❌ PII thật  ❌ Credentials  ❌ Production secrets

CI/CD: GitHub Actions → Agent API → Post results to PR

Tiếp tục: n8n | LangChain | CrewAI | Claude API
```

---

# 📋 Context Card Template

> Copy template này, điền thông tin dự án, và paste vào mọi prompt AI của bạn.

```markdown
## Context Card — [Tên dự án]

### Domain
[Lĩnh vực: e-commerce / banking / healthcare / logistics / ...]

### Tech Stack
- Frontend  : [React / Angular / Vue / Next.js / ...]
- Backend   : [Java Spring / Node.js / Python FastAPI / ...]
- Database  : [PostgreSQL / MySQL / MongoDB / Redis / ...]
- API Style : [REST / GraphQL / gRPC]
- Mobile    : [React Native / Flutter / Native iOS/Android]

### User chính
- Vai trò           : [Admin / End-user / Manager / Agent / ...]
- Trình độ công nghệ: [Cao / Trung bình / Thấp]
- Thiết bị chính    : [Desktop / Mobile / Tablet]
- Đặc điểm quan trọng: [...]

### Business Rules quan trọng
1. [Quy tắc nghiệp vụ 1]
2. [Quy tắc nghiệp vụ 2]
3. [Quy tắc nghiệp vụ 3]

### Tính năng hay có bug
1. [Module/tính năng 1] — [Mô tả vấn đề thường gặp]
2. [Module/tính năng 2] — [Mô tả vấn đề thường gặp]

### Đặc điểm dữ liệu
- Tiền tệ / Số    : [VND / USD | Format: 1,000,000 VND]
- Ngày tháng      : [dd/MM/yyyy | Timezone: Asia/Ho_Chi_Minh]
- Ký tự đặc biệt  : [Có dấu tiếng Việt / Unicode]
- Giới hạn        : [Max file size: 10MB | Max records: 1000]

### Môi trường test
- Staging URL: [URL]
- Test accounts: [Link to credentials doc]
- Data reset: [Tự động / Manual / Mỗi sprint]
```

---

*🏠 [README](../index.md) · 📚 [Prompt Library](./prompt-library.md)*
