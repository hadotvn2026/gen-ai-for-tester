# Prompt Library cá nhân

> Lưu lại các prompt hiệu quả bạn tạo ra trong khóa học.
> Thêm tag `#role`, `#session`, `#usecase` để tìm lại dễ hơn.

---

## 📋 Template chuẩn (3-Circle)

```
[ROLE] Bạn là [vai trò AI đóng]...
[CONTEXT] Dự án: [mô tả]. Tech stack: [stack]. Giai đoạn: [phase].
[TASK] [Nhiệm vụ cụ thể]
[FORMAT] [Định dạng output mong muốn]
```

---

## 🐛 Bug Report

> #manual-tester #session2 #bug-report

```
[ROLE] Bạn là QA Engineer viết bug report chuyên nghiệp.

[CONTEXT]
- Dự án: [TÊN DỰ ÁN]
- Môi trường: [staging / production / local]
- Browser/Device: [Chrome 124 / iPhone 15 / ...]

[TASK] Viết bug report từ mô tả lỗi sau:
[DÁN MÔ TẢ LỖI VÀO ĐÂY]

[FORMAT] Markdown theo cấu trúc:
## Summary (1 dòng, verb + object)
## Steps to Reproduce (numbered list)
## Expected Result
## Actual Result
## Severity: [Critical/High/Medium/Low]
## Attachments needed: [list]
```

---

## ✅ Test Case Generation

> #manual-tester #session2 #test-case

```
[ROLE] Bạn là Senior QA Engineer.

[CONTEXT]
- Feature: [MÔ TẢ FEATURE]
- AC: [DÁN ACCEPTANCE CRITERIA VÀO ĐÂY]
- Tech stack: [STACK]

[TASK] Generate test cases theo 4 loại:
1. Happy path (luồng chính)
2. Negative cases (input sai, edge case)
3. Boundary values
4. Permission/role-based (nếu có)

[FORMAT] Bảng: Test ID | Mô tả | Precondition | Steps | Expected Result | Priority
```

---

## 📝 AC Review

> #ba #qa-lead #session2 #requirement

```
[ROLE] Bạn là QA Engineer có kinh nghiệm đánh giá chất lượng requirement.

[CONTEXT]
- Dự án: [MÔ TẢ NGẮN]
- Giai đoạn: Pre-development / Sprint grooming

[TASK] Review Acceptance Criteria dưới đây:
[DÁN AC VÀO ĐÂY]

Kiểm tra: Testable? · Đủ Given/When/Then? · Thiếu edge case nào? · Mâu thuẫn với AC khác không?

[FORMAT] Bảng: AC gốc | Vấn đề phát hiện | Đề xuất cải thiện
```

---

## 📊 Test Execution Report

> #manual-tester #qa-lead #session2 #reporting

```
[ROLE] Bạn là QA Lead tổng hợp báo cáo test execution.

[CONTEXT]
- Sprint/Release: [TÊN]
- Tổng test cases: [số] | Passed: [số] | Failed: [số] | Blocked: [số]
- Critical bugs open: [danh sách hoặc số]

[TASK] Viết Test Execution Report và đưa ra khuyến nghị Go/No-go/Conditional Go.

[FORMAT] Markdown for Confluence/Notion:
## Executive Summary (3 dòng)
## Test Coverage
## Risk Assessment
## Recommendation: [Go / No-go / Conditional Go]
## Conditions (nếu Conditional)
```

---

## 🤖 Thêm prompt của bạn ở đây

<!-- Copy template trên, điền vào và thêm tag -->
