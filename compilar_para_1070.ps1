# compilar_para_1070.ps1
# Script para compilar llama.cpp optimizado para la GTX 1070 (Compute Capability 6.1)

$ErrorActionPreference = "Continue"
Write-Host "⚡ Iniciando compilacion de llama.cpp para NVIDIA GTX 1070 (Pascal) usando Ninja..." -ForegroundColor Green

# 1. Limpieza de compilaciones previas
if (Test-Path "build") {
    Write-Host "🧹 Limpiando directorio build anterior..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force build
}

# 2. Configurar el entorno de Visual Studio
Write-Host "⚙️ Configurando el entorno del compilador MSVC..." -ForegroundColor Green
$vcvars = "C:\Program Files\Microsoft Visual Studio\18\Community\VC\Auxiliary\Build\vcvars64.bat"
if (-not (Test-Path $vcvars)) {
    $vcvars = "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars64.bat"
}
if (-not (Test-Path $vcvars)) {
    $vcvars = "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
}

if (-not (Test-Path $vcvars)) {
    Write-Error "❌ No se encontro vcvars64.bat en las rutas estandar. Asegurate de tener Visual Studio 2022 o 2026 instalado."
    exit 1
}

Write-Host "✅ Usando entorno de: $vcvars" -ForegroundColor Green

# 3. Lanzar CMake en modo Release con CUDA sm_61 y generador Ninja
Write-Host "🚀 Iniciando configuracion con CMake usando Ninja..." -ForegroundColor Green
# Forzamos -G Ninja para evitar el error "No CUDA toolset found" de MSBuild
cmd /c "`"$vcvars`" && cmake -G `"Ninja`" -B build -DGGML_CUDA=ON -DGGML_NATIVE=OFF -DGGML_CUDA_FA_ALL_QUANTS=OFF -DCMAKE_CUDA_FLAGS=`"-allow-unsupported-compiler`" -DCMAKE_CUDA_ARCHITECTURES=61 -DCMAKE_BUILD_TYPE=Release"

# 4. Construir binarios con Ninja
if ($LASTEXITCODE -eq 0) {
    Write-Host "🛠️ Construyendo binarios de llama.cpp (puede tardar unos minutos)..." -ForegroundColor Green
    cmd /c "`"$vcvars`" && cmake --build build --config Release -j"
}
else {
    Write-Error "❌ Error al configurar CMake."
    exit 1
}

# 5. Confirmar éxito y copiar archivo al directorio raíz para portabilidad
if (Test-Path "build\bin\llama-server.exe") {
    Write-Host "`n🎉 ¡COMPILACION COMPLETADA CON EXITO!" -ForegroundColor Green
    Write-Host "El ejecutable esta listo en: build\bin\llama-server.exe" -ForegroundColor Green
    
    # Copiar ejecutable principal al bin raíz de build para compatibilidad de lanzadores alternativos
    if (-not (Test-Path "build\bin\Release")) {
        New-Item -ItemType Directory -Path "build\bin\Release" -Force | Out-Null
    }
    Copy-Item "build\bin\llama-server.exe" -Destination "build\bin\Release\llama-server.exe" -Force
    Write-Host "Copiado a: build\bin\Release\llama-server.exe" -ForegroundColor Green
}
else {
    Write-Error "❌ Error: No se encontro el archivo compilado llama-server.exe"
}
