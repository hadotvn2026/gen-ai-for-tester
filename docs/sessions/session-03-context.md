# Session 3 — Context: Biến AI hiểu dự án của bạn

> **Nguyên tắc:** 🔴 CONTEXT  
> **Thời lượng:** 3 giờ · Lý thuyết: 60 phút · Thực hành: 120 phút · Kiểm tra: 20 phút  
> **Prerequisite:** [Session 2 — Technique](./session-02-technique.md)

---

## 🎯 Mục tiêu buổi học

Sau session này, học viên có thể:

- [ ] Giải thích tại sao Context là "mảnh ghép cuối" để AI cho output có giá trị
- [ ] Áp dụng nguyên tắc GIGO vào việc chuẩn bị prompt
- [ ] Inject context dự án vào prompt một cách hiệu quả
- [ ] Hiểu khái niệm RAG và Fine-tuning ở mức ứng dụng (không cần code)
- [ ] Tạo Context Card cá nhân cho dự án đang làm

---

## PHẦN 1 — LÝ THUYẾT (60 phút)

### 1.1 Tại sao Context là nguyên tắc quan trọng nhất?

Sau khi học Mindset và Technique, nhiều Tester vẫn thấy AI trả về kết quả quá chung chung. Lý do chính: **THIẾU BỐI CẢNH**.

| Prompt thiếu context | Prompt đủ context |
|---------------------|-----------------|
| *"Tạo test case cho đăng nhập"* | *"Tạo test case cho chức năng SSO login của ứng dụng quản lý kho B2B, user là warehouse manager, hệ thống tích hợp với Active Directory"* |
| **Kết quả:** Generic, có thể dùng cho bất kỳ app nào | **Kết quả:** Cụ thể, cover đúng rủi ro thực tế của dự án |

---

### Quy tắc GIGO (Garbage In, Garbage Out)

```
┌─────────────────────────────────────────────────────────┐
│                                                         │
│  Prompt chung chung  →  Output nông cạn, vô dụng        │
│                                                         │
│  Prompt + Context    →  Output sâu, sát thực tế         │
│                                                         │
│       "Rác vào = Rác ra"  (GIGO)                        │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

> **Nguyên tắc:** Context tốt = Dữ liệu đầu vào tốt = Output giá trị cao

---

### 1.2 Năm loại Context cần cung cấp cho AI

| Loại Context | Ví dụ cụ thể cho QA |
|-------------|-------------------|
| **Business domain** | Hệ thống ngân hàng / y tế / thương mại điện tử / logistics |
| **User persona** | Người dùng là ai, trình độ công nghệ, thói quen sử dụng |
| **Kỹ thuật / Công nghệ** | React frontend, Java Spring Boot, PostgreSQL, REST API |
| **Quy tắc nghiệp vụ** | Số tiền chuyển tối đa 500 triệu/ngày, thẻ hết hạn tự động hủy |
| **Lịch sử bug / Rủi ro** | Module thanh toán hay lỗi khi concurrent user > 100 |

---

### 1.3 RAG và Fine-tuning — Giải thích cho non-tech

**RAG (Retrieval-Augmented Generation):**  
AI được cung cấp tài liệu cụ thể **TRƯỚC KHI** trả lời. Giống như bạn cho nhân viên đọc tài liệu nội bộ trước khi làm việc.

**Fine-tuning:**  
"Huấn luyện lại" AI với dữ liệu của công ty. Phức tạp hơn, cần kỹ thuật, nhưng kết quả rất đặc thù. Phù hợp khi có nhiều tài liệu nội bộ.

| Phương pháp | Độ khó | Khi nào dùng |
|------------|--------|-------------|
| **Context injection** *(Session này)* | Dễ — chỉ cần copy-paste | Ngay lập tức, mọi dự án |
| **RAG** | Trung bình — cần setup | Có nhiều tài liệu nội bộ (> 50 trang) |
| **Fine-tuning** | Khó — cần kỹ thuật AI | Khi cần AI hiểu sâu nghiệp vụ đặc thù |

---

## PHẦN 2 — THỰC HÀNH (120 phút)

### 🔬 Lab 3.1 — Context Injection với tài liệu thực tế (40 phút)

**Bước thực hành:**

**Bước 1:** Chọn 1 trong các tài liệu sau (hoặc dùng tài liệu dự án thực tế của bạn):
- User story / Acceptance criteria
- API documentation (Swagger/Postman)
- Business requirement document (BRD)

**Bước 2:** Copy nội dung tài liệu vào prompt theo template:

```
=== CONTEXT ===
[Paste nội dung tài liệu vào đây — tối đa 2000 ký tự]
=== HẾT CONTEXT ===

Dựa trên tài liệu trên, hãy:
1. Xác định 5 rủi ro kiểm thử chính
2. Tạo 10 test case ưu tiên cao nhất
3. Đề xuất test data cần chuẩn bị
```

**Bước 3:** So sánh với kết quả khi **KHÔNG có context** (từ Session 1).

---

### ✅ HANDS-ON CHECKPOINT 3: So sánh chất lượng output

> **Bảng đánh giá** (chấm điểm 1–5 cho mỗi tiêu chí):

| Tiêu chí | Không context | Có context | Cải thiện |
|---------|:-------------:|:----------:|:---------:|
| Độ cụ thể (sát business domain?) | ___/5 | ___/5 | +___% |
| Khả năng dùng ngay (cần sửa nhiều không?) | ___/5 | ___/5 | +___% |
| Coverage (cover đúng rủi ro đặc thù?) | ___/5 | ___/5 | +___% |

> 💬 **Chia sẻ** bảng đánh giá lên Zoom chat — trainer sẽ tổng hợp real-time.

---

### 🔬 Lab 3.2 — Domain-Specific Test Data (40 phút)

**Vấn đề:** Test data chung chung không cover được đặc thù domain.

**Ví dụ — Hệ thống ngân hàng Việt Nam:**

```
❌ Prompt thiếu context:
"Tạo test data cho hệ thống ngân hàng"
→ AI tạo: tên = "John Doe", số tài khoản = "123456" (vô nghĩa)

✅ Prompt đủ context:
"Tạo test data cho hệ thống ngân hàng Việt Nam theo quy định SBV.
Yêu cầu:
- Số tài khoản: 14 chữ số, bắt đầu bằng mã ngân hàng (VCB: 0070, TCB: 019)
- Số CMND/CCCD: 9 hoặc 12 chữ số, khớp với tỉnh thành
- Số tiền: VND, không có số thập phân, tối thiểu 50,000 VND
- Tên khách hàng: tên Việt Nam có dấu, format Họ Tên đệm

Tạo 10 dòng data hợp lệ và 5 dòng data lỗi để test validation."
→ AI tạo dữ liệu thực tế, đúng chuẩn Việt Nam
```

**Nhiệm vụ thực hành — Chọn domain dự án của bạn:**

| Nhóm | Domain | Test data cần tạo |
|------|--------|------------------|
| **Nhóm 1** | E-commerce | Sản phẩm, giỏ hàng, voucher, vận chuyển |
| **Nhóm 2** | HR System | Nhân viên, lương, ngày phép, bảo hiểm |
| **Nhóm 3** | Healthcare | Bệnh nhân, lịch khám, đơn thuốc, BHYT |
| **Nhóm 4** | Logistics | Đơn hàng, tuyến đường, kho hàng, tài xế |
| **Nhóm 5** | Finance | Tài khoản, giao dịch, hạn mức, phí |

**Output mỗi nhóm:** 15 dòng data hợp lệ + 5 dòng edge case + 5 dòng data lỗi

---

### 💡 TÌNH HUỐNG THỰC TẾ 3: "Tài liệu quá dài, AI quên context"

**Bối cảnh:**  
Hương là QA Lead. Cô paste cả 50-trang BRD vào ChatGPT để sinh test plan. Khi hỏi đến module cuối, AI bắt đầu "quên" thông tin ở module đầu. Test plan tạo ra bị thiếu sót nhiều phần quan trọng.

**Câu hỏi:**
1. Nguyên nhân kỹ thuật là gì? *(Gợi ý: "context window")*
2. Chiến lược nào giúp xử lý tài liệu dài?
3. Nếu bạn là Hương, bạn sẽ làm gì khác đi?
4. Khi nào nên dùng RAG thay vì context injection?

> **Gợi ý giải:** ChatGPT ~128K token, Claude ~200K token (1 token ≈ 4 ký tự). Tài liệu 50 trang ≈ 75K+ token — đã gần limit. **Giải pháp:** Chia tài liệu theo module, xử lý từng phần riêng biệt, tổng hợp sau.

---

### 🔬 Lab 3.3 — Xây dựng Context Card cá nhân (20 phút)

Mỗi học viên tạo **Context Card** cho dự án mình đang làm. Lưu lại — dùng cho mọi prompt sau này.

```markdown
## Context Card — [Tên dự án]

### Domain
[Lĩnh vực: e-commerce / banking / healthcare / ...]

### Tech Stack
- Frontend: [React / Angular / Vue / ...]
- Backend: [Java Spring / Node.js / Python / ...]
- Database: [PostgreSQL / MySQL / MongoDB / ...]
- API: [REST / GraphQL / ...]

### User chính
- Vai trò: [Admin / End-user / Manager / ...]
- Trình độ công nghệ: [Cao / Trung bình / Thấp]
- Đặc điểm: [...]

### Business rules quan trọng
- [Quy tắc 1]
- [Quy tắc 2]
- [Quy tắc 3]

### Các loại lỗi hay gặp
- [Vấn đề 1]
- [Vấn đề 2]

### Đặc điểm dữ liệu
- Format số, ngày tháng, tiền tệ: [...]
- Giới hạn, ràng buộc: [...]
```

> **Gợi ý:** Lưu Context Card vào Notion / Git repo. Copy vào mọi prompt để output tốt hơn ngay lập tức.

---

## PHẦN 3 — KIỂM TRA HIỂU BÀI (20 phút)

### 📋 SCENARIO-BASED ASSESSMENT: "Context Detective"

> **Thời gian:** 10 phút cá nhân → 10 phút thảo luận nhóm

Dưới đây là 3 output AI tạo ra. Nhiệm vụ: **Phân tích context nào đã được cung cấp (hay thiếu)**.

---

**Output 1:**
```
Test case: Đăng nhập với email "user123@email.com", password "Test@1234"
Expected: Đăng nhập thành công
```
- Context nào có mặt? `_______________`
- Context nào đang thiếu? `_______________`
- Chất lượng: ___/10

---

**Output 2:**
```
Test case: Kiểm tra chuyển tiền với số tiền "1,000,000 VND"
Số tài khoản nguồn: "0070123456789012" (VCB)
Expected: Giao dịch thành công, số dư giảm đúng
```
- Context nào có mặt? `_______________`
- Tốt hơn Output 1 ở điểm nào? `_______________`
- Vẫn còn thiếu context gì? `_______________`

---

**Output 3:**
```
API Test: POST /api/v1/orders/cancel
Payload: {
  "orderId": "ORD-2024-001",
  "reason": "customer_request",
  "cancelledBy": "user_id_123"
}
Expected: 200 OK, order status = "cancelled"
```
- Context nào có mặt? `_______________`
- Còn thiếu context gì để test tốt hơn? `_______________`

---

## 📝 RECAP — 5 điểm chính Session 3

1. ✅ **Context = chất lượng output:** Thiếu context ⇒ output vô dụng
2. ✅ **5 loại context:** Domain, User, Tech, Business rules, Lịch sử lỗi
3. ✅ **GIGO:** Garbage In = Garbage Out — đây là nguyên tắc bất biến của AI
4. ✅ **RAG** dùng khi có nhiều tài liệu nội bộ; **Fine-tuning** khi cần AI "hiểu" sản phẩm
5. ✅ **Context Card** cho dự án — copy vào mỗi prompt để output tốt hơn ngay

---

## 🗒️ QUICK REFERENCE — Cheat Sheet Session 3

```
Template context:
  [Domain] + [User] + [Tech stack] + [Business rules] + [Constraints]

Gợi ý: Copy 1 đoạn từ BRD / AC vào prompt trước khi yêu cầu sinh test case

Context window limits:
  ChatGPT: ~128K token   Claude: ~200K token   (1 token ≈ 4 ký tự)

Tài liệu dài: Chia theo module, xử lý từng phần, tổng hợp sau

Context Card: Tạo 1 lần, dùng mãi mãi cho dự án của bạn
```

---

## 📚 Bài tập về nhà

> Tạo **Context Card** cho dự án hiện tại.  
> Test với 5 prompt khác nhau: So sánh output có/không có Context Card.  
> Đo lường: Tiết kiệm bao nhiêu thời gian chỉnh sửa output?

---

*⬅️ [Session 2 — Technique](./session-02-technique.md) · ➡️ [Session 4 — Skill Building](./session-04-skill-building.md)*
