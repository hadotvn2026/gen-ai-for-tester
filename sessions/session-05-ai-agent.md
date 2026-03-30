# Session 5 — AI Agent: Từ trợ lý đến Tester tự động

> **Nguyên tắc:** 🔵 AI AGENT  
> **Thời lượng:** 3 giờ · Lý thuyết: 70 phút · Thực hành: 110 phút · Kiểm tra: 20 phút  
> **Prerequisite:** [Session 4 — Skill Building](./session-04-skill-building.md)

---

## 🎯 Mục tiêu buổi học

Sau session này, học viên có thể:

- [ ] Giải thích AI Agent là gì và khác ChatGPT thông thường như thế nào
- [ ] Mô tả 3 thành phần cốt lõi của Agent: Tools, Memory, Planning
- [ ] Phân biệt rõ AI Agent (đơn lẻ) và Agentic AI (hệ thống)
- [ ] Thiết kế và chạy một QA Agent đơn giản tự động thực hiện nhiệm vụ
- [ ] Áp dụng nguyên tắc "human-in-the-loop" vào thiết kế Agent

---

## PHẦN 1 — LÝ THUYẾT (70 phút)

### 1.1 AI Agent là gì? Khác ChatGPT như thế nào?

| ChatGPT / Claude thông thường | AI Agent |
|------------------------------|---------|
| Trả lời câu hỏi — 1 lượt | Lập kế hoạch — thực hiện nhiều bước liên tiếp |
| Không hành động được | Có thể mở browser, gọi API, đọc file, viết code |
| Không nhớ giữa session | Có thể lưu trạng thái và tiếp tục sau khi dừng |
| Người dùng phải "cầm tay chỉ việc" | Agent tự quyết định bước tiếp theo |
| *"Viết test case cho login"* | *"Chạy hết regression suite và báo cáo kết quả"* |

---

### 1.2 Ba thành phần cốt lõi của Agent

#### 🔧 TOOLS — Công cụ Agent có thể dùng

```
Web browser    → Truy cập URL, click, điền form, chụp màn hình
Code runner    → Viết và chạy code Python/JS/Java
File I/O       → Đọc, viết, xử lý file (CSV, JSON, Excel)
API caller     → Gọi REST API, xử lý response
Test framework → Chạy Selenium, Playwright, Postman collections
Reporting      → Tạo HTML/PDF report từ kết quả test
```

#### 🧠 MEMORY — Trí nhớ của Agent

```
Short-term (trong session):
  Agent nhớ các bước trước đó trong cuộc hội thoại hiện tại

Long-term (ngoài session):
  Lưu vào file, database, hoặc vector store để dùng lại

Ví dụ QA: Agent lưu biết "lỗi này đã gặp trong sprint 12,
           đã fix theo cách X nhưng reopen ở sprint 15"
```

#### 🗺️ PLANNING — Khả năng lập kế hoạch

```
Agent chia nhiệm vụ lớn thành các bước nhỏ
Tự quyết định bước tiếp theo dựa trên kết quả bước trước
Có thể "suy nghĩ lại" nếu gặp vấn đề

Ví dụ: Nhận nhiệm vụ "Test API checkout" →
  Bước 1: Đọc API spec
  Bước 2: Sinh test cases từ spec
  Bước 3: Chạy từng test case
  Bước 4: Log kết quả
  Bước 5: Tạo report
```

---

### 1.3 AI Agent vs Agentic AI — Điểm chuyển tiếp quan trọng

| AI Agent *(Session 5)* | Agentic AI / Multi-Agent *(Session 6)* |
|----------------------|--------------------------------------|
| 1 agent làm mọi thứ | Nhiều agent chuyên biệt phối hợp |
| Đơn giản, dễ setup | Phức tạp hơn, cần thiết kế hệ thống |
| Giống "1 nhân viên đa năng" | Giống "1 team QA có tổ chức" |
| Phù hợp: Task đơn lẻ, tự động hóa cơ bản | Phù hợp: QA pipeline phức tạp, nhiều người dùng |
| *1 agent chạy test + báo cáo* | *Agent A plan, B execute, C triage, D report* |

> **💡 Nguyên tắc vàng:**  
> *"AI Agent = một nhân viên thông minh làm việc độc lập"*  
> *"Agentic AI = một team có tổ chức với phân công rõ ràng"*  
> Hiểu AI Agent trước là nền tảng để xây dựng Agentic AI trong Session 6.

---

### 1.4 Human-in-the-Loop — Nguyên tắc an toàn

> ⚠️ **Quan trọng:** Agent KHÔNG được tự quyết định những việc quan trọng

```
✅ Agent có thể tự làm:
  - Chạy test cases tự động
  - Tạo test data theo quy tắc
  - Sinh bug report draft
  - Gửi thông báo kết quả

❌ Agent PHẢI chờ người duyệt:
  - Đóng bug (WONT FIX / duplicate)
  - Quyết định release
  - Thay đổi test plan
  - Xóa dữ liệu test
```

---

## PHẦN 2 — THỰC HÀNH (110 phút)

### 🔬 Lab 5.1 — Khám phá Claude.ai Agent mode (30 phút)

**Dùng Claude.ai** (có khả năng chạy code, tìm kiếm web):

```
Nhiệm vụ: Hãy làm những việc sau liên tiếp (không hỏi lại giữa chừng):

1. Tìm trên web: Top 5 bug tracking tools năm 2024
2. So sánh các tool đó theo: Giá, tính năng chính, phù hợp với team nhỏ hay lớn
3. Tạo bảng so sánh định dạng Markdown
4. Đề xuất tool phù hợp nhất cho team QA 5 người, dự án startup

Cuối cùng: Tóm tắt lý do chọn tool đó trong 3 câu.
```

**Quan sát và ghi lại:**
- Agent thực hiện mấy bước? Đúng thứ tự bạn mong đợi không?
- Ở bước nào Agent "tự quyết định" thêm việc bạn không yêu cầu?
- Kết quả cuối có đạt yêu cầu "đề xuất cụ thể" không?

---

### ✅ HANDS-ON CHECKPOINT 5: Quan sát hành vi Agent

> **So sánh:** Nếu bạn làm tay 4 bước trên, mất bao lâu?

| Hành động | Làm tay | Agent |
|-----------|---------|-------|
| Tìm kiếm top 5 tools | ~10 phút | ~30 giây |
| So sánh theo tiêu chí | ~20 phút | ~1 phút |
| Tạo bảng Markdown | ~10 phút | Tự động |
| Tổng hợp đề xuất | ~5 phút | Tự động |
| **Tổng** | **~45 phút** | **~2 phút** |

> 🎯 **Điểm quan trọng:** Tiết kiệm thời gian ≠ loại bỏ con người. Bạn vẫn cần review kết quả.

---

### 🔬 Lab 5.2 — Thiết kế QA Agent đầu tiên (50 phút)

**Mục tiêu:** Xây dựng Agent tự động hóa quy trình: Nhận User Story → Tạo test cases → Log kết quả

**Viết system prompt cho QA Agent:**

```
Bạn là QA Automation Agent. Khi nhận được User Story, bạn sẽ thực hiện
các bước sau theo thứ tự, báo cáo kết quả mỗi bước trước khi tiếp tục:

═══ BƯỚC 1 — PHÂN TÍCH ═══
- Đọc User Story và xác định acceptance criteria
- Liệt kê các rủi ro kiểm thử chính (ít nhất 3)
- Xác nhận: Có đủ thông tin để tạo test cases không?
  → Nếu KHÔNG: Liệt kê thông tin cần bổ sung và DỪNG LẠI, chờ input

═══ BƯỚC 2 — TẠO TEST CASES ═══
- Tạo test cases đầy đủ (dùng Context Card từ dự án)
- Xếp loại: P1 Critical / P2 High / P3 Medium
- Minimum: 8 test cases, bao gồm edge cases

═══ BƯỚC 3 — TẠO SCRIPT (chỉ cho P1) ═══
- Viết Selenium test script cho P1 test cases
- Áp dụng: POM, Explicit Wait, Assert rõ ràng
- DỪNG LẠI và chờ review trước khi bước tiếp theo

═══ BƯỚC 4 — TÓM TẮT ═══
- Tổng số test cases: [X]
- Coverage: [Tính năng nào được test]
- Rủi ro còn lại: [Gì chưa được test và tại sao]
- Đề xuất: Ready to test / Cần thêm thông tin

RÀNG BUỘC QUAN TRỌNG:
- Luôn báo cáo kết quả từng bước
- Hỏi xác nhận trước mỗi bước có rủi ro cao
- KHÔNG tự quyết định bỏ qua bất kỳ test case quan trọng nào
```

**Test:** Paste 1 User Story thực tế và quan sát Agent hoạt động.

---

### 💡 TÌNH HUỐNG THỰC TẾ 5: "Agent làm quá nhiều"

**Bối cảnh:**  
Linh là QA Lead. Cô cấu hình Agent tự động hóa toàn bộ quy trình kiểm thử.  
Agent được quyền: Đọc requirement, tạo test case, chạy test, và **TỰ ĐỘNG MARK BUG LÀ "WONT FIX"**.

Sau 1 tuần, team phát hiện: Agent đã tự động đóng **15 bug quan trọng** mà chưa ai review. Một bug liên quan đến bảo mật thanh toán đã bị đóng với lý do *"expected behavior"*.

**Câu hỏi:**
1. Điểm nào trong việc cấu hình Agent bị sai?
2. Những hành động nào AI Agent **KHÔNG NÊN** tự động làm trong QA?
3. Nguyên tắc "human-in-the-loop" nghĩa là gì trong tình huống này?
4. Thiết kế lại phân quyền Agent cho an toàn hơn.

---

### 🔬 Lab 5.3 — Tự động hóa Bug Report với Agent (20 phút)

```
Tôi sẽ cung cấp cho bạn mô tả lỗi và error log.
Bạn hãy tự động thực hiện:

1. Phân tích lỗi là gì (frontend / backend / data / network)
2. Viết bug report đầy đủ:
   - Tiêu đề: [Module] - [Vấn đề ngắn gọn]
   - Severity & Priority với lý do
   - Steps to Reproduce (đánh số, cụ thể)
   - Actual vs Expected result
   - Environment info cần có
3. Gợi ý: Test case nào cần viết thêm để catch bug này trong tương lai
4. Đánh giá: Lỗi này ảnh hưởng đến tính năng nào khác?

[Paste error log hoặc mô tả lỗi của bạn vào đây]
```

> **Thực hành:** Mỗi học viên paste 1 bug thực tế từ dự án và xem Agent xử lý.

---

## PHẦN 3 — KIỂM TRA HIỂU BÀI (20 phút)

### 📋 SCENARIO-BASED ASSESSMENT: "Thiết kế Agent cho dự án của bạn"

> **Đây là bài kiểm tra thiết kế — không có câu trả lời "đúng / sai" tuyệt đối**  
> **Thời gian:** 10 phút cá nhân → 3 phút trình bày trước lớp

**Nhiệm vụ:** Thiết kế 1 AI Agent phù hợp với dự án thực tế của bạn.

**Phải trả lời được:**

```
1. VẤNĐỀ: Agent này giải quyết vấn đề gì cụ thể?
   (Không nói chung chung — phải là pain point thực tế)

2. TOOLS: Agent cần những tools gì?
   □ Web browser    □ Code runner    □ File I/O
   □ API caller     □ Test framework  □ Reporting

3. MEMORY: Agent cần nhớ gì?
   □ Short-term (trong session)
   □ Long-term (lưu ra file/DB)
   → Cụ thể: Nhớ gì? Để làm gì?

4. TỰ ĐỘNG: Những hành động nào Agent được làm tự động?

5. CHỜ DUYỆT: Những hành động nào PHẢI có người duyệt trước?

6. THỰC TẾ: Agent này có thể build trong 1–2 tuần không?
```

---

## 📝 RECAP — 5 điểm chính Session 5

1. ✅ **Agent = AI có khả năng hành động:** dùng Tool, có Memory, tự Planning
2. ✅ **Khác ChatGPT:** Agent tự thực hiện nhiều bước liên tiếp, không cần người "cầm tay"
3. ✅ **AI Agent (1 agent) là bước đến Agentic AI (nhiều agent phối hợp)** trong Session 6
4. ✅ **Human-in-the-loop:** Agent KHÔNG được tự quyết định việc quan trọng (close bug, release)
5. ✅ **Giá trị:** Agent giảm 80% công việc lặp đi lặp lại, để Tester tập trung phân tích

---

## 🗒️ QUICK REFERENCE — Cheat Sheet Session 5

```
Agent tools QA hay dùng:
  web search | code execution | file read/write | API call

Memory ngắn hạn : Trong session (context window)
Memory dài hạn  : Lưu ra file JSON / Markdown / database

Human-in-the-loop: Thêm vào prompt:
  "Trước khi thực hiện [hành động X], hãy hỏi tôi xác nhận"

Công cụ thử nghiệm:
  → Claude.ai (có tools miễn phí)
  → ChatGPT Plus (có Code Interpreter)
  → Cursor IDE (Copilot nâng cao)
```

---

## 📚 Bài tập về nhà

> Viết **system prompt cho 1 Agent** giải quyết 1 pain point cụ thể trong công việc hiện tại.  
> Chạy thử và ghi lại: Agent làm được gì? Cần cải thiện gì?

---

*⬅️ [Session 4 — Skill Building](./session-04-skill-building.md) · ➡️ [Session 6 — Agentic AI](./session-06-agentic-ai.md)*
