# 📖 Hướng dẫn tạo Ebook từ Markdown & Host trên GitHub

---

## Tổng quan — 3 phương án

| Phương án | Công cụ | Kết quả | Độ khó | Chi phí |
|-----------|---------|---------|--------|---------|
| **A — GitHub Pages** | MkDocs / Docsify | Website đẹp, miễn phí | ⭐⭐ | Miễn phí |
| **B — PDF Ebook** | Pandoc + LaTeX | File PDF chuyên nghiệp | ⭐⭐⭐ | Miễn phí |
| **C — GitBook** | GitBook.com | Website + PDF tự động | ⭐ | Miễn phí (public) |

**Khuyến nghị:** Dùng **Phương án A (MkDocs)** — đẹp nhất, dễ nhất, miễn phí hoàn toàn.

---

## PHƯƠNG ÁN A — GitHub Pages với MkDocs (Khuyến nghị)

### Kết quả
Website documentation đẹp như trang chính thức, có search, navigation, dark mode.

**Ví dụ tham khảo:** https://squidfunk.github.io/mkdocs-material/

### Bước 1: Cài đặt

```bash
# Cài Python nếu chưa có: https://python.org
pip install mkdocs-material
```

### Bước 2: Cấu trúc thư mục

```
genai-for-testers/
├── docs/                        ← Copy toàn bộ .md vào đây
│   ├── index.md                 ← Copy từ README.md
│   ├── sessions/
│   │   ├── session-01.md
│   │   ├── session-02.md
│   │   └── ...
│   └── resources/
│       ├── prompt-library.md
│       └── cheat-sheets.md
└── mkdocs.yml                   ← File cấu hình (tạo mới)
```

### Bước 3: Tạo file mkdocs.yml

```yaml
site_name: Generative AI for Testers
site_description: Khóa học thực hành ứng dụng AI trong kiểm thử phần mềm
site_author: QA Automation Trainer
site_url: https://[USERNAME].github.io/genai-for-testers/

theme:
  name: material
  language: vi
  palette:
    - scheme: default
      primary: deep purple
      accent: teal
      toggle:
        icon: material/brightness-7
        name: Switch to dark mode
    - scheme: slate
      primary: deep purple
      accent: teal
      toggle:
        icon: material/brightness-4
        name: Switch to light mode
  features:
    - navigation.tabs
    - navigation.sections
    - navigation.top
    - search.suggest
    - search.highlight
    - content.code.copy

nav:
  - Tổng quan: index.md
  - Sessions:
    - 'Session 1 — Mindset': sessions/session-01.md
    - 'Session 2 — Technique': sessions/session-02.md
    - 'Session 3 — Context': sessions/session-03.md
    - 'Session 4 — Skill Building': sessions/session-04.md
    - 'Session 5 — AI Agent': sessions/session-05.md
    - 'Session 6 — Agentic AI': sessions/session-06.md
  - Resources:
    - 'Prompt Library': resources/prompt-library.md
    - 'Cheat Sheets': resources/cheat-sheets.md

markdown_extensions:
  - admonition
  - pymdownx.details
  - pymdownx.superfences
  - pymdownx.highlight:
      anchor_linenums: true
  - pymdownx.inlinehilite
  - pymdownx.tabbed:
      alternate_style: true
  - tables
  - attr_list
  - md_in_html

plugins:
  - search:
      lang: en
```

### Bước 4: Test local

```bash
cd genai-for-testers
mkdocs serve

# Mở: http://127.0.0.1:8000
```

### Bước 5: Deploy lên GitHub Pages

```bash
# Đẩy code lên GitHub trước
git init
git add .
git commit -m "Initial course content"
git remote add origin https://github.com/[USERNAME]/genai-for-testers.git
git push -u origin main

# Deploy lên GitHub Pages (1 lệnh!)
mkdocs gh-deploy

# Website sẽ live tại:
# https://[USERNAME].github.io/genai-for-testers/
```

### Bước 6: Tự động deploy với GitHub Actions

Tạo file `.github/workflows/deploy.yml`:

```yaml
name: Deploy MkDocs to GitHub Pages

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - name: Setup Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.x'

      - name: Install MkDocs
        run: pip install mkdocs-material

      - name: Deploy
        run: mkdocs gh-deploy --force
```

Từ giờ, mỗi khi bạn push lên `main`, website tự động cập nhật! 🚀

---

## PHƯƠNG ÁN B — Export PDF với Pandoc

### Kết quả
File PDF chuyên nghiệp, có thể in hoặc gửi email.

### Cài đặt

```bash
# macOS
brew install pandoc
brew install --cask mactex

# Ubuntu/Debian
sudo apt-get install pandoc texlive-full

# Windows
# Tải từ: https://pandoc.org/installing.html
```

### Merge tất cả MD thành 1 PDF

```bash
# Tạo file danh sách
cat > book-order.txt << EOF
sessions/session-01-mindset.md
sessions/session-02-technique.md
sessions/session-03-context.md
sessions/session-04-skill-building.md
sessions/session-05-ai-agent.md
sessions/session-06-agentic-ai.md
resources/prompt-library.md
resources/cheat-sheets.md
EOF

# Export PDF
pandoc \
  --from markdown \
  --to pdf \
  --output GenAI-for-Testers-Ebook.pdf \
  --toc \
  --toc-depth=2 \
  --variable geometry:margin=1in \
  --variable fontsize=11pt \
  $(cat book-order.txt)
```

### Export HTML (đẹp hơn, dễ share)

```bash
pandoc \
  --from markdown \
  --to html5 \
  --standalone \
  --toc \
  --output GenAI-for-Testers.html \
  --css https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/5.1.0/github-markdown.min.css \
  $(cat book-order.txt)
```

---

## PHƯƠNG ÁN C — GitBook (Dễ nhất)

### Cách dùng

1. Đăng ký tại [gitbook.com](https://gitbook.com) — miễn phí cho public repo
2. Kết nối với GitHub repository
3. GitBook tự đọc file `.md` và render thành website + PDF

### Cấu hình GitBook

Tạo file `SUMMARY.md` ở root:

```markdown
# Summary

* [Giới thiệu](README.md)

## Sessions
* [Session 1 — Mindset](sessions/session-01-mindset.md)
* [Session 2 — Technique](sessions/session-02-technique.md)
* [Session 3 — Context](sessions/session-03-context.md)
* [Session 4 — Skill Building](sessions/session-04-skill-building.md)
* [Session 5 — AI Agent](sessions/session-05-ai-agent.md)
* [Session 6 — Agentic AI](sessions/session-06-agentic-ai.md)

## Resources
* [Prompt Library](resources/prompt-library.md)
* [Cheat Sheets](resources/cheat-sheets.md)
```

---

## Setup GitHub Repository

### Cấu trúc repo đề xuất

```
genai-for-testers/           ← Tên repo
├── .github/
│   └── workflows/
│       └── deploy.yml       ← Auto deploy
├── docs/                    ← Source MD files (cho MkDocs)
│   ├── index.md
│   ├── sessions/
│   └── resources/
├── mkdocs.yml
├── README.md
└── SUMMARY.md               ← Cho GitBook (nếu dùng)
```

### Lệnh Git khởi tạo

```bash
cd genai-for-testers

# Khởi tạo git
git init
git add .
git commit -m "feat: Add full 6-session course content"

# Tạo repo trên GitHub, sau đó:
git remote add origin https://github.com/[USERNAME]/genai-for-testers.git
git branch -M main
git push -u origin main
```

### Cài đặt GitHub Pages

1. Vào **Settings** của repo
2. Chọn **Pages** ở sidebar
3. Source: **Deploy from a branch**
4. Branch: **gh-pages** / **(root)**
5. Save

---

## So sánh cuối cùng

| Tiêu chí | MkDocs | Pandoc PDF | GitBook |
|---------|--------|-----------|---------|
| Độ đẹp | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| Dễ setup | ⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐⭐ |
| Search | ✅ | ❌ | ✅ |
| Mobile-friendly | ✅ | ❌ | ✅ |
| Offline dùng được | ❌ | ✅ | ❌ |
| Tự động update | ✅ (Actions) | Manual | ✅ |
| Custom domain | ✅ | N/A | ✅ (paid) |
| **Khuyến nghị** | **✅ Best** | Nếu cần PDF | Nếu rất lười |

---

*🏠 [README](../README.md)*
