# 📚 Prompt Library — Thư viện Prompt mẫu cho Tester

> Tổng hợp các prompt tái sử dụng được từ 6 sessions.  
> **Cách dùng:** Copy prompt, thay thế `[...]` bằng thông tin dự án của bạn.

---

## 1. TEST CASE GENERATION

### 1.1 Từ User Story (Zero-shot + Role)

```
Bạn là Senior QA Engineer với 5 năm kinh nghiệm test [DOMAIN].

Hệ thống: [MÔ TẢ HỆ THỐNG]
User chính: [AI LÀ USER]
Tech stack: [FRONTEND / BACKEND / DB]

User Story:
[PASTE USER STORY VÀO ĐÂY]

Hãy tạo test cases theo format:
| TC-ID | Loại | Tên test case | Precondition | Steps | Expected result | Priority |

Bao gồm: Happy path, Negative cases, Boundary values, Edge cases
Priority: P1 (Critical) / P2 (High) / P3 (Medium)
Minimum: 8 test cases
```

---

### 1.2 Từ API Spec (Chain-of-Thought)

```
Hãy suy nghĩ từng bước để tạo test cases cho API sau:

API: [ENDPOINT URL + METHOD]
Payload: [REQUEST BODY EXAMPLE]
Auth: [AUTHENTICATION METHOD]

Bước 1: Liệt kê các test scenarios cần cover
Bước 2: Xác định test data cho mỗi scenario
Bước 3: Viết test cases với status code expected
Bước 4: Thêm edge cases và error cases
Bước 5: Đề xuất assertions quan trọng nhất
```

---

### 1.3 Từ Acceptance Criteria (Few-shot)

```
Tôi cần tạo test cases từ Acceptance Criteria. Đây là 2 ví dụ:

Ví dụ 1:
AC: "Hệ thống cho phép chuyển tiền tối đa 500 triệu VND mỗi ngày"
Test case: Chuyển đúng 500 triệu → Pass | Chuyển 500 triệu + 1 đồng → Fail

Ví dụ 2:
AC: "Password phải có ít nhất 8 ký tự, 1 chữ hoa, 1 số"
Test case: "Test@1234" → Pass | "test1234" → Fail | "TEST1234" → Fail

Bây giờ tạo test cases từ AC sau:
[PASTE ACCEPTANCE CRITERIA VÀO ĐÂY]
```

---

## 2. BUG REPORT

### 2.1 Enhance bug report sơ sài

```
Tôi có bug report sau đây còn sơ sài:
---
[PASTE BUG REPORT VÀO ĐÂY]
---

Hãy làm rõ bug report này:
1. Tiêu đề rõ ràng: [Module] - [Vấn đề ngắn gọn]
2. Steps to Reproduce chi tiết (đánh số)
3. Actual result vs Expected result (phân biệt rõ)
4. Severity (Critical/High/Medium/Low) + lý do
5. Priority + lý do
6. Gợi ý attachments/evidence cần có
7. Environment info nếu thiếu

Giữ nguyên ngôn ngữ gốc. Đánh dấu [CẦN XÁC NHẬN] nếu thiếu thông tin.
```

---

### 2.2 Phân tích root cause từ error log

```
Đóng vai Senior Developer + QA Engineer.

Error log:
---
[PASTE ERROR LOG VÀO ĐÂY]
---

Hãy phân tích:
1. Lỗi xảy ra ở tầng nào? (Frontend / Backend / Database / Network)
2. Root cause có khả năng nhất là gì?
3. Bước reproduce để verify root cause
4. Test cases cần thêm để catch lỗi này trong tương lai
5. Ảnh hưởng đến tính năng nào khác?
```

---

## 3. TEST DATA GENERATION

### 3.1 Domain-specific test data

```
Tạo test data cho hệ thống [DOMAIN] với các yêu cầu sau:

ĐỊNH DẠNG DỮ LIỆU:
- [Trường 1]: [quy tắc định dạng]
- [Trường 2]: [quy tắc định dạng]
- [Trường 3]: [quy tắc định dạng]

QUY TẮC NGHIỆP VỤ:
- [Quy tắc 1]
- [Quy tắc 2]

XUẤT RA:
- 15 dòng data hợp lệ (valid)
- 5 dòng edge case (boundary values)
- 5 dòng data lỗi (invalid, để test validation)

Format: CSV với header
```

---

### 3.2 Test data cho API testing

```
Tạo test data JSON cho API [ENDPOINT]:

Schema yêu cầu:
[PASTE JSON SCHEMA HOẶC EXAMPLE]

Tạo:
1. Request body hợp lệ (5 variations)
2. Request thiếu required fields (3 cases)
3. Request với data type sai (3 cases)
4. Request với boundary values (3 cases)

Format: Array of JSON objects với comment giải thích
```

---

## 4. AUTOMATION SCRIPT

### 4.1 Selenium WebDriver (Java + TestNG)

```
Tạo Selenium WebDriver test class (Java, TestNG) cho:

URL: [URL]
Tính năng: [MÔ TẢ TÍNH NĂNG]

Test cases cần cover:
1. [Test case 1]
2. [Test case 2]
3. [Test case 3]

YÊU CẦU KỸ THUẬT:
- Page Object Model (tách Page class riêng)
- Explicit Wait (WebDriverWait + ExpectedConditions)
- KHÔNG dùng Thread.sleep
- TestNG: @Test, @BeforeMethod, @AfterMethod
- Assert với message rõ ràng
- Test data không hard-code trong @Test methods

Tạo 2 file: [FeatureName]Page.java và [FeatureName]Test.java
```

---

### 4.2 Playwright (TypeScript)

```
Tạo Playwright test (TypeScript) cho:

URL: [URL]
Tính năng: [MÔ TẢ]

Test cases:
1. [Test case 1]
2. [Test case 2]

YÊU CẦU:
- Dùng Page Object Model
- Locators theo thứ tự ưu tiên: getByRole > getByText > getByLabel > CSS
- async/await đầy đủ
- expect() assertions rõ ràng
- test.beforeEach / test.afterEach cho setup/teardown
- Không dùng hard-coded selectors như "div.class-name" nếu có thể tránh
```

---

### 4.3 REST Assured (Java)

```
Tạo REST Assured test (Java, TestNG) cho API:

Base URL: [URL]
Endpoint: [PATH]
Method: [GET/POST/PUT/DELETE]
Auth: [Bearer token / Basic / None]

Request body (nếu có):
[JSON EXAMPLE]

Test cases:
1. Happy path — status 200 + verify response body
2. Invalid input — status 400 + verify error message
3. Unauthorized — status 401
4. Not found — status 404

YÊU CẦU:
- RestAssured.given().when().then() syntax
- JSON Schema validation nếu có schema
- Soft assertions cho response body
- @BeforeClass để setup base URL và auth
```

---

## 5. RISK ANALYSIS

### 5.1 Sprint risk analysis

```
Đóng vai QA Lead có kinh nghiệm. Phân tích rủi ro sprint sau:

THAY ĐỔI TRONG SPRINT:
---
[PASTE SPRINT NOTES / CHANGELOGS]
---

Hãy trả về:

## Top 5 Rủi ro Kiểm thử
| Rủi ro | Mức độ | Lý do | Hành động đề xuất |

## Regression Risk
Tính năng nào có thể bị ảnh hưởng ngoài ý muốn?

## Thứ tự test nếu ít thời gian
1. [Test gì trước và tại sao]

## Flag cho QA Lead
[Điều gì cần QA Lead quyết định trực tiếp?]
```

---

### 5.2 Release readiness check

```
Dựa trên kết quả test sau, đánh giá sẵn sàng release:

KẾT QUẢ TEST:
- Tổng TC: [X]
- Pass: [X] ([X]%)
- Fail: [X]
- Blocked: [X]
- Bug mở: [X] (Critical: [X], High: [X], Medium: [X])

THAY ĐỔI TRONG RELEASE NÀY:
[DANH SÁCH TÍNH NĂNG]

Hãy đánh giá:
1. Ready to release? (Yes / No / Conditional)
2. Điều kiện release nếu "Conditional"
3. Rủi ro nếu release với bug hiện tại
4. Đề xuất cho QA Lead và PM
```

---

## 6. REVIEW & SUMMARY

### 6.1 Review test plan

```
Đóng vai QA Lead senior, review test plan sau:
---
[PASTE TEST PLAN]
---

Feedback theo các khía cạnh:
1. Coverage: Có bỏ sót risk area nào không?
2. Prioritization: Thứ tự test có hợp lý không?
3. Feasibility: Có thể thực hiện trong timeframe không?
4. Completeness: Thiếu phần nào?
5. Đề xuất cải thiện: Top 3 điều nên sửa ngay
```

---

### 6.2 Tóm tắt test execution report

```
Tóm tắt báo cáo test sau đây thành bản executive summary (1 trang):
---
[PASTE RAW TEST REPORT]
---

Format output:
## Executive Summary — [Sprint/Version Name]
**Ngày:** [Date] | **QA:** [Name] | **Build:** [Build number]

### Kết quả tổng quan
[Bảng tóm tắt số liệu]

### Điểm nổi bật
- ✅ [Điều tốt]
- ⚠️ [Điều cần lưu ý]
- ❌ [Vấn đề nghiêm trọng]

### Quyết định đề xuất
[RELEASE / HOLD / CONDITIONAL RELEASE + lý do ngắn]
```

---

*🏠 [README](../index.md) · 📋 [Cheat Sheets](./cheat-sheets.md)*
