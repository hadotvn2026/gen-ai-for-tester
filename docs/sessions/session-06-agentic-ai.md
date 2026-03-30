# Session 6 — Agentic AI: QA Team Agent & Capstone

> **Nguyên tắc:** 🟢 AGENTIC AI — Tổng kết toàn khóa  
> **Thời lượng:** 3 giờ · Lý thuyết: 60 phút · Thực hành: 90 phút · Capstone: 30 phút  
> **Prerequisite:** [Session 5 — AI Agent](./session-05-ai-agent.md)

---

## 🎯 Mục tiêu buổi học

Sau session này, học viên có thể:

- [ ] Giải thích kiến trúc Agentic AI — nhiều agent phối hợp như một team thật
- [ ] Thiết kế QA Team Agent: Orchestrator + Planner + Executor + Reviewer + Reporter
- [ ] Kết nối Agent vào CI/CD pipeline (Jenkins / GitHub Actions)
- [ ] Hiểu và áp dụng nguyên tắc đạo đức khi dùng AI trong kiểm thử
- [ ] Trình bày giải pháp AI cho QA workflow của chính mình (Capstone)

---

## PHẦN 1 — LÝ THUYẾT (60 phút)

### 1.1 Agentic AI — Khi nhiều Agent làm việc cùng nhau

Agentic AI là một hệ thống trong đó nhiều AI Agent được phân công vai trò chuyên biệt, tương tác với nhau để hoàn thành nhiệm vụ phức tạp — giống như một team con người thật sự.

| Agent | Vai trò | Tương tự trong QA team |
|-------|---------|----------------------|
| **Orchestrator** | Nhận nhiệm vụ, phân công, theo dõi tiến độ | QA Lead / Test Manager |
| **Planner Agent** | Phân tích requirement, lập kế hoạch test | Senior QA Analyst |
| **Executor Agent** | Chạy automation test, API test | Automation Engineer |
| **Reviewer Agent** | Kiểm tra coverage, chất lượng test case | QA Reviewer |
| **Reporter Agent** | Tạo báo cáo, tóm tắt, gửi notification | QA Reporting Specialist |

---

### 1.2 Luồng giao tiếp giữa các Agent

```
Trigger: Pull Request được tạo / Deploy lên Staging
         │
         ▼
Orchestrator ──→ Nhận thông tin PR, xác định scope cần test
         │
         ▼
Planner Agent ──→ Đọc changelog, xác định impact areas, tạo test plan
         │
         ▼
Executor Agent ──→ Chạy regression suite + new test cases
         │
         ▼
Reviewer Agent ──→ Kiểm tra kết quả, phân loại bug, đánh giá severity
         │
         ▼
Reporter Agent ──→ Tạo Slack notification + HTML report + Jira tickets
         │
         ▼
Orchestrator ──→ Quyết định: Pass → merge / Fail → block + notify dev
```

> **⚠️ Human checkpoint bắt buộc:**  
> Trước khi Orchestrator ra quyết định cuối cùng (merge/block), phải có QA Lead review.

---

### 1.3 Tích hợp CI/CD — Kết nối vào quy trình thực tế

| CI/CD Tool | Cách tích hợp Agent |
|-----------|-------------------|
| **GitHub Actions** | Trigger workflow khi có PR, gọi Agent API, post kết quả vào PR comment |
| **Jenkins** | Post-build action gọi Agent, kết quả hiển thị trong Jenkins dashboard |
| **GitLab CI** | Pipeline stage "QA Agent" chạy sau build, block merge nếu fail |

**Ví dụ GitHub Actions workflow:**

```yaml
name: QA Agent Pipeline
on:
  pull_request:
    branches: [main, develop]

jobs:
  qa-agent:
    runs-on: ubuntu-latest
    steps:
      - name: Trigger QA Planner Agent
        run: |
          # Gọi Agent API với PR changes
          curl -X POST $QA_AGENT_URL \
            -d '{"pr_number": "${{ github.event.number }}", 
                 "changes": "${{ github.event.pull_request.diff_url }}"}'
      
      - name: Wait for QA Report
        # Agent chạy tests và trả về kết quả
        
      - name: Post Results to PR
        # Comment kết quả lên PR
```

---

### 1.4 Đạo đức và rủi ro khi dùng AI trong kiểm thử

> **Đây là phần quan trọng mà nhiều khóa học AI bỏ qua.**

| Rủi ro | Nguyên tắc xử lý |
|--------|----------------|
| AI che giấu lỗi để "pass test" | Human review kết quả quan trọng trước khi release |
| Phụ thuộc quá mức vào AI | Luôn hiểu "tại sao" test case được tạo ra như vậy |
| Thông tin nhạy cảm trong prompt | Không paste PII (họ tên, CCCD, số thẻ) vào AI công cộng |
| AI hallucinate trong bug analysis | Xác minh root cause bằng cách đọc code / log thực tế |
| Team mất kỹ năng kiểm thử tay | Duy trì kỹ năng manual test, AI chỉ là công cụ hỗ trợ |

**Nguyên tắc bảo mật dữ liệu:**

```
❌ KHÔNG làm:
  - Paste số CMND/CCCD thật vào ChatGPT
  - Đưa thông tin khách hàng thật vào AI công cộng
  - Để AI tự động close bug Critical
  - Tin hoàn toàn vào AI phân tích lỗi security

✅ NÊN làm:
  - Anonymize data trước khi dùng với AI
  - Dùng AI-powered tools có chính sách bảo mật rõ ràng
  - Luôn có human review với quyết định quan trọng
  - Ghi lại khi nào AI được dùng trong process
```

---

## PHẦN 2 — THỰC HÀNH (90 phút)

### 🔬 Lab 6.1 — Thiết kế QA Team Agent (50 phút)

> **Làm việc nhóm:** 5–6 người · Thời gian: 50 phút

**Bước 1 (15 phút): Vẽ sơ đồ kiến trúc Team Agent**

Trả lời các câu hỏi:
- Bao nhiêu agent? Vai trò của mỗi agent?
- Luồng thông tin giữa các agent (ai nói chuyện với ai?)
- Điểm "human checkpoint" ở đâu?
- Input đầu vào và output cuối cùng là gì?

**Bước 2 (20 phút): Viết system prompt cho 2 agent chính**

---

**Planner Agent prompt:**

```
Bạn là QA Planner Agent.

NHIỆM VỤ: Khi nhận được changelog / sprint notes, bạn sẽ:

1. PHÂN TÍCH IMPACT:
   - Tính năng nào thay đổi?
   - Module nào có thể bị ảnh hưởng ngoài ý muốn?

2. TẠO TEST PLAN:
   - Top 5 rủi ro cần test ngay
   - Danh sách test cases ưu tiên (P1, P2, P3)
   - Ước tính thời gian test

3. OUTPUT FORMAT:
   ## Sprint Test Plan
   ### Impact Analysis
   | Thay đổi | Module ảnh hưởng | Mức độ rủi ro |
   
   ### Test Priority
   | P1 — Must test | P2 — Should test | P3 — Nice to have |

RÀNG BUỘC:
- Chỉ tạo plan, không tự quyết định execute
- Hỏi xác nhận nếu không rõ scope
```

---

**Reporter Agent prompt:**

```
Bạn là QA Reporter Agent.

NHIỆM VỤ: Khi nhận được kết quả test, bạn sẽ tạo báo cáo đầy đủ:

1. EXECUTIVE SUMMARY (cho manager):
   - Tổng số TC: [X] | Pass: [X] | Fail: [X] | Blocked: [X]
   - Pass rate: [X]%
   - Quyết định đề xuất: ✅ Ready / ⚠️ Cần fix / ❌ Không release

2. BUG SUMMARY (cho dev team):
   - Danh sách bug theo severity
   - Bug mới vs bug cũ reopen
   
3. COVERAGE REPORT:
   - Tính năng đã test
   - Tính năng chưa test và lý do

4. RISK STATEMENT:
   - Rủi ro còn lại nếu release
   - Đề xuất cụ thể

FORMAT: Markdown, có thể convert sang Confluence / Notion
```

**Bước 3 (15 phút): Test với tình huống thực tế**

Paste changelogs / sprint notes thực tế → chạy Planner Agent → xem output → chuyển cho Reporter Agent.

---

### ✅ HANDS-ON CHECKPOINT 6: Đánh giá Team Agent

> **Tiêu chí đánh giá** (mỗi nhóm tự chấm):

| Tiêu chí | Đạt ✅ | Chưa ❌ |
|---------|:-----:|:------:|
| Phân công rõ ràng (không chồng chéo vai trò) | | |
| Có "human checkpoint" trước quyết định quan trọng | | |
| Luồng dữ liệu giữa agent rõ ràng và có thể thực thi | | |
| System prompt theo đúng Skill Creator pattern | | |
| Kiến trúc thực tế — có thể build trong 1–2 tuần | | |

> 💬 **Mỗi nhóm trình bày 3 phút.** Ca lớp vote: Kiến trúc nào khả thi nhất?

---

### 🔬 Lab 6.2 — Simulation QA Pipeline (30 phút)

Dùng Claude.ai (free), mở **3 tab riêng biệt** để mô phỏng:

**Tab 1 — Planner Agent:**
```
System: [Dùng Planner Agent prompt từ Lab 6.1]
Input: "Sprint 24 thay đổi: Thêm 2FA cho login, update giỏ hàng, 
        fix bug thanh toán tính sai VAT khi dùng voucher"
```

**Tab 2 — Executor Agent (Simulation):**
```
System: "Bạn là QA Executor Agent. Nhận test plan và giả lập kết quả chạy test.
Tạo kết quả thực tế: [Số TC đã chạy], [Số Pass], [Số Fail với mô tả ngắn]
Thêm 2-3 bug phát hiện với severity rõ ràng."

Input: [Copy output từ Tab 1]
```

**Tab 3 — Reporter Agent:**
```
System: [Dùng Reporter Agent prompt từ Lab 6.1]
Input: [Copy output từ Tab 2]
```

> **Quan sát:** Kết quả cuối có dạng một báo cáo QA chuyên nghiệp không?

---

## PHẦN 3 — CAPSTONE & TỔNG KẾT (30 phút)

### 📋 CAPSTONE: Thiết kế giải pháp cho dự án của bạn

> **Bài kiểm tra cuối khóa — Tổng hợp tất cả 6 sessions**  
> **Thời gian trình bày:** 3–4 phút/người (hoặc nhóm 2 người)

**Cấu trúc bài trình bày:**

```
1. DỰ ÁN (30 giây)
   Mô tả ngắn về dự án thực tế của bạn
   (Loại app, team size, quy trình hiện tại)

2. PAIN POINT (30 giây)
   QA đang mất thời gian nhiều nhất ở bước nào?
   Con số cụ thể nếu có (X giờ/tuần, Y% thời gian)

3. GIẢI PHÁP AI (2 phút)
   ┌─ Mindset: Hiểu/áp dụng như thế nào?
   ├─ Technique: Prompt strategy nào?
   ├─ Context: Context Card có gì?
   ├─ Skills: Skill nào sẽ xây dựng?
   └─ Agent/Agentic: Có cần Agent không? Cấu trúc ra sao?

4. KẾT QUẢ MONG ĐỢI (30 giây)
   Giảm được bao nhiêu % thời gian?
   Tăng chất lượng ở đâu?

5. RISCO (30 giây)
   Rủi ro gì? Kiểm soát như thế nào?
```

> **Feedback:** QA Lead trong lớp và trainer sẽ cho feedback trực tiếp.

---

### 🏆 Tổng kết toàn khóa học

```
╔══════════════════════════════════════════════════════════════╗
║           HÀNH TRÌNH 6 SESSIONS                              ║
╠══════════════════════════════════════════════════════════════╣
║ Session 1 │ MINDSET    │ AI là co-pilot, hoài nghi lành mạnh ║
║ Session 2 │ TECHNIQUE  │ Prompt = Role+Context+Task+Format   ║
║ Session 3 │ CONTEXT    │ GIGO — Bối cảnh cụ thể = Output ★  ║
║ Session 4 │ SKILL      │ Skill+Copilot = Tự động có cấu trúc ║
║ Session 5 │ AI AGENT   │ Tool+Memory+Planning+Human-in-loop  ║
║ Session 6 │ AGENTIC AI │ Team agent = QA pipeline hoàn chỉnh ║
╚══════════════════════════════════════════════════════════════╝

Bạn giờ có:
  ✅ 3-Circle Model làm kim chỉ nam
  ✅ Prompt Library cá nhân (10+ prompts)
  ✅ 3+ Custom Skills tái sử dụng được
  ✅ Thiết kế Agent cho dự án thực tế
  ✅ Hiểu đạo đức và rủi ro AI trong QA
```

---

## 📝 RECAP — 5 điểm chính Session 6

1. ✅ **Agentic AI:** Orchestrator + Planner + Executor + Reviewer + Reporter
2. ✅ **CI/CD tích hợp:** GitHub Actions trigger → Agent API → post kết quả vào PR
3. ✅ **Bảo mật:** Không paste PII / credential / code nhạy cảm lên AI công cộng
4. ✅ **Human checkpoint:** Block tự động hóa ở: close bug, release decision, severity Critical
5. ✅ **Tiếp tục học:** LangChain, AutoGen, CrewAI, Claude API — xây dựng agent từ code

---

## 🗒️ QUICK REFERENCE — Cheat Sheet Session 6

```
Agentic AI pattern:
  Orchestrator → Planner → Executor → Reviewer → Reporter

CI/CD integration:
  GitHub Actions: on: pull_request → gọi Agent → post results

Bảo mật tuyệt đối:
  ❌ PII thật  ❌ Credentials  ❌ Production secrets

Human checkpoint PHẢI có:
  Close bug Critical | Release decision | Security issues

Công cụ đề xuất tiếp theo:
  n8n (workflow automation, free/self-host)
  LangChain (Python, build agent từ code)
  CrewAI (multi-agent framework)
  Claude API (custom integration)

Cộng đồng học tiếp:
  promptingguide.ai | learnprompting.org | anthropic.com/docs
```

---

> **Lời nhắn từ trainer:**
>
> *"AI sẽ không thay thế bạn — nhưng Tester biết dùng AI sẽ thay thế Tester không biết."*
>
> Những gì bạn đã học trong 6 sessions này không phải là kỹ năng "nice to have".  
> Đây là kỹ năng sống còn trong ngành QA 2024–2025 và những năm tiếp theo.
>
> Hãy bắt đầu nhỏ: Dùng 1 prompt để làm tốt hơn 1 việc nhỏ ngay ngày mai.  
> Sau 30 ngày, bạn sẽ ngạc nhiên vì sự thay đổi.

---

*⬅️ [Session 5 — AI Agent](./session-05-ai-agent.md) · 🏠 [README](../index.md)*
