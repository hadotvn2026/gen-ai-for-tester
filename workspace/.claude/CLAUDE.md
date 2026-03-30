# GenAI for Testers — Workspace Context

## Dự án này là gì?
Workspace thực hành cho khóa học "Generative AI for Testers".
Mục tiêu: áp dụng AI vào workflow kiểm thử phần mềm thực tế.

## Cấu trúc workspace
- `prompt-library/` — Prompt cá nhân/team tích lũy theo thời gian
- `context-cards/` — Context Card mô tả dự án thực tế của bạn
- `session-artifacts/` — Output từ từng session (notes, templates đã điền)
- `playwright-tests/` — Automation test scripts (Session 4 trở đi)

## Quy tắc làm việc với AI
1. Luôn cung cấp context rõ ràng (role, dự án, tech stack)
2. Review kỹ output trước khi dùng — AI có thể bịa thông tin
3. Lưu prompt hiệu quả vào `prompt-library/my-prompts.md`
4. Không paste thông tin nhạy cảm (password, API key, data sản xuất) vào AI

## Tech stack (điền theo dự án thực tế của bạn)
- App under test: [URL hoặc mô tả]
- Frontend: [React / Angular / Vue / ...]
- Backend: [Node / Java / Python / ...]
- Test framework: Playwright (TypeScript)
- CI/CD: [GitHub Actions / GitLab CI / Jenkins / ...]
- Test management: [Jira / TestRail / ...]

## MCP Servers đã cài
- **Jira**: tích hợp Jira để tạo/update issue từ Claude Code
- **Playwright**: chạy test, lấy kết quả từ Claude Code

## Cách dùng Claude Code trong workspace này
```bash
# Chạy từ thư mục workspace/
claude

# Ví dụ câu lệnh hay dùng
# "Generate Playwright test cho login page"
# "Tạo Jira bug report từ test failure này"
# "Review file playwright-tests/tests/login.spec.ts và suggest improvements"
```
