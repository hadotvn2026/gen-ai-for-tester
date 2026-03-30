# Session 4 — Skill Building: Automation với AI

> **Nguyên tắc:** 🟡 APPLY — Tổng hợp Mindset + Technique + Context  
> **Thời lượng:** 3 giờ · Lý thuyết: 60 phút · Thực hành: 120 phút · Kiểm tra: 20 phút  
> **Prerequisite:** [Session 3 — Context](./session-03-context.md)

---

## 🎯 Mục tiêu buổi học

Sau session này, học viên có thể:

- [ ] Viết automation script Selenium / Playwright với sự hỗ trợ của GitHub Copilot
- [ ] Tạo REST Assured / Postman test với AI
- [ ] Hiểu khái niệm Skill trong Claude và cách xây dựng custom skill cho QA
- [ ] Xây dựng 3 skill tái sử dụng được trong thực tế

---

## PHẦN 1 — LÝ THUYẾT (60 phút)

### 1.1 GitHub Copilot cho Automation Tester

Copilot là AI coding assistant tích hợp trực tiếp vào IDE (VS Code, IntelliJ). Nó hiểu ngôn ngữ lập trình và có thể:

- Tạo script Selenium / Playwright từ mô tả ngôn ngữ tự nhiên
- Gợi ý code completion khi bạn đang viết
- Giải thích đoạn code bạn không hiểu
- Refactor code test để dễ bảo trì hơn
- Tạo Page Object Model từ HTML snippet

| Viết thủ công (trước AI) | Viết với Copilot (sau AI) |
|------------------------|--------------------------|
| 30–60 phút cho 1 test script cơ bản | 5–15 phút cho script tương tự |
| Phải nhớ syntax chính xác | Copilot gợi ý, bạn chỉ cần chọn |
| Debug tự mình | Copilot giải thích lỗi và gợi ý fix |
| POM phải viết tay | Copilot tạo POM từ HTML snippet |

---

### 1.2 Xây dựng Skill với Claude — Khái niệm

**Claude Skill** là các "công thức" được cấu hình sẵn, giúp AI trả về output nhất quán, có cấu trúc, và đúng với dự án của bạn.

Thay vì viết lại prompt dài mỗi lần, bạn chỉ cần gọi tên skill.

| Loại Skill QA | Mục đích |
|--------------|---------|
| **Test Case Generator** | Sinh test case theo template chuẩn của team |
| **Bug Report Enhancer** | Biến bug report sơ sài thành báo cáo chuyên nghiệp |
| **Test Data Factory** | Tạo test data theo đúng domain và quy tắc nghiệp vụ |
| **Script Reviewer** | Review và gợi ý cải tiến automation script |
| **Risk Analyzer** | Đánh giá rủi ro sprint trước khi release |

---

### 1.3 Cấu trúc một Skill — Skill Creator Pattern

```markdown
## Tên Skill: [Tên rõ ràng, ngắn gọn]

## Mục đích:
[Mô tả skill này làm gì, dùng khi nào]

## Input yêu cầu:
[Người dùng cần cung cấp gì?]

## Quy trình xử lý:
[AI sẽ làm gì với input đó? Từng bước]

## Output format:
[Định dạng kết quả cụ thể — bảng, markdown, JSON, ...]

## Ví dụ mẫu (few-shot):
[1–2 ví dụ input → output mong muốn]

## Lưu ý / Ràng buộc:
[Những điều AI phải / không được làm]
```

---

## PHẦN 2 — THỰC HÀNH (120 phút)

### 🔬 Lab 4.1 — Automation Script với AI (40 phút)

**Mục tiêu:** Dùng AI tạo script kiểm tra luồng đăng nhập

**Prompt cho Selenium WebDriver (Java + TestNG):**

```
Tạo Selenium WebDriver test (Java, TestNG) cho tính năng đăng nhập.
URL: https://the-internet.herokuapp.com/login

Test cases cần cover:
1. Đăng nhập thành công (user: tomsmith / pass: SuperSecretPassword!)
2. Sai mật khẩu (user: tomsmith / pass: wrongpass)
3. Bỏ trống cả hai trường

Yêu cầu kỹ thuật:
- Sử dụng Page Object Model (tách LoginPage riêng)
- Dùng Explicit Wait, KHÔNG dùng Thread.sleep
- Thêm Assert kiểm tra message thông báo
- TestNG annotations: @Test, @BeforeMethod, @AfterMethod
```

---

### ✅ HANDS-ON CHECKPOINT 4: Review Script AI tạo ra

> **Checklist review** — đánh dấu ✅ đã / ❌ chưa:

```
[ ] Page Object Model có tách biệt khỏi test logic?
[ ] Có Explicit Wait thay vì Thread.sleep?
[ ] Assert message có chính xác?
[ ] Test data có bị hard-code trong test method?
[ ] Có thể chạy độc lập không? (Test isolation)
[ ] Tên biến, phương thức có rõ ràng, dễ hiểu?
[ ] @BeforeMethod và @AfterMethod có setup/teardown đúng?
```

> 💡 **Nếu có lỗi:** Paste error message vào AI và hỏi:  
> *"Tại sao lỗi này xảy ra và fix như thế nào?"*

> 🎯 **Dành cho Manual Tester:** Dùng AI giải thích từng dòng code bạn chưa hiểu — không cần biết code để review được output AI tạo ra.

---

### 🔬 Lab 4.2 — Xây dựng 3 Custom Skills (60 phút)

#### SKILL 1: Test Case Generator (20 phút)

Mở Claude.ai và set system prompt (hoặc dùng Claude Projects):

```
Bạn là Test Case Generator chuyên nghiệp.

THÔNG TIN DỰ ÁN:
[Paste Context Card của bạn từ Session 3 vào đây]

KHI NHẬN ĐƯỢC USER STORY, BẠN SẼ:
1. Phân tích acceptance criteria
2. Tạo test case theo format:
   TC-ID | Loại | Mô tả | Precondition | Steps | Expected | Priority
3. Bao gồm: Happy path, Negative cases, Boundary values, Edge cases
4. Xếp loại Priority: P1 (critical), P2 (high), P3 (medium)
5. Ưu tiên những rủi ro đặc thù của [DOMAIN DỰ ÁN]

RÀNG BUỘC:
- Không tạo test case chung chung, không liên quan đến domain
- Luôn hỏi nếu thiếu thông tin quan trọng
- Tối thiểu 8 test case cho mỗi user story
```

**Test:** Paste 1 User Story thực tế vào, xem kết quả.

---

#### SKILL 2: Bug Report Enhancer (20 phút)

```
Bạn là QA Technical Writer chuyên nghiệp.

KHI NHẬN ĐƯỢC BUG DESCRIPTION SƠ SÀI, BẠN SẼ:
1. Thêm tiêu đề rõ ràng: [Module] - [Vấn đề ngắn gọn]
2. Viết lại Steps to Reproduce chi tiết (đánh số, cụ thể)
3. Phân biệt rõ: Actual result vs Expected result
4. Đề xuất: Severity (Critical/High/Medium/Low) và Priority với lý do
5. Gợi ý: Attachments / evidence cần có
6. Thêm Environment info nếu chưa có

RÀNG BUỘC:
- Giữ nguyên ngôn ngữ gốc (Việt/Anh), chỉ làm rõ và thêm thông tin
- Không bịa thêm thông tin không có trong bug description gốc
- Nếu thiếu thông tin quan trọng, đánh dấu [CẦN XÁC NHẬN]
```

**Test:** Paste 1 bug report sơ sài bất kỳ, xem AI làm đẹp như thế nào.

---

#### SKILL 3: Sprint Risk Analyzer (20 phút)

```
Bạn là QA Risk Analyst có kinh nghiệm.

KHI NHẬN ĐƯỢC DANH SÁCH THAY ĐỔI TRONG SPRINT, BẠN SẼ PHÂN TÍCH VÀ TRẢ VỀ:

1. **Top 5 rủi ro kiểm thử** (sắp xếp theo mức độ)
2. **Các tính năng có thể bị ảnh hưởng ngoài ý muốn** (regression risk)
3. **Đề xuất thứ tự test** nếu ít thời gian
4. **Flag** những thay đổi nào cần QA Lead review đặc biệt

FORMAT OUTPUT — Bảng Markdown:
| Rủi ro | Mức độ | Lý do | Hành động đề xuất |
|--------|--------|-------|------------------|

RÀNG BUỘC:
- Tập trung vào rủi ro có thể xảy ra, không phải lý thuyết
- Ưu tiên business impact cao
- Nếu không đủ thông tin, hỏi thêm trước khi phân tích
```

**Test:** Paste changelogs hoặc sprint notes của bạn.

---

### 💡 TÌNH HUỐNG THỰC TẾ 4: "Copilot gợi ý code sai"

**Bối cảnh:**  
Hoàng là Automation Engineer. Anh dùng Copilot để viết test cho API. Copilot gợi ý dùng `Thread.sleep(3000)` để chờ element load. Hoàng nhận Copilot suggestion và push lên. CI pipeline pass.

Sau 2 tuần, team thấy test **flaky** — lúc pass lúc fail không rõ lý do.

**Câu hỏi:**
1. Lỗi kỹ thuật cụ thể là gì với `Thread.sleep`?
2. Mindset nào của Hoàng bị thiếu?
3. Viết lại đoạn code dùng Explicit Wait với sự hỗ trợ của AI.
4. Nên thêm quy tắc gì vào checklist review script?

---

## PHẦN 3 — KIỂM TRA HIỂU BÀI (20 phút)

### 📋 SCENARIO-BASED ASSESSMENT: "Skill Battle"

> **Thời gian:** 15 phút · Chia lớp thành 3 nhóm

**User Story chung:**

> *"Người dùng có thể thêm sản phẩm vào wishlist. Wishlist lưu tối đa 50 sản phẩm."*

| Nhóm | Cách làm | Đánh giá |
|------|---------|---------|
| **Nhóm 1** | Dùng Skill "Test Case Generator" đã xây dựng | Tốc độ + Chất lượng? |
| **Nhóm 2** | Dùng prompt thường (không có skill) | Tốc độ + Chất lượng? |
| **Nhóm 3** | Dùng Skill + thêm Context Card | Tốc độ + Chất lượng? |

**So sánh:**
1. Nhóm nào ra kết quả nhanh nhất?
2. Nhóm nào ra kết quả chất lượng nhất? *(QA Lead đánh giá)*
3. Skill có thay đổi kết quả so với prompt thường không?
4. Context Card có làm tăng chất lượng thêm không?

---

## 📝 RECAP — 5 điểm chính Session 4

1. ✅ **Copilot / AI giảm 70% thời gian viết script** — nhưng vẫn cần review kỹ
2. ✅ **Skill = Prompt đã được cấu hình sẵn** — tiết kiệm thời gian, tăng nhất quán
3. ✅ **Skill Creator pattern:** Tên + Mục đích + Input + Quy trình + Output + Ví dụ
4. ✅ **3 skill có giá trị nhất:** Test Gen + Bug Enhancer + Risk Analyzer
5. ✅ **AI gợi ý code sai** — luôn review trước khi chạy, đặc biệt với CI/CD

---

## 🗒️ QUICK REFERENCE — Cheat Sheet Session 4

```
Copilot: Viết comment mô tả yêu cầu, Copilot tự viết code

Selenium prompt:
  "Dùng POM, Explicit Wait, TestNG, KHÔNG dùng Thread.sleep"

Playwright prompt:
  "Dùng async/await, locators chuẩn (getByRole/getByText), assertions rõ ràng"

Skill lưu ở đâu:
  → Claude Projects (system prompt)
  → Notion page
  → File .md trong repo: /docs/ai-skills/

Review checklist script AI:
  POM ✓ | Explicit Wait ✓ | Assert ✓ | No hardcode ✓ | Isolated ✓
```

---

## 📚 Bài tập về nhà

> Tạo thêm **2 skill mới** cho công việc QA hằng ngày của bạn.  
> Chia sẻ skill với team và đo lường kết quả sau 1 tuần sử dụng.

---

*⬅️ [Session 3 — Context](./session-03-context.md) · ➡️ [Session 5 — AI Agent](./session-05-ai-agent.md)*
