# Session 2 — Technique: Prompt Engineering cho Tester

> Bạn sẽ học cách viết prompt có cấu trúc, áp dụng 4 kỹ thuật chính, và xây dựng thư viện prompt cá nhân tái sử dụng được — những kỹ năng thực tế nhất để tăng năng suất QA hằng ngày.

**Prerequisite:** [Session 1 — Mindset](./session-01-mindset.md)

## ✅ Mục tiêu — Sau session này bạn có thể

- [ ] Phân tích cấu trúc của một prompt hiệu quả (4 thành phần)
- [ ] Áp dụng 4 kỹ thuật prompt chính vào công việc QA hằng ngày
- [ ] Xây dựng thư viện prompt cá nhân tái sử dụng được
- [ ] Xử lý khi AI trả về kết quả sai hoặc thiếu
- [ ] Thực hiện multi-turn prompting để làm giàu kết quả

---

## PHẦN 1 — LÝ THUYẾT

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

### 📺 Video tham khảo — Prompt Engineering từ cơ bản đến nâng cao

> **"Prompt Engineering Tutorial – Master ChatGPT and LLM Responses"** — freeCodeCamp · 1 giờ · Tiếng Anh

<iframe width="100%" height="380" src="https://www.youtube.com/embed/_ZvnD73m40o" title="Prompt Engineering Tutorial – Master ChatGPT and LLM Responses" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

> Hướng dẫn toàn diện về prompt engineering: zero-shot, few-shot, chain-of-thought, và best practices với ChatGPT/LLM. Bao gồm thực hành thực tế.

---

### 1.3 Xử lý khi AI trả về sai — 3 chiến lược

| Vấn đề | Chiến lược xử lý |
|--------|----------------|
| Output quá chung, không cụ thể | Thêm context: mô tả hệ thống, user, business rule |
| AI bỏ sót trường hợp quan trọng | Followup: "Bây giờ focus vào các trường hợp lỗi và edge case" |
| Format không đúng ý | Cho ví dụ mẫu cụ thể (chiến lược few-shot) |
| AI hallucinate (bịa thông tin) | Yêu cầu AI chỉ đưa ra những gì chắc chắn, đánh dấu rõ nếu không chắc |

---

## PHẦN 2 — THỰC HÀNH

### 🛠️ Bài tập 2.1 — Xây dựng Prompt Library cá nhân

> **Thời gian ước tính:** 40 phút | **Công cụ:** ChatGPT hoặc Claude.ai + Notion / Google Doc / bất kỳ ứng dụng ghi chú nào

**Bước 1:** Tạo một file ghi chú mới (Notion, Google Doc, hoặc Notepad đều được). Đặt tên: `Prompt Library — QA`.

**Bước 2:** Copy lần lượt 4 prompt template bên dưới vào file của bạn.

**Bước 3:** Với mỗi prompt, thay thế các phần trong `[DẤU NGOẶC VUÔNG]` bằng thông tin thực tế từ dự án của bạn (hoặc dùng một dự án mẫu nếu chưa có dự án thực).

**Bước 4:** Chạy thử từng prompt đã điền vào AI và xem output. Ghi chú lại những gì cần điều chỉnh.

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

**✅ Kết quả mong đợi:**
> Bạn có một file ghi chú chứa 4 prompt đã được cá nhân hóa cho dự án của mình. Khi chạy thử, output của mỗi prompt sẽ liên quan trực tiếp đến ngữ cảnh bạn đã điền vào — không còn chung chung nữa. Prompt Library này là tài sản bạn sẽ dùng lại hằng ngày.

**❓ Tự kiểm tra:**
- [ ] Mỗi prompt có đủ 4 thành phần (Role, Context, Task, Format)?
- [ ] Bạn có sử dụng ít nhất 2 trong 4 kỹ thuật đã học?
- [ ] Output AI trả về có đúng với nhu cầu thực tế của bạn không?
- [ ] Bạn đã thử "cải tiến" prompt sau khi thấy output chưa đủ?

💡 **Gợi ý khi bị kẹt:** Nếu chưa có dự án thực tế, hãy dùng: domain = "e-commerce", hệ thống = "ứng dụng mua sắm online", user = "khách hàng phổ thông". Điều quan trọng là luyện tập điền context — không phải tính chính xác của dữ liệu mẫu.

---

### 🛠️ Bài tập 2.2 — Prompt Battle cá nhân

> **Thời gian ước tính:** 30 phút | **Công cụ:** ChatGPT hoặc Claude.ai

Bài tập này giúp bạn tự trải nghiệm sự khác biệt giữa 4 kỹ thuật prompt với cùng một user story.

**User Story:**

> *"Là một khách hàng, tôi muốn có thể hủy đơn hàng trong vòng 2 giờ sau khi đặt, với điều kiện đơn hàng chưa được xử lý."*

**Bước 1:** Viết và chạy 4 prompt riêng biệt cho user story trên, mỗi prompt dùng một kỹ thuật khác nhau:

| Lượt | Kỹ thuật | Yêu cầu của bạn |
|------|---------|----------------|
| **Lượt 1** | **Zero-shot** | Yêu cầu thẳng, không ví dụ, không role |
| **Lượt 2** | **Few-shot** | Cho 2 ví dụ test case trước, sau đó yêu cầu tạo thêm |
| **Lượt 3** | **Chain-of-Thought** | Yêu cầu AI suy nghĩ từng bước trước khi tạo test case |
| **Lượt 4** | **Role prompting** | Cho AI đóng vai QA Lead kỹ tính, yêu cầu review kỹ |

**Bước 2:** Sau khi có cả 4 output, so sánh và điền vào bảng sau vào notes của bạn:

| Kỹ thuật | Số test case tạo được | Có edge case không? | Chất lượng tổng thể (1–5) |
|---------|:--------------------:|:-------------------:|:------------------------:|
| Zero-shot | | | |
| Few-shot | | | |
| Chain-of-Thought | | | |
| Role prompting | | | |

**Bước 3:** Chọn kỹ thuật cho output tốt nhất. Viết lại một prompt kết hợp cả 4 kỹ thuật.

**✅ Kết quả mong đợi:**
> Zero-shot thường cho output nhanh nhưng có thể bỏ sót edge case. Few-shot cho format nhất quán. Chain-of-Thought thường có độ sâu phân tích tốt hơn. Role prompting cho góc nhìn chuyên sâu. Prompt kết hợp cả 4 thường cho output tốt nhất — nhưng cũng dài nhất.

**❓ Tự kiểm tra:**
- [ ] Bạn thấy sự khác biệt rõ ràng giữa 4 kỹ thuật không?
- [ ] Kỹ thuật nào phù hợp nhất với loại công việc QA bạn hay làm?

💡 **Gợi ý khi bị kẹt:** Nếu output các lượt trông giống nhau, hãy làm cho prompt khác biệt hơn. Ví dụ: lượt Few-shot phải có ít nhất 2 ví dụ cụ thể trước khi yêu cầu; lượt CoT phải có "Hãy suy nghĩ từng bước:" ở đầu prompt.

---

### 💡 TÌNH HUỐNG THỰC TẾ: "Prompt quá chung, output vô dụng"

**Bối cảnh:**
Trung là Manual Tester mới học dùng AI. Anh nhập prompt:

```
Tạo test case cho hệ thống
```

AI trả về 10 test case rất chung chung, không liên quan đến dự án ngân hàng của anh. Trung bực bội, nghĩ rằng *"AI không tốt cho việc này"*.

**Bài tập:** Ghi lại câu trả lời của bạn vào notes — không có đáp án duy nhất, miễn là bạn có thể giải thích lý do.

1. Nguyên nhân thật sự là gì? (AI hay Prompt?)
2. Viết lại prompt tốt hơn cho tình huống của Trung.
3. Nguyên tắc nào trong Technique model bị vi phạm?
4. Làm thế nào để Trung không mắc lỗi này lần sau?

---

### 🛠️ Bài tập 2.3 — Multi-turn Prompting

> **Thời gian ước tính:** 20 phút | **Công cụ:** ChatGPT hoặc Claude.ai

Một prompt hiếm khi là đủ. Bài tập này luyện kỹ năng tiếp nối cuộc hội thoại để làm giàu dần kết quả.

**Bước 1:** Mở một cuộc hội thoại mới với AI.

**Bước 2:** Gửi lần lượt 5 prompt sau (mỗi prompt trong cùng một cuộc hội thoại — đừng mở tab mới):

```
Turn 1: "Tạo test case cơ bản cho tính năng Tìm kiếm sản phẩm"
```
→ Đọc output, sau đó gửi tiếp:

```
Turn 2: "Hãy mở rộng thêm 3 edge case mà bạn chưa nêu"
```
→ Đọc output, sau đó gửi tiếp:

```
Turn 3: "Viết lại test case số [X] chi tiết hơn,
          bao gồm precondition và test data cụ thể"
```
*(Thay [X] bằng số thứ tự của test case bạn thấy quan trọng nhất)*

→ Đọc output, sau đó gửi tiếp:

```
Turn 4: "Xếp hạng các test case này theo mức độ rủi ro từ cao xuống thấp"
```
→ Đọc output, sau đó gửi tiếp:

```
Turn 5: "Tạo Gherkin (Given/When/Then) cho 3 test case quan trọng nhất"
```

**Bước 3:** Đọc output cuối cùng (Turn 5). So sánh với output Turn 1. Ghi lại nhận xét vào notes.

**✅ Kết quả mong đợi:**
> Output ở Turn 5 sẽ chi tiết, có cấu trúc, và sát thực tế hơn rất nhiều so với Turn 1. Đây là cách làm việc thực tế với AI — không phải chạy 1 prompt rồi dùng ngay, mà là lặp lại và tinh chỉnh.

**❓ Tự kiểm tra:**
- [ ] Output Turn 5 có tốt hơn Turn 1 rõ rệt không?
- [ ] AI có "nhớ" context từ các turn trước không?
- [ ] Bạn sẽ áp dụng multi-turn như thế nào vào công việc hằng ngày?

💡 **Gợi ý khi bị kẹt:** Nếu AI "quên" context ở turn sau, hãy nhắc lại ngắn gọn: *"Tiếp tục với danh sách test case ở trên, hãy..."*

---

## PHẦN 3 — TỰ ĐÁNH GIÁ

### 📋 "Fix the Prompt"

Dưới đây là các prompt kém. Nhiệm vụ của bạn: phân tích vấn đề và viết lại prompt tốt hơn. Ghi câu trả lời vào notes.

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

💡 **Gợi ý khi bị kẹt:** Với mỗi prompt kém, hãy hỏi: thiếu thành phần nào trong [Role] + [Context] + [Task] + [Format]? Câu trả lời đó chính là "vấn đề", và prompt tốt hơn là phiên bản bổ sung các thành phần còn thiếu.

---

## 📝 Tổng kết

1. ✅ **Prompt tốt = [Role] + [Context] + [Task] + [Format]**
2. ✅ **4 kỹ thuật:** Zero-shot (đơn giản), Few-shot (có mẫu), CoT (phân tích), Role (chuyên sâu)
3. ✅ **Output sai ⇒ Chỉnh prompt**, không phải đổi bot AI
4. ✅ **Multi-turn:** Dùng followup để làm giàu dần kết quả
5. ✅ **Xây dựng Prompt Library cá nhân** — tài sản quý giá nhất sau khóa học này

---

## 🗒️ Cheat Sheet

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
