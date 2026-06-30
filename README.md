# Llama.cpp Pascal Engine — GTX 1070 Edition (v1.3.0)

[English](#english) | [Español](#español)

---

## English

This is a customized fork designed to get the maximum performance out of the **NVIDIA GTX 1070 (Pascal sm_61, 8GB VRAM)** GPU with network compatibility toolings and autonomous agent workflows.

### 🌟 What's New in this Edition
- **Pascal MMVQ & __dp4a Optimization**: Kernels are specifically built for the `sm_61` architecture, stripping away unneeded emulations and using native hardware dot product instructions.
- **VRAM Safeguards**: Built-in context profiles (4K, 8K, 12K) to prevent Out-Of-Memory (OOM) failures under GDDR5 memory constraints.
- **Auto-Discovery LAN**: Server is automatically announced so it can be discovered instantly by mobile apps like **Off Grid** on iOS/Android.
- **Ollama Identity Shim**: Includes compatibility bridges (`ollama_shim.js`) emulating the Ollama API on port `11434`.
- **Tavily MCP Search Link**: Optional support to inject real-time agéntic searches into your mobile or local workflows.
- **Hermes Sync**: Sychronizes environment settings with the local Hermes TUI agent automatically.

### 📱 How to Connect your Phone/Tablet (Off Grid or others)
1. Run **`Llama-Server_GTX1070.bat`**.
2. Select your GGUF model and select the option to expose the server to the LAN.
3. In the **Off Grid** app, tap Scan.
4. The server will auto-connect using target Ollama translation.

### 💾 Quick Download (Portable Release)
If you don't want to compile anything from source, download the precompiled bundle containing the executable and required CUDA dependencies here:
- 👉 **[Download Llama-GTX1070-portable-b9843.zip](https://github.com/marbycore/llama-cpp-custom-for-1070-fork/releases/download/v1.0.0-gtx1070/Llama-GTX1070-portable-b9843.zip)** (634 MB)

Extract it and double click on `Llama-Server_GTX1070.bat` to begin.

### 🛠️ Requirements
- Windows 10/11 x64
- NVIDIA GTX 1070 (8GB VRAM)
- NVIDIA Drivers compatible with CUDA 12.4+ (v530 or newer)
- Node.js installed (to run the Ollama compatibility shim)

---

## Español

Este es un fork personalizado y adaptado para exprimir al máximo la GPU **NVIDIA GTX 1070 (Pascal sm_61, 8GB VRAM)** con herramientas de compatibilidad de red y agentes autónomos.

### 🌟 Qué hay de nuevo en esta edición
- **Optimización Pascal MMVQ y __dp4a**: Kernels cargados de forma específica para arquitectura `sm_61` desactivando emulaciones innecesarias y usando instrucciones dot product nativas de hardware.
- **VRAM Safeguards**: Perfiles de contexto integrados de 4K, 8K y 12K para prevenir fallos por falta de memoria (Out-of-Memory / OOM).
- **Auto-Discovery LAN**: El servidor se publica automáticamente para poder ser descubierto por aplicaciones móviles como **Off Grid** en iOS/Android.
- **Ollama Identity Shim**: Incluye puentes de compatibilidad local (`ollama_shim.js`) emulando la API de Ollama en el puerto `11434`.
- **Tavily MCP Search Link**: Soporte opcional para inyectar búsqueda agéntica directa en tus entornos móviles/locales.
- **Hermes Sync**: Sincronizador de variables de entorno para que el agente local de tu PC mantenga contexto automático.

### 📱 Cómo conectar tu Teléfono/Tablet (Off Grid u otros)
1. Ejecuta **`Llama-Server_GTX1070.bat`**.
2. Selecciona tu modelo GGUF y elige la opción de habilitar red LAN.
3. En la aplicación **Off Grid**, pulsa en buscar/escanear.
4. El servidor se auto-conecta asignándote compatibilidad Ollama instantánea.

### 💾 Descargas Rápidas (Engine Portable)
Si no deseas compilar nada, puedes descargar el paquete preempaquetado listo con el ejecutable y drivers de CUDA necesarios:
- 👉 **[Descargas Llama-GTX1070-portable-b9843.zip](https://github.com/marbycore/llama-cpp-custom-for-1070-fork/releases/download/v1.0.0-gtx1070/Llama-GTX1070-portable-b9843.zip)** (634 MB)

Extrae el contenido en el directorio que prefieras y ejecuta `Llama-Server_GTX1070.bat`.

### 🛠️ Requisitos
- Windows 10/11 x64
- NVIDIA GTX 1070 (8GB VRAM)
- Driver NVIDIA compatible con CUDA 12.4+ (v530 o superior)
- Node.js instalado (para correr el shim de compatibilidad con Ollama)

---
*Developed for local high-performance inference on Pascal architectures.*
