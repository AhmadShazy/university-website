# 🎓 COMSATS University — Department of Computer Science Website

**A static university department website built with complete DevOps practices including CI/CD pipelines, Docker containerization, and multi-environment cloud deployment.**

[![CI - Development](https://github.com/AhmadShazy/university-website/actions/workflows/ci-dev.yml/badge.svg)](https://github.com/AhmadShazy/university-website/actions/workflows/ci-dev.yml)
[![CI - Staging](https://github.com/AhmadShazy/university-website/actions/workflows/ci-staging.yml/badge.svg)](https://github.com/AhmadShazy/university-website/actions/workflows/ci-staging.yml)
[![CI - Production](https://github.com/AhmadShazy/university-website/actions/workflows/ci-prod.yml/badge.svg)](https://github.com/AhmadShazy/university-website/actions/workflows/ci-prod.yml)

---

## 📋 Project Overview

This project demonstrates a complete DevOps lifecycle for a static HTML/CSS university department website. It covers Git Flow branching strategy, Docker containerization, automated CI/CD pipelines via GitHub Actions, and three-environment deployment on Render.com.

**University:** COMSATS University Islamabad, Lahore Campus  
**Course:** Lab-DevOps for Cloud Computing  
**Program:** BSCS Semester 6  
**Student:** Ahmad Sheraz — FA23-BCS-176-D  

---

## 🚀 Live Deployment URLs

| Environment | Branch  | Live URL |
|-------------|---------|----------|
| Development | develop | https://university-website-5ruo.onrender.com |
| Staging     | release | https://university-website-staging.onrender.com |
| Production  | main    | https://university-website-prod.onrender.com |

---

## 📁 Project Structure

```
university-website/
├── index.html                   # Home page
├── courses.html                 # Courses & programs page
├── faculty.html                 # Faculty directory page
├── admissions.html              # Admissions & application page
├── contact.html                 # Contact & office hours page
├── css/
│   └── style.css                # Global responsive stylesheet
├── images/                      # Static image assets
├── Dockerfile                   # Docker build instructions
├── nginx.conf                   # Nginx web server configuration
├── README.md                    # Project documentation
└── .github/
    └── workflows/
        ├── ci-dev.yml           # CI pipeline — development
        ├── ci-staging.yml       # CI pipeline — staging
        ├── ci-prod.yml          # CI pipeline — production
        ├── cd-dev.yml           # CD pipeline — development
        ├── cd-staging.yml       # CD pipeline — staging
        └── cd-prod.yml          # CD pipeline — production
```

---

## 🛠 Tech Stack

| Technology | Purpose |
|------------|---------|
| HTML5 + CSS3 | Static website frontend |
| Docker + Nginx | Containerization and web serving |
| GitHub Actions | CI/CD pipeline automation |
| Render.com | Cloud deployment (3 environments) |
| Git Flow | Branching and release strategy |

---

## 🌿 Git Flow Strategy

```
main        →  Production (live website, stable releases only)
release     →  Staging (pre-production testing)
develop     →  Development (active integration branch)
feature/*   →  Individual feature development
```

**Branch Rules:**
- All new features are created from `develop`
- Feature branches merge back into `develop` via Pull Request
- `develop` merges into `release` for staging testing
- `release` merges into `main` for production deployment

---

## ⚙️ CI/CD Pipeline

Each environment has a separate CI pipeline and a separate CD pipeline — 6 pipelines total.

### CI Pipeline (runs on every push)
```
Step 1 → HTML Validation   (html-tidy checks all 5 pages)
Step 2 → CSS Linting       (stylelint checks style.css)
Step 3 → Docker Build      (builds image, verifies it compiles)
```

### CD Pipeline (runs after CI passes)
```
Step 1 → Triggers Render Deploy Hook via HTTP POST
Step 2 → Render pulls latest code and rebuilds Docker image
Step 3 → New container goes live automatically
```

| Pipeline | Trigger Branch | Environment |
|----------|---------------|-------------|
| CI/CD Dev | develop | development |
| CI/CD Staging | release | staging |
| CI/CD Prod | main | production |

---

## 🐳 Docker Usage

```bash
# Build the Docker image
docker build -t university-website .

# Run the container (accessible at http://localhost:8080)
docker run -d -p 8080:80 --name uni-site university-website

# Check running containers
docker ps

# View logs
docker logs uni-site

# Stop and remove
docker stop uni-site && docker rm uni-site
```

The container uses **Nginx on Alpine Linux** — lightweight, fast, and production-ready.

---

## 🔐 GitHub Environments & Secrets

| Environment | Branch  | Secret Name | Protection |
|-------------|---------|-------------|------------|
| development | develop | `RENDER_DEPLOY_HOOK_DEV` | None |
| staging     | release | `RENDER_DEPLOY_HOOK_STAGING` | None |
| production  | main    | `RENDER_DEPLOY_HOOK_PROD` | Required reviewers |

---

## 🖥 Website Pages

| Page | File | Description |
|------|------|-------------|
| Home | index.html | Hero, stats, about, news |
| Courses | courses.html | Programs, curriculum table, specializations |
| Faculty | faculty.html | Leadership cards, directory table, research groups |
| Admissions | admissions.html | Eligibility, process steps, application form |
| Contact | contact.html | Contact info, message form, office hours |

---

## 📦 Complete Setup from Scratch

```bash
# 1. Clone the repository
git clone https://github.com/AhmadShazy/university-website.git
cd university-website

# 2. Test locally in browser
open index.html

# 3. Build and run with Docker
docker build -t university-website .
docker run -d -p 8080:80 university-website

# 4. Open http://localhost:8080
```

---

## 👤 Author

**Ahmad Sheraz**  
Registration: FA23-BCS-176-D  
COMSATS University Islamabad, Lahore Campus  
BS Computer Science — Semester 6  
Course: Lab-DevOps for Cloud Computing  

**Repository:** https://github.com/AhmadShazy/university-website
