# Session 1 — Mindset: AI là Co-Pilot của bạn

> Bạn sẽ hiểu GenAI hoạt động như thế nào, tại sao nó quan trọng với công việc QA, và cách giữ tư duy đúng đắn để không bị "lừa" bởi output trông đẹp nhưng sai. Đây là nền tảng tư duy cho toàn bộ khóa học.

## ✅ Mục tiêu — Sau session này bạn có thể

- [ ] Giải thích GenAI là gì và LLM hoạt động như thế nào (không cần toán học)
- [ ] Phân biệt được khả năng và giới hạn của AI trong kiểm thử
- [ ] Áp dụng tư duy "hoài nghi lành mạnh" khi đánh giá output AI
- [ ] Phân loại được công việc nào nên / không nên giao cho AI
- [ ] Tự chạy prompt đầu tiên và đánh giá kết quả

---

## PHẦN 1 — LÝ THUYẾT

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

> **💡 Lưu ý:** Ba nguyên tắc này sẽ xuất hiện xuyên suốt mọi session. Khi bạn thấy AI cho output kém, hãy tự hỏi: mình đang thiếu nguyên tắc nào trong 3 cái này?

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

### 📺 Video tham khảo — LLM hoạt động như thế nào?

> **"Intro to Large Language Models"** — Andrej Karpathy (ex-OpenAI) · 1 giờ · Tiếng Anh

<iframe width="100%" height="380" src="https://www.youtube.com/embed/zjkBMFhNj_g" title="Intro to Large Language Models - Andrej Karpathy" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

> Bài giảng nền tảng nhất về LLM: cách hoạt động, hallucination, tool use, và bảo mật. Không cần nền toán học — phù hợp cho mọi cấp độ.

---

### 1.4 Tư duy Mindset — 4 nguyên tắc vàng

| Nguyên tắc | Áp dụng trong thực tế |
|-----------|----------------------|
| **1. AI là công cụ, không phải "thần tháp từ"** | Luôn review output trước khi sử dụng |
| **2. Hoài nghi lành mạnh** | Đặt câu hỏi: "AI có thể sai ở đâu?" |
| **3. Biểu đạt mục tiêu rõ ràng** | Viết prompt với context cụ thể, không chung chung |
| **4. Học liên tục** | AI thay đổi nhanh — cập nhật kỹ năng thường xuyên |

---

## PHẦN 2 — THỰC HÀNH

### 🛠️ Bài tập 1.1 — Prompt đầu tiên của bạn

> **Thời gian ước tính:** 20 phút | **Công cụ:** ChatGPT hoặc Claude.ai

**Bước 1:** Mở [ChatGPT](https://chat.openai.com) hoặc [Claude.ai](https://claude.ai) — tài khoản free là đủ.

**Bước 2:** Copy và chạy prompt mẫu sau:

```
Tôi là QA Tester cho một ứng dụng e-commerce.
Chức năng cần test: "Người dùng đăng nhập bằng email và mật khẩu"

Hãy tạo cho tôi 5 test case cơ bản bao gồm:
positive case, negative case, và boundary case.

Format: STT | Tên test case | Điều kiện | Bước thực hiện | Kết quả mong đợi
```

**Bước 3:** Đọc kỹ output AI trả về. Đừng copy ngay — hãy đọc từng dòng.

**Bước 4:** Trả lời 4 câu hỏi tự kiểm tra bên dưới vào notes của bạn.

**✅ Kết quả mong đợi:**
> AI trả về bảng 5 dòng với đủ các loại test case — ví dụ: đăng nhập thành công (positive), sai mật khẩu (negative), email rỗng (boundary). Format đúng với yêu cầu trong prompt. Bạn có thể thấy AI tạo ra test case trông hợp lý — nhưng nhiệm vụ của bạn là kiểm tra xem có thiếu gì không.

**❓ Tự kiểm tra:**
- [ ] AI tạo được đủ 5 test case không?
- [ ] Có test case nào bạn thấy THIẾU hoặc SAI so với yêu cầu thực tế?
- [ ] Format trả về có đúng với yêu cầu trong prompt không?
- [ ] Nếu bạn là QA Lead review output này, bạn sẽ yêu cầu chỉnh sửa gì?

💡 **Gợi ý khi bị kẹt:** Nếu AI trả về ít hơn 5 test case hoặc format sai, thử thêm vào cuối prompt: *"Hãy đảm bảo đủ 5 test case, và trả về đúng format bảng Markdown tôi yêu cầu."*

---

### 🛠️ Bài tập 1.2 — Phát hiện Hallucination

> **Thời gian ước tính:** 20 phút | **Công cụ:** ChatGPT hoặc Claude.ai + Google

**Bước 1:** Copy và chạy prompt bẫy sau vào AI:

```
Hãy mô tả cách hoạt động của tính năng TestFlowX
trong framework Selenium 5.2
```

**Bước 2:** Đọc kết quả AI trả về. Ghi lại những gì AI nói về "TestFlowX" và "Selenium 5.2".

**Bước 3:** Mở Google và tìm kiếm: `"Selenium 5.2"` và `"TestFlowX"`.

**Bước 4:** So sánh kết quả Google với những gì AI mô tả. Ghi lại nhận xét vào notes.

**✅ Kết quả mong đợi:**
> "TestFlowX" không tồn tại, và "Selenium 5.2" là phiên bản không có thực tại thời điểm này. AI có thể trả về một mô tả trông rất tự tin và có vẻ hợp lý — đây chính là hallucination điển hình. Kết quả Google sẽ không tìm thấy thông tin khớp với những gì AI mô tả.

**❓ Tự kiểm tra:**
- [ ] AI có tự tin mô tả các tính năng không tồn tại không?
- [ ] Bạn có thể nhận ra hallucination nếu không kiểm tra Google không?
- [ ] Đây là loại rủi ro gì trong công việc QA thực tế?

💡 **Gợi ý khi bị kẹt:** Nếu AI từ chối hoặc nói "tôi không chắc" — đó là tín hiệu tốt! Nghĩa là model đó được huấn luyện cẩn thận hơn. Hãy thử cùng prompt trên model khác để so sánh.

---

### 🛠️ Bài tập 1.3 — Phân loại công việc QA

> **Thời gian ước tính:** 15 phút | **Công cụ:** Notes cá nhân

**Bước 1:** Đọc danh sách 10 công việc QA bên dưới.

**Bước 2:** Tự phân loại từng công việc vào 3 nhóm dựa trên hiểu biết của bạn sau khi đọc phần lý thuyết.

**Bước 3:** Viết lý do ngắn gọn cho mỗi lựa chọn của bạn (1 câu là đủ).

| Công việc QA | AI tốt ✅ | AI hỗ trợ ⚠️ | Không dùng AI ❌ |
|-------------|:--------:|:----------:|:--------------:|
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

**✅ Kết quả mong đợi:**
> Nhóm "AI tốt" thường là các tác vụ tạo nội dung có quy tắc rõ ràng (test case từ user story, test data, tóm tắt). Nhóm "Không dùng AI" thường là các quyết định cần hiểu sâu business hoặc chịu trách nhiệm chuyên môn (quyết định release, hiểu business logic đặc thù). Nhóm "AI hỗ trợ" là ở giữa — AI giúp được một phần nhưng Tester vẫn phải phán xét cuối cùng.

**❓ Tự kiểm tra:**
- [ ] Bạn có thể giải thích lý do phân loại cho ít nhất 5 công việc không?
- [ ] Có công việc nào bạn cảm thấy "không chắc" về cách phân loại không? Ghi lại để tra cứu sau.

---

## PHẦN 3 — TỰ ĐÁNH GIÁ

### 📋 Scenario A — "Junior tester mới đi làm"

**Bối cảnh:**
Minh là Junior Tester mới vào dự án. Leader giao cho viết test plan cho module "Quản lý đơn hàng". Minh dùng ChatGPT, nhập:

```
Viết test plan cho quản lý đơn hàng
```

Và copy nguyên kết quả gửi lên.

**Bài tập:** Ghi lại câu trả lời của bạn vào notes — không có đáp án duy nhất, miễn là bạn có thể giải thích lý do.

1. Mindset của Minh có gì sai? *(Liệt kê ít nhất 2 điểm)*
2. Output của AI có thể thiếu gì mà Minh không biết?
3. Nếu bạn là QA Lead, bạn sẽ feedback gì cho Minh?
4. Viết lại prompt tốt hơn cho tình huống này.

💡 **Gợi ý khi bị kẹt:** Nghĩ về những gì AI không thể biết: hệ thống của dự án dùng công nghệ gì? Business rule nào đặc thù? User là ai?

---

### 📋 Scenario B — "Automation Tester dùng Copilot"

**Bối cảnh:**
Lan là Automation Tester. Cô dùng GitHub Copilot để viết Selenium script cho login page. Copilot gợi ý một hàm `checkLogin()` trông ổn, Lan accept ngay và push lên repo. Trong code review, đồng nghiệp phát hiện hàm này **không xử lý trường hợp session timeout**.

**Bài tập:** Ghi lại câu trả lời của bạn vào notes — không có đáp án duy nhất, miễn là bạn có thể giải thích lý do.

1. Lan đã vi phạm nguyên tắc Mindset nào?
2. Rủi ro gì có thể xảy ra nếu code này ra production?
3. Quy trình nên thêm bước nào để tránh tình huống này?

💡 **Gợi ý khi bị kẹt:** Nhớ lại nguyên tắc "hoài nghi lành mạnh" — áp dụng cho code cũng giống như test case.

---

### 💡 TÌNH HUỐNG THỰC TẾ: "Output đẹp mà sai"

> **Role:** Bạn là QA Tester cho dự án ngân hàng

**Bối cảnh:**
Bạn dùng AI sinh test case cho tính năng "Chuyển tiền nội địa". AI trả về 10 test case trông hợp lệ, được format đẹp.

Sau khi execute, QA Lead phát hiện: AI **không cover trường hợp "số dư tài khoản nguồn = 0"**. Lỗi này vượt qua UAT và ra production, gây mất dữ liệu giao dịch.

**Bài tập:** Ghi lại câu trả lời của bạn vào notes — không có đáp án duy nhất, miễn là bạn có thể giải thích lý do.

1. Ai chịu trách nhiệm — AI hay Tester?
2. Bước nào trong quy trình có thể ngăn chặn vấn đề này?
3. Mindset nào cần thay đổi?

---

## 📝 Tổng kết

1. ✅ **GenAI là công cụ mạnh nhưng có giới hạn** — luôn review output
2. ✅ **Mô hình 3 vòng tròn:** Mindset > Technique > Context là nền tảng toàn khóa
3. ✅ **LLM có thể hallucinate** — không tin tuyệt đối bất kỳ output nào
4. ✅ **Phân loại đúng công việc:** AI giỏi ở "tạo" nhưng yếu ở "quyết định"
5. ✅ **Tester + AI = sức mạnh**, nhưng Tester vẫn phải là người chỉ huy

---

## 🗒️ Cheat Sheet

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
