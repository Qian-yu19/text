# AR 花朵展示 - 部署到 GitHub Pages
# 使用方法: 在 PowerShell 中运行 .\deploy.ps1

Write-Host "=== 部署到 GitHub Pages ===" -ForegroundColor Cyan

# 检查 git
$git = Get-Command git -ErrorAction SilentlyContinue
if (-not $git) {
    Write-Host "❌ 未安装 Git，请先安装 https://git-scm.com" -ForegroundColor Red
    exit 1
}

# 检查是否已经在 git 仓库中
$inRepo = git rev-parse --is-inside-work-tree 2>$null
if (-not $inRepo) {
    Write-Host "初始化 Git 仓库..." -ForegroundColor Yellow
    git init
    git add .
    git commit -m "init: AR flower展示"
}

# 检查是否有 remote
$remote = git remote -v
if (-not $remote) {
    Write-Host ""
    Write-Host "请先在 GitHub 上创建一个仓库，然后运行：" -ForegroundColor Yellow
    Write-Host "  git remote add origin https://github.com/你的用户名/你的仓库名.git" -ForegroundColor Green
    Write-Host "  git branch -M main" -ForegroundColor Green
    Write-Host "  git push -u origin main" -ForegroundColor Green
    Write-Host ""
    Write-Host "之后在 GitHub 仓库 Settings > Pages 中：" -ForegroundColor Yellow
    Write-Host "  Source 选 main，目录选 / (root)，点 Save" -ForegroundColor Green
    Write-Host "几分钟后就能在 https://你的用户名.github.io/仓库名 访问" -ForegroundColor Green
} else {
    git push -u origin main
}
