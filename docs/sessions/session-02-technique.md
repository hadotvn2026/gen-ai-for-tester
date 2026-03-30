# Session 2 — Technique: Prompt Engineering cho Tester

> **Nguyên tắc:** 🟢 TECHNIQUE  
> **Thời lượng:** 3 giờ · Lý thuyết: 70 phút · Thực hành: 110 phút · Kiểm tra: 20 phút  
> **Prerequisite:** [Session 1 — Mindset](./session-01-mindset.md)

---

## 🎯 Mục tiêu buổi học

Sau session này, học viên có thể:

- [ ] Phân tích cấu trúc của một prompt hiệu quả (4 thành phần)
- [ ] Áp dụng 4 kỹ thuật prompt chính vào công việc QA hằng ngày
- [ ] Xây dựng thư viện prompt cá nhân tái sử dụng được
- [ ] Xử lý khi AI trả về kết quả sai hoặc thiếu
- [ ] Thực hiện multi-turn prompting để làm giàu kết quả

---

## PHẦN 1 — LÝ THUYẾT (70 phút)

### 1.1 Giải phẫu một prompt tốt

Một prompt hiệu quả cho Tester gồm **4 thành phần**:

```
┌─────────────────────────────────────────────────────────┐
│  [ROLE]    → Vai trò AI đóng                            │
│  [CONTEXT] → Bối cảnh dự án                             │
│  [TASK]    → Nhiệm vụ cụ thể                            │
│  [FORMAT]  → Định dạng output mong muốn                 │
└─────────────────────────────────────────────────────────┘
```

**Ví dụ đầy đủ:**

```
[ROLE]    Bạn là QA Engineer kỹ lưỡng với 5 năm kinh nghiệm test API
[CONTEXT] Dự án là hệ thống quản lý bệnh viện, user là bác sĩ và y tá
[TASK]    Hãy tạo test case cho tính năng "Đặt lịch khám"
[FORMAT]  Trả về dưới dạng bảng: STT | Loại | Mô tả | Expected result
```

| Thành phần | Vai trò | Ví dụ cụ thể |
|-----------|---------|-------------|
| **ROLE** | Định hướng "góc nhìn" của AI | "Bạn là QA Engineer kỹ lưỡng với 5 năm kinh nghiệm..." |
| **CONTEXT** | Cung cấp bối cảnh dự án | "Dự án là hệ thống quản lý bệnh viện, user là bác sĩ và y tá" |
| **TASK** | Nhiệm vụ rõ ràng, đo lường được | "Tạo test case cho tính năng Đặt lịch khám" |
| **FORMAT** | Định dạng output cụ thể | "Bảng: STT \| Loại \| Mô tả \| Expected result" |

---

### 1.2 Bốn kỹ thuật Prompt chính

#### Kỹ thuật 1: Zero-shot Prompting

Đưa ra yêu cầu trực tiếp không cần ví dụ. Tốt cho các tác vụ đơn giản và phổ biến.

```
Tạo 5 test case cho chức năng "Đăng ký tài khoản" của ứng dụng mobile.
Bao gồm: positive case, negative case, và boundary value.
```

**Dùng khi:** Tác vụ quen thuộc, output format đơn giản.

---

#### Kỹ thuật 2: Few-shot Prompting

Cung cấp 1–3 ví dụ mẫu trước khi yêu cầu AI làm. Tốt cho output có định dạng phức tạp.

```
Tôi cần tạo test case theo format sau. Đây là 2 ví dụ:

Ví dụ 1:
TC-001 | Positive | Đăng nhập thành công | Email và password đúng | Vào được dashboard

Ví dụ 2:
TC-002 | Negative | Sai mật khẩu | Password sai 3 lần | Tài khoản bị khóa 15 phút

Bây giờ tạo thêm 5 test case tương tự cho chức năng "Đặt lại mật khẩu".
```

**Dùng khi:** Format output phức tạp, muốn AI "bắt chước" cách viết của team.

---

#### Kỹ thuật 3: Chain-of-Thought (CoT)

Yêu cầu AI suy nghĩ từng bước trước khi đưa ra kết quả. Tốt cho bug analysis và risk assessment.

```
Hãy phân tích bug sau đây bằng cách sử dụng suy nghĩ từng bước:

Bug: "Ứng dụng crash khi user upload file PDF lớn hơn 10MB"

Bước 1: Liệt kê các nguyên nhân có thể gây ra bug này
Bước 2: Xác định nguyên nhân có khả năng cao nhất
Bước 3: Đề xuất các test case để verify fix
Bước 4: Đánh giá severity và priority
```

**Dùng khi:** Phân tích phức tạp, cần lý luận có logic.

---

#### Kỹ thuật 4: Role Prompting

Gán cho AI một vai trò cụ thể để có cách nhìn chuyên sâu hơn.

```
Đóng vai QA Lead với 10 năm kinh nghiệm test hệ thống ngân hàng.
Hãy review test plan sau và chỉ ra 3 rủi ro lớn nhất bị bỏ sót...
```

| Vai trò giao cho AI | Khi nào dùng |
|--------------------|-------------|
| "Đóng vai QA Lead với 10 năm kinh nghiệm..." | Review test plan, đánh giá rủi ro |
| "Đóng vai hacker mũ trắng (ethical hacker)..." | Sinh security test case |
| "Đóng vai end-user là người cao tuổi không giỏi công nghệ..." | UX / accessibility testing |
| "Đóng vai developer review code của Automation Tester..." | Review automation script |

---

### 1.3 Xử lý khi AI trả về sai — 3 chiến lược

| Vấn đề | Chiến lược xử lý |
|--------|----------------|
| Output quá chung, không cụ thể | Thêm context: mô tả hệ thống, user, business rule |
| AI bỏ sót trường hợp quan trọng | Followup: "Bây giờ focus vào các trường hợp lỗi và edge case" |
| Format không đúng ý | Cho ví dụ mẫu cụ thể (chiến lược few-shot) |
| AI hallucinate (bịa thông tin) | Yêu cầu AI chỉ đưa ra những gì chắc chắn, đánh dấu rõ nếu không chắc |

---

## PHẦN 2 — THỰC HÀNH (110 phút)

### 🔬 Lab 2.1 — Xây dựng Prompt Library cá nhân (40 phút)

Mỗi học viên tạo file ghi chú (Notion / Google Doc / Notepad) chứa **4 prompt** sau:

---

**PROMPT 1 — Test Case Generation:**

```
[ROLE] Bạn là Senior QA Engineer với kinh nghiệm test [DOMAIN DỰ ÁN CỦA BẠN].
[CONTEXT] Hệ thống: [MÔ TẢ HỆ THỐNG]. User chính: [AI LÀ USER].
[TASK] Tạo test case cho tính năng: [TÊN TÍNH NĂNG]
Bao gồm: happy path, negative cases, boundary values, edge cases.
[FORMAT] Bảng Markdown: STT | Loại | Tên test case | Precondition | Steps | Expected | Priority (P1/P2/P3)
```

---

**PROMPT 2 — Bug Report Enhancement:**

```
Tôi có bug report sau đây còn sơ sài:
---
[PASTE BUG REPORT VÀO ĐÂY]
---
Hãy làm rõ bug report này bằng cách:
1. Viết lại tiêu đề rõ ràng hơn
2. Thêm Steps to Reproduce chi tiết
3. Phân biệt rõ Actual result vs Expected result
4. Đề xuất Severity và Priority với lý do
5. Gợi ý: Attachments/evidence cần có
```

---

**PROMPT 3 — API Test Creation (Chain-of-Thought):**

```
Hãy suy nghĩ từng bước để tạo Postman test collection cho API sau:
[PASTE API SPEC / ENDPOINT VÀO ĐÂY]

Bước 1: Liệt kê các test scenarios chính
Bước 2: Xác định test data cần thiết
Bước 3: Viết test cases với request/response examples
Bước 4: Thêm assertions cho mỗi test case
```

---

**PROMPT 4 — Risk Analysis (Role Prompting):**

```
Đóng vai QA Lead với 8 năm kinh nghiệm, hãy đánh giá rủi ro của sprint sau trước khi release:
---
[PASTE SPRINT NOTES / CHANGELOGS]
---
Trả về:
- Top 5 rủi ro kiểm thử (sắp xếp theo mức độ)
- Các tính năng có thể bị ảnh hưởng ngoài ý muốn
- Đề xuất: Nên test gì trước nếu ít thời gian
```

---

### ✅ HANDS-ON CHECKPOINT 2: Kiểm tra Prompt Library

> **Thời gian:** 5 phút tự đánh giá · Chia sẻ 1 prompt tốt nhất lên Zoom chat

**Tiêu chí đánh giá:**

- [ ] Mỗi prompt có đủ 4 thành phần (Role, Context, Task, Format)?
- [ ] Bạn có sử dụng ít nhất 2 trong 4 kỹ thuật đã học?
- [ ] Output AI trả về có đúng với nhu cầu thực tế của bạn không?
- [ ] Bạn đã thử "cải tiến" prompt sau khi thấy output chưa đủ?

---

### 🔬 Lab 2.2 — Prompt Battle (30 phút)

> **Làm việc nhóm:** 5 người · Mỗi người dùng 1 kỹ thuật khác nhau

**User Story chung cho tất cả nhóm:**

> *"Là một khách hàng, tôi muốn có thể hủy đơn hàng trong vòng 2 giờ sau khi đặt, với điều kiện đơn hàng chưa được xử lý."*

| Người | Kỹ thuật | Nhiệm vụ |
|-------|---------|---------|
| Người 1 | **Zero-shot** | Yêu cầu thẳng, không ví dụ |
| Người 2 | **Few-shot** | Cho 2 ví dụ test case trước |
| Người 3 | **Chain-of-Thought** | Yêu cầu AI suy nghĩ từng bước |
| Người 4 | **Role prompting** | AI đóng vai QA Lead kỹ tính |
| Người 5 | **Kết hợp cả 4** | Combine tất cả kỹ thuật |

**Sau khi mỗi người có output:** So sánh và bầu chọn prompt tốt nhất.

---

### 💡 TÌNH HUỐNG THỰC TẾ 2: "Prompt quá chung, output vô dụng"

**Bối cảnh:**  
Trung là Manual Tester mới học dùng AI. Anh nhập prompt:

```
Tạo test case cho hệ thống
```

AI trả về 10 test case rất chung chung, không liên quan đến dự án ngân hàng của anh. Trung bực bội, nghĩ rằng *"AI không tốt cho việc này"*.

**Câu hỏi:**
1. Nguyên nhân thật sự là gì? (AI hay Prompt?)
2. Viết lại prompt tốt hơn cho tình huống của Trung.
3. Nguyên tắc nào trong Technique model bị vi phạm?
4. Làm thế nào để Trung không mắc lỗi này lần sau?

---

### 🔬 Lab 2.3 — Advanced: Multi-turn Prompting (20 phút)

Một prompt hiếm khi là đủ. Luyện kỹ năng tiếp nối cuộc hội thoại:

**Quy trình Multi-turn:**

```
Turn 1: "Tạo test case cơ bản cho tính năng Tìm kiếm sản phẩm"
         → Xem output

Turn 2: "Hãy mở rộng thêm 3 edge case mà bạn chưa nêu"
         → Xem output

Turn 3: "Viết lại test case số [X] chi tiết hơn,
          bao gồm precondition và test data cụ thể"
         → Xem output

Turn 4: "Xếp hạng các test case này theo mức độ rủi ro từ cao xuống thấp"
         → Xem output

Turn 5: "Tạo Gherkin (Given/When/Then) cho 3 test case quan trọng nhất"
         → Final output
```

> **Thực hành:** Áp dụng multi-turn với tính năng "Tìm kiếm sản phẩm" trên bất kỳ e-commerce nào.

---

## PHẦN 3 — KIỂM TRA HIỂU BÀI (20 phút)

### 📋 SCENARIO-BASED ASSESSMENT: "Fix the Prompt"

> **Thời gian:** 10 phút cá nhân → 10 phút chia sẻ toàn lớp

Dưới đây là các prompt kém. Nhiệm vụ của bạn: **viết lại prompt tốt hơn**.

---

**Prompt kém 1:**
```
Tạo test
```
- Vấn đề: `_______________`
- Prompt tốt hơn: `_______________`

---

**Prompt kém 2:**
```
Hãy giúp tôi test ứng dụng mobile
```
- Vấn đề: `_______________`
- Prompt tốt hơn: `_______________`

---

**Prompt kém 3:**
```
Viết code Selenium cho tôi
```
- Vấn đề: `_______________`
- Prompt tốt hơn: `_______________`

---

## 📝 RECAP — 5 điểm chính Session 2

1. ✅ **Prompt tốt = [Role] + [Context] + [Task] + [Format]**
2. ✅ **4 kỹ thuật:** Zero-shot (đơn giản), Few-shot (có mẫu), CoT (phân tích), Role (chuyên sâu)
3. ✅ **Output sai ⇒ Chỉnh prompt**, không phải đổi bot AI
4. ✅ **Multi-turn:** Dùng followup để làm giàu dần kết quả
5. ✅ **Xây dựng Prompt Library cá nhân** — tài sản quý giá nhất sau khóa học này

---

## 🗒️ QUICK REFERENCE — Cheat Sheet Session 2

```
Template chuẩn:
  [Đóng vai X] [Bối cảnh Y] [Làm việc Z] [Trả về định dạng W]

Zero-shot : Đưa yêu cầu thẳng, không cần ví dụ
Few-shot  : "Đây là 2 ví dụ... bây giờ làm tương tự cho..."
CoT       : "Hãy suy nghĩ từng bước trước khi trả lời..."
Role      : "Đóng vai [vai trò cụ thể] với [X] năm kinh nghiệm..."

Fix output:
  → Thêm context
  → Cho ví dụ mẫu (few-shot)
  → Yêu cầu chi tiết hơn trong followup
```

---

## 📚 Bài tập về nhà

> Xây dựng **Prompt Library 10 prompt** cho dự án hiện tại của bạn.  
> Mỗi prompt phải có đủ 4 thành phần và đã được test thực tế.  
> Lưu vào Notion / Google Doc để dùng lại.

---

*⬅️ [Session 1 — Mindset](./session-01-mindset.md) · ➡️ [Session 3 — Context](./session-03-context.md)*
