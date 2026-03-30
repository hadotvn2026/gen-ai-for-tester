# Session 6 — Agentic AI: QA Team Agent & Capstone

> Trong session này, bạn sẽ nâng cấp từ "một Agent đơn lẻ" lên "một team Agent phối hợp" — và tổng hợp toàn bộ kiến thức 6 sessions thành một giải pháp AI cụ thể cho dự án thực tế của bạn.

## ✅ Mục tiêu — Sau session này bạn có thể

- [ ] Giải thích kiến trúc Agentic AI — nhiều agent phối hợp như một team thật
- [ ] Thiết kế QA Team Agent: Orchestrator + Planner + Executor + Reviewer + Reporter
- [ ] Kết nối Agent vào CI/CD pipeline (Jenkins / GitHub Actions)
- [ ] Hiểu và áp dụng nguyên tắc đạo đức khi dùng AI trong kiểm thử
- [ ] Viết giải pháp AI cho QA workflow của chính mình (Capstone)

---

## PHẦN 1 — LÝ THUYẾT

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

### 📺 Video tham khảo — Xây dựng hệ thống Multi-Agent nâng cao

> **"How to Build Advanced AI Agents"** — freeCodeCamp · 1 giờ · Tiếng Anh

<iframe width="100%" height="380" src="https://www.youtube.com/embed/B0TJC4lmzEM" title="How to Build Advanced AI Agents – freeCodeCamp" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

> Hướng dẫn xây dựng Multi-Agent Workflows với LangChain, LiveKit và Exa: nhiều agent phối hợp giải quyết tác vụ phức tạp — đúng với kiến trúc Orchestrator → Planner → Executor → Reporter trong bài học này.

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

## PHẦN 2 — THỰC HÀNH

### 🛠️ Bài tập 6.1 — Thiết kế QA Team Agent

> **Thời gian ước tính:** 50 phút | **Công cụ:** Claude.ai, giấy/Miro để vẽ sơ đồ

**Bước 1 (15 phút): Vẽ sơ đồ kiến trúc Team Agent**

Trên giấy hoặc công cụ vẽ sơ đồ (Miro, draw.io, hoặc đơn giản là text ASCII), phác thảo kiến trúc Team Agent cho dự án của bạn. Trả lời các câu hỏi:

- Bao nhiêu agent? Vai trò của mỗi agent?
- Luồng thông tin giữa các agent (ai nói chuyện với ai?)
- Điểm "human checkpoint" ở đâu?
- Input đầu vào và output cuối cùng là gì?

**Bước 2 (20 phút): Viết system prompt cho Planner Agent**

Mở Claude.ai, tạo cuộc hội thoại mới và paste prompt sau:

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

**Bước 3 (15 phút): Viết system prompt cho Reporter Agent**

Tạo cuộc hội thoại mới trong Claude.ai với prompt sau:

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

**Bước 4:** Tự chấm kiến trúc bạn đã thiết kế theo tiêu chí sau:

| Tiêu chí | Đạt ✅ | Chưa ❌ |
|---------|:-----:|:------:|
| Phân công rõ ràng (không chồng chéo vai trò) | | |
| Có "human checkpoint" trước quyết định quan trọng | | |
| Luồng dữ liệu giữa agent rõ ràng và có thể thực thi | | |
| System prompt theo đúng Skill Creator pattern | | |
| Kiến trúc thực tế — có thể thử nghiệm trong 1–2 tuần | | |

**✅ Kết quả mong đợi:**
> Một sơ đồ kiến trúc (dù đơn giản) với ít nhất 3 agent có vai trò rõ ràng, ít nhất 1 "human checkpoint" được đánh dấu, và 2 system prompt hoàn chỉnh cho Planner + Reporter Agent. Kiến trúc không cần hoàn hảo — quan trọng là có thể giải thích logic phân công.

💡 **Gợi ý khi bị kẹt:** Nếu không biết bắt đầu từ đâu, dùng kiến trúc mẫu trong phần 1.2 làm template và điều chỉnh cho phù hợp với dự án của bạn.

---

### 🛠️ Bài tập 6.2 — Simulation QA Pipeline

> **Thời gian ước tính:** 30 phút | **Công cụ:** Claude.ai (3 tab riêng biệt)

**Bước 1:** Mở 3 tab Claude.ai riêng biệt để mô phỏng 3 agent.

**Bước 2 — Tab 1 (Planner Agent):**

Paste system prompt Planner Agent từ Bài tập 6.1, rồi gửi input sau:

```
Sprint 24 thay đổi: Thêm 2FA cho login, update giỏ hàng,
fix bug thanh toán tính sai VAT khi dùng voucher
```

Copy toàn bộ output từ Tab 1.

**Bước 3 — Tab 2 (Executor Agent Simulation):**

Mở tab mới với system prompt sau, rồi paste output từ Tab 1 vào:

```
Bạn là QA Executor Agent. Nhận test plan và giả lập kết quả chạy test.
Tạo kết quả thực tế: [Số TC đã chạy], [Số Pass], [Số Fail với mô tả ngắn]
Thêm 2-3 bug phát hiện với severity rõ ràng.
```

Copy toàn bộ output từ Tab 2.

**Bước 4 — Tab 3 (Reporter Agent):**

Mở tab mới với system prompt Reporter Agent từ Bài tập 6.1, rồi paste output từ Tab 2 vào.

**Bước 5:** Đọc báo cáo cuối cùng từ Tab 3. Tự hỏi:
- Nếu bạn là QA Lead, bạn có dùng báo cáo này để quyết định release không?
- Phần nào cần bổ sung hoặc chỉnh sửa trước khi gửi cho manager?

**✅ Kết quả mong đợi:**
> Cuối cùng bạn có một báo cáo QA dạng Markdown với Executive Summary (pass rate, quyết định đề xuất), Bug Summary (ít nhất 2–3 bug với severity), Coverage Report, và Risk Statement. Báo cáo phải đủ để một người không tham gia kiểm thử vẫn hiểu tình trạng sprint.

**❓ Tự kiểm tra:**
- [ ] Báo cáo có Executive Summary đủ để manager đọc trong 1 phút không?
- [ ] Bug được phân loại theo severity rõ ràng không?
- [ ] Risk Statement có nêu rủi ro cụ thể nếu release với bugs hiện tại không?

💡 **Gợi ý khi bị kẹt:** Nếu output giữa các tab không khớp nhau, thêm vào system prompt: *"Input của bạn là output từ [agent trước]. Hãy xử lý đúng định dạng đó."*

---

## PHẦN 3 — CAPSTONE

### 📋 Capstone: Viết giải pháp AI cho dự án của bạn

> Đây là bài tổng kết toàn khóa — tổng hợp tất cả 6 sessions vào 1 giải pháp cụ thể cho dự án thực tế của bạn. Điền vào template Markdown dưới đây và lưu vào notes hoặc file cá nhân.

---

**Template — Điền vào từng phần:**

```markdown
# Giải pháp AI cho QA — [Tên dự án của bạn]
*Hoàn thành ngày: _______________*

---

## 1. DỰ ÁN
- Mô tả ngắn: _______________
  (Loại app, team size, quy trình kiểm thử hiện tại)

---

## 2. PAIN POINT
- QA đang mất thời gian nhiều nhất ở bước nào?
  → _______________
- Con số cụ thể (nếu có): ___ giờ/tuần, hoặc ___% thời gian
- Tại sao việc này chưa được cải thiện trước đây?
  → _______________

---

## 3. GIẢI PHÁP AI

### Mindset (Session 1–2)
- Tôi sẽ áp dụng AI như thế nào trong quy trình hiện tại?
  → _______________
- Điểm nào tôi vẫn cần giữ human judgment?
  → _______________

### Technique & Context (Session 2–3)
- Prompt strategy tôi sẽ dùng: _______________
- Context Card của dự án có gì quan trọng nhất?
  → _______________

### Skills (Session 4)
- Skill nào tôi sẽ xây dựng?
  1. _______________
  2. _______________
  3. _______________

### Agent / Agentic AI (Session 5–6)
- Có cần Agent không? [ ] Có / [ ] Chưa cần lúc này
- Nếu có — cấu trúc Agent ra sao?
  → _______________
- Hành động nào Agent được tự động / phải chờ duyệt?
  Tự động: _______________
  Chờ duyệt: _______________

---

## 4. KẾT QUẢ MONG ĐỢI
- Giảm được bao nhiêu % thời gian ở pain point đã nêu?
  → _______________
- Chất lượng tăng ở đâu cụ thể?
  → _______________

---

## 5. RỦI RO VÀ KIỂM SOÁT
- Rủi ro lớn nhất khi áp dụng giải pháp này?
  → _______________
- Tôi sẽ kiểm soát rủi ro đó như thế nào?
  → _______________
- Điều gì sẽ khiến tôi "rollback" về cách làm cũ?
  → _______________

---

## 6. BƯỚC TIẾP THEO
- Việc đầu tiên tôi sẽ làm sau session này (trong 24 giờ):
  → _______________
- Mục tiêu sau 30 ngày:
  → _______________
```

---

**Sau khi điền xong, tự kiểm tra:**

- [ ] Pain point đủ cụ thể (không phải "tiết kiệm thời gian" chung chung)?
- [ ] Giải pháp đề xuất sử dụng ít nhất 3 trong số 6 session đã học?
- [ ] Ranh giới "tự động / cần duyệt" được xác định rõ?
- [ ] Rủi ro được thừa nhận thực tế, không phủ nhận?
- [ ] Bước tiếp theo là việc có thể làm ngay, không mơ hồ?

**✅ Kết quả mong đợi:**
> Một tài liệu hoàn chỉnh có thể chia sẻ với QA Lead hoặc dùng làm kế hoạch cá nhân. Pain point và giải pháp phải liên kết chặt chẽ với nhau. Bước tiếp theo phải đủ cụ thể để bắt đầu ngay ngày mai.

💡 **Gợi ý khi bị kẹt:** Nếu không biết viết pain point, nghĩ đến lần cuối bạn phải làm đi làm lại cùng một việc nhiều lần — đó chính là pain point tốt nhất để bắt đầu.

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

## 📝 Tổng kết

1. ✅ **Agentic AI:** Orchestrator + Planner + Executor + Reviewer + Reporter
2. ✅ **CI/CD tích hợp:** GitHub Actions trigger → Agent API → post kết quả vào PR
3. ✅ **Bảo mật:** Không paste PII / credential / code nhạy cảm lên AI công cộng
4. ✅ **Human checkpoint:** Block tự động hóa ở: close bug, release decision, severity Critical
5. ✅ **Tiếp tục học:** LangChain, AutoGen, CrewAI, Claude API — xây dựng agent từ code

---

## 🗒️ Cheat Sheet

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

> *"AI sẽ không thay thế bạn — nhưng Tester biết dùng AI sẽ thay thế Tester không biết."*
>
> Những gì bạn đã học trong 6 sessions này không phải là kỹ năng "nice to have".
> Đây là kỹ năng sống còn trong ngành QA 2024–2025 và những năm tiếp theo.
>
> Hãy bắt đầu nhỏ: Dùng 1 prompt để làm tốt hơn 1 việc nhỏ ngay ngày mai.
> Sau 30 ngày, bạn sẽ ngạc nhiên vì sự thay đổi.

---

## 📚 Bài tập về nhà

> Hoàn thiện Capstone template của bạn và thực hiện "Bước tiếp theo" đã viết.
> Sau 1 tuần, đọc lại phần "Kết quả mong đợi" và ghi lại: thực tế so với dự kiến có khác không? Vì sao?

---

*⬅️ [Session 5 — AI Agent](./session-05-ai-agent.md) · 🏠 [README](../index.md)*
