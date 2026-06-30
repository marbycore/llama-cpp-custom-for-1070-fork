# descargar_binario_oficial_1070.ps1
# Script de descarga e instalacion de llama.cpp (CUDA 12) para GTX 1070 en ASCII puro

$ErrorActionPreference = "SilentlyContinue"

$buildTag = "b9843"
$exeZipName = "llama-$buildTag-bin-win-cuda-12.4-x64.zip"
$dllZipName = "cudart-llama-bin-win-cuda-12.4-x64.zip"

$downloadUrlExe = "https://github.com/ggml-org/llama.cpp/releases/download/$buildTag/$exeZipName"
$downloadUrlDll = "https://github.com/ggml-org/llama.cpp/releases/download/$buildTag/$dllZipName"

Write-Host "Iniciando descarga de binario oficial de llama.cpp ($buildTag) para GTX 1070..."
Write-Host "Version objetivo: $buildTag (CUDA 12.4)"

$destDir = Join-Path $PSScriptRoot "build\bin\Release"
if (-not (Test-Path $destDir)) {
    New-Item -ItemType Directory -Path $destDir -Force | Out-Null
}

$tempDir = Join-Path $env:TEMP "llama_1070_dl"
if (Test-Path $tempDir) { Remove-Item -Recurse -Force $tempDir }
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

$assets = @(
    @{ Name = $exeZipName; Url = $downloadUrlExe },
    @{ Name = $dllZipName; Url = $downloadUrlDll }
)

foreach ($asset in $assets) {
    $fileName = $asset.Name
    $downloadUrl = $asset.Url
    $zipPath = Join-Path $tempDir $fileName

    Write-Host "Descargando: $fileName ..."
    Write-Host "Desde: $downloadUrl"

    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    
    $downloaded = $false
    if (Get-Command "aria2c" -ErrorAction SilentlyContinue) {
        & aria2c -x 16 -s 16 -d $tempDir -o $fileName $downloadUrl
        if (Test-Path $zipPath) {
            $downloaded = $true
        }
    }
    
    if (-not $downloaded) {
        Invoke-WebRequest -Uri $downloadUrl -OutFile $zipPath -UseBasicParsing
    }

    if (-not (Test-Path $zipPath)) {
        Write-Error "Error al descargar $fileName. Verifica conexion o si el servidor de GitHub tiene problemas."
        exit 1
    }

    Write-Host "Descomprimiendo en: $destDir"
    Expand-Archive -Path $zipPath -DestinationPath $destDir -Force
}

$ErrorActionPreference = "Continue"

# Garantizar compatibilidad con repo y distribucion plana
if (-not (Test-Path (Join-Path $PSScriptRoot "build\bin"))) {
    New-Item -ItemType Directory -Path (Join-Path $PSScriptRoot "build\bin") -Force | Out-Null
}
if (Test-Path (Join-Path $destDir "llama-server.exe")) {
    Copy-Item (Join-Path $destDir "llama-server.exe") -Destination (Join-Path $PSScriptRoot "build\bin\llama-server.exe") -Force
    Write-Host "Copiado ejecutable principal a build\bin\llama-server.exe"
    
    # Copiar al raiz de la carpeta actual si estamos en distribucion plana
    if (-not (Test-Path (Join-Path $PSScriptRoot "CMakeLists.txt"))) {
        Write-Host "Detectado entorno de distribucion plana. Actualizando archivos del raiz..."
        Copy-Item "$destDir\*" -Destination $PSScriptRoot -Force
        # Opcionalmente remover carpeta build temporal para limpiar
        Remove-Item -Recurse -Force (Join-Path $PSScriptRoot "build") -ErrorAction SilentlyContinue
    }
}

Write-Host "INSTALACION COMPLETA CON EXITO"
Write-Host "El motor ejecutable CUDA 12 esta listo."
Write-Host "Puedes ejecutar .\Llama-Server_GTX1070.bat"

# Limpieza
Remove-Item -Recurse -Force $tempDir -ErrorAction SilentlyContinue
