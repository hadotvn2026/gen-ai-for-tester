# Session 1 — Mindset: AI là Co-Pilot của bạn

> **Nguyên tắc:** 🔵 MINDSET  
> **Thời lượng:** 3 giờ · Lý thuyết: 60 phút · Thực hành: 120 phút · Kiểm tra: 20 phút  
> **Đối tượng:** Manual Tester · Automation Engineer · QA Lead

---

## 🎯 Mục tiêu buổi học

Sau session này, học viên có thể:

- [ ] Giải thích GenAI là gì và LLM hoạt động như thế nào (không cần toán học)
- [ ] Phân biệt được khả năng và giới hạn của AI trong kiểm thử
- [ ] Áp dụng tư duy "hoài nghi lành mạnh" khi đánh giá output AI
- [ ] Phân loại được công việc nào nên / không nên giao cho AI
- [ ] Tự chạy prompt đầu tiên và đánh giá kết quả

---

## PHẦN 1 — LÝ THUYẾT (60 phút)

### 1.1 GenAI là gì? Tại sao Tester cần biết?

**Generative AI** là các mô hình có khả năng tạo ra nội dung mới — văn bản, code, hình ảnh — dựa trên dữ liệu đã được huấn luyện.

Trong kiểm thử phần mềm, các mô hình như ChatGPT, Claude, Gemini đang thay đổi cách chúng ta:
- Viết test case
- Phân tích bug
- Tạo test data
- Viết automation script

| Khả năng của AI trong QA | Giới hạn cần nhớ |
|--------------------------|-----------------|
| Sinh test case nhanh từ requirements | Có thể bỏ sót edge case phức tạp |
| Gợi ý cấu trúc test plan | Không hiểu business domain sâu như Tester |
| Phân tích và tóm tắt bug report | Có thể "ảo giác" — bịa thông tin không có thật |
| Viết automation script ban đầu | Code có thể sai, cần review kỹ |
| Tạo test data theo quy tắc | Không kiểm tra tính chính xác của data |

---

### 1.2 Mô hình 3 vòng tròn — Nền tảng toàn khóa học

Toàn bộ khóa học xoay quanh **3 nguyên tắc cốt lõi**:

```
🔵 MINDSET  →  Hiểu mục đích, khả năng, và giới hạn của AI
               Giữ hoài nghi lành mạnh với mọi output

🟢 TECHNIQUE →  Biết cách viết prompt hiệu quả
                Quản lý rủi ro thông tin sai lệch

🔴 CONTEXT  →  Cung cấp bối cảnh cụ thể cho AI
               Rác vào = Rác ra (GIGO)
```

> **💡 Lưu ý:** Ba nguyên tắc này sẽ xuất hiện xuyên suốt mọi buổi học.

---

### 1.3 LLM hoạt động như thế nào? (Không cần toán học)

Hãy hình dung LLM như một **"nhân viên mới cực kỳ đọc nhiều sách"** nhưng chưa bao giờ làm việc thực tế. Họ biết nhiều khái niệm nhưng:

- ❌ Không có memory giữa các đoạn chat riêng biệt
- ❌ Không tự cập nhật kiến thức sau thời điểm huấn luyện
- ❌ Có thể **"tự tin mà sai"** — gọi là **hallucination**
- ✅ Chất lượng output phụ thuộc NHIỀU vào chất lượng input (prompt)

> **Nguyên tắc vàng:**  
> *"AI giỏi hay dở phụ thuộc vào người sử dụng nó."*  
> Một Tester giỏi + AI = năng suất ×3  
> Một Tester không đánh giá được output + AI = bug ×3

---

### 1.4 Tư duy Mindset — 4 nguyên tắc vàng

| Nguyên tắc | Áp dụng trong thực tế |
|-----------|----------------------|
| **1. AI là công cụ, không phải "thần tháp từ"** | Luôn review output trước khi sử dụng |
| **2. Hoài nghi lành mạnh** | Đặt câu hỏi: "AI có thể sai ở đâu?" |
| **3. Biểu đạt mục tiêu rõ ràng** | Viết prompt với context cụ thể, không chung chung |
| **4. Học liên tục** | AI thay đổi nhanh — cập nhật kỹ năng thường xuyên |

---

## PHẦN 2 — THỰC HÀNH (120 phút)

### 🔬 Lab 2.1 — Prompt đầu tiên của bạn (30 phút)

**Công cụ:** ChatGPT (free) hoặc Claude.ai (free tier)

**Bước thực hành:**

1. Mở [ChatGPT](https://chat.openai.com) hoặc [Claude.ai](https://claude.ai)
2. Copy prompt mẫu sau vào công cụ:

```
Tôi là QA Tester cho một ứng dụng e-commerce.
Chức năng cần test: "Người dùng đăng nhập bằng email và mật khẩu"

Hãy tạo cho tôi 5 test case cơ bản bao gồm:
positive case, negative case, và boundary case.

Format: STT | Tên test case | Điều kiện | Bước thực hiện | Kết quả mong đợi
```

3. Chạy prompt và đọc kết quả
4. Trả lời các câu hỏi trong Checkpoint bên dưới

---

### ✅ HANDS-ON CHECKPOINT 1: Đánh giá output đầu tiên

> **Thời gian:** 10 phút cá nhân → 5 phút thảo luận cặp (2 người)

**Câu hỏi đánh giá:**

1. AI tạo được bao nhiêu test case? Có đủ 5 không?
2. Có test case nào bạn thấy **THIẾU** hoặc **SAI** so với yêu cầu thực tế?
3. Format trả về có đúng với yêu cầu trong prompt của bạn không?
4. Nếu bạn là QA Lead review output này, bạn sẽ yêu cầu chỉnh sửa gì?

> 💬 **Thảo luận:** So sánh output với bạn ngồi cạnh — 2 người dùng cùng 1 prompt có output giống nhau không?

---

### 🔬 Lab 2.2 — Phát hiện Hallucination (30 phút)

**Mục tiêu:** Tập thói quen phát hiện khi AI đang "bịa" thông tin.

**Prompt có bẫy:**

```
Hãy mô tả cách hoạt động của tính năng TestFlowX 
trong framework Selenium 5.2
```

**Bước thực hành:**

1. Chạy prompt trên
2. Đọc kết quả AI trả về
3. Tìm kiếm trên Google: "Selenium 5.2" và "TestFlowX"
4. Ghi lại: AI có hallucinate không? Ở đâu?

---

### 💡 TÌNH HUỐNG THỰC TẾ 1: "Output đẹp mà sai"

> **Role:** Bạn là QA Tester cho dự án ngân hàng

**Bối cảnh:**  
Bạn dùng AI sinh test case cho tính năng "Chuyển tiền nội địa". AI trả về 10 test case trông, hợp lệ, được format đẹp.

Sau khi execute, QA Lead phát hiện: AI **không cover trường hợp "số dư tài khoản nguồn = 0"**. Lỗi này vượt qua UAT và ra production, gây mất dữ liệu giao dịch.

**Câu hỏi thảo luận:**
1. Ai chịu trách nhiệm — AI hay Tester?
2. Bước nào trong quy trình có thể ngăn chặn vấn đề này?
3. Mindset nào cần thay đổi?

---

### 🔬 Lab 2.3 — Phân loại công việc (20 phút)

> **Làm việc nhóm:** 4–5 người · Thời gian: 20 phút

**Nhiệm vụ:** Phân loại 10 công việc QA sau vào 3 nhóm:

| Công việc QA | AI tốt ✅ | AI hỗ trợ ⚠️ | Không dùng AI ❌ |
|-------------|----------|------------|----------------|
| Viết test case từ user story | | | |
| Quyết định release có an toàn không | | | |
| Tạo 500 dòng test data với quy tắc phức tạp | | | |
| Hiểu business logic của hệ thống kế toán | | | |
| Viết script Selenium cơ bản | | | |
| Phân tích root cause của một bug khó | | | |
| Tóm tắt 200 bug report thành báo cáo | | | |
| Review thiết kế UI có thỏa mãn UX không | | | |
| Tạo API test với Postman | | | |
| Quyết định ưu tiên test case nào trước | | | |

---

## PHẦN 3 — KIỂM TRA HIỂU BÀI (20 phút)

### 📋 SCENARIO-BASED ASSESSMENT

#### Scenario A — "Junior tester mới đi làm"

> **Thời gian:** 10 phút cá nhân → 10 phút chia sẻ toàn lớp

**Bối cảnh:**  
Minh là Junior Tester mới vào dự án. Leader giao cho viết test plan cho module "Quản lý đơn hàng". Minh dùng ChatGPT, nhập:

```
Viết test plan cho quản lý đơn hàng
```

Và copy nguyên kết quả gửi lên.

**Câu hỏi:**
1. Mindset của Minh có gì sai? *(Liệt kê ít nhất 2 điểm)*
2. Output của AI có thể thiếu gì mà Minh không biết?
3. Nếu bạn là QA Lead, bạn sẽ feedback gì cho Minh?
4. Viết lại prompt tốt hơn cho tình huống này.

---

#### Scenario B — "Automation Tester dùng Copilot"

**Bối cảnh:**  
Lan là Automation Tester. Cô dùng GitHub Copilot để viết Selenium script cho login page. Copilot gợi ý một hàm `checkLogin()` trông ổn, Lan accept ngay và push lên repo. Trong code review, đồng nghiệp phát hiện hàm này **không xử lý trường hợp session timeout**.

**Câu hỏi:**
1. Lan đã vi phạm nguyên tắc Mindset nào?
2. Rủi ro gì có thể xảy ra nếu code này ra production?
3. Quy trình nên thêm bước nào để tránh tình huống này?

---

## 📝 RECAP — 5 điểm chính Session 1

1. ✅ **GenAI là công cụ mạnh nhưng có giới hạn** — luôn review output
2. ✅ **Mô hình 3 vòng tròn:** Mindset > Technique > Context là nền tảng toàn khóa
3. ✅ **LLM có thể hallucinate** — không tin tuyệt đối bất kỳ output nào
4. ✅ **Phân loại đúng công việc:** AI giỏi ở "tạo" nhưng yếu ở "quyết định"
5. ✅ **Tester + AI = sức mạnh**, nhưng Tester vẫn phải là người chỉ huy

---

## 🗒️ QUICK REFERENCE — Cheat Sheet Session 1

```
ChatGPT free : https://chat.openai.com
Claude free  : https://claude.ai

Hallucination check: Luôn Google xác nhận thông tin quan trọng

Prompt cơ bản:
  [Vai trò] + [Bối cảnh] + [Nhiệm vụ] + [Format mong muốn]

3 câu hỏi review output:
  1. AI có thể sai ở đâu?
  2. AI bỏ sót gì?
  3. Tôi cần thêm context gì để output tốt hơn?
```

---

## 📚 Bài tập về nhà

> Dùng AI sinh **10 test case** cho 1 tính năng bạn đang test thực tế.  
> Đánh giá output theo 3 câu hỏi trong Cheat Sheet.  
> Ghi lại: AI giúp được gì? Bỏ sót gì?

---

*⬅️ [README](../index.md) · ➡️ [Session 2 — Technique](./session-02-technique.md)*
