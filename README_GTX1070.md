# Llama.cpp GTX 1070 Pascal — Portable Distribution / Distribución Portable

[English](#english) | [Español](#español)

---

## English

This package **comes precompiled** (`llama-server.exe` + CUDA 12.4 DLLs). 
You do not need to install CUDA Toolkit or compile anything to run it on any PC containing a GTX 1070.

### ⚡ Quick Start (3 Steps)
1. **Download a recommended GGUF model** (see list below) and place it in an accessible folder.
2. **Double-click** `Llama-Server_GTX1070.bat`.
3. Select your model, adjust the context length, and click **Launch**.

The server will listen at `http://localhost:5050` and act as an Ollama server on port `11434`.

### ⚙️ Optimization Details
- **Native MMVQ Kernels (sm_61):** Built directly from the official llama.cpp repo with explicit Pascal architecture support. Utilizes the native hardware `__dp4a` dot-product instruction.
- **Deactivated Flash Attention:** Deactivated by default on Pascal architectures to prevent stability bottlenecks and memory faults.
- **Tuned Context Limits (8GB VRAM):** Default profiles are set to 4K/8K to avoid Out-Of-Memory (OOM) crashes under GDDR5 limits. 
- **Ollama Shim & Tavily Enabled:** Comes out-of-the-box with network search integrations.

### 🤖 Recommended GGUF Models (Q4_K_M)
| Model | VRAM size | Estimated speed |
|--------|-------------|-------------------|
| Llama-3-8B-Instruct Q4_K_M | ~4.8 GB | 18-28 t/s |
| Qwen2.5-7B-Instruct Q4_K_M | ~4.7 GB | 20-30 t/s |
| DeepSeek-Coder-6.7B Q4_K_M | ~4.4 GB | 22-32 t/s |
| Phi-3-mini-4k Q4_K_M | ~2.3 GB | 35-50 t/s |

*Avoid GGUF models >12B as they will force Unified Memory paging, bringing speed down.*

---

## Español

Este paquete **ya viene con el motor precompilado** (`llama-server.exe` + DLLs CUDA 12.4).
No necesitas compilar nada ni instalar CUDA Toolkit para comenzar a usarlo en cualquier PC con GTX 1070.

### ⚡ Inicio Rápido (3 pasos)
1. **Descarga un modelo GGUF** recomendado (ver sección abajo) y colócalo en una carpeta accesible.
2. **Haz doble clic** en `Llama-Server_GTX1070.bat`.
3. Selecciona el modelo, ajusta el contexto y haz clic en **Iniciar**.

El servidor queda escuchando en `http://localhost:5050` y emula a Ollama en el puerto `11434`.

### ⚙️ Optimizaciones Clave
- **Kernels MMVQ nativos (sm_61):** Generados para Pascal (GTX 1070) usando la instrucción `__dp4a` nativa de hardware.
- **Flash Attention Inactivo:** Desactivado por defecto en la GTX 1070 para garantizar máxima estabilidad.
- **Perfiles de Contexto Ajustados (8GB VRAM):** Por defecto a 4K/8K para evitar Out-Of-Memory (OOM).

### 🤖 Modelos Recomendados (GGUF Q4_K_M)
| Modelo | Tamaño VRAM | Velocidad estimada |
|--------|-------------|-------------------|
| Llama-3-8B-Instruct Q4_K_M | ~4.8 GB | 18-28 t/s |
| Qwen2.5-7B-Instruct Q4_K_M | ~4.7 GB | 20-30 t/s |
| DeepSeek-Coder-6.7B Q4_K_M | ~4.4 GB | 22-32 t/s |
| Phi-3-mini-4k Q4_K_M | ~2.3 GB | 35-50 t/s |

---

## Package Directory / Estructura del Paquete
```
dist_1070/
├── llama-server.exe          ← CUDA 12 Inference Engine
├── ggml-cuda.dll             ← Pascal-optimized CUDA kernels
├── cublas64_12.dll            ← CUDA 12.4 Runtime Libraries
├── Llama-Server_GTX1070.bat  ← Batch Interactive launcher
├── launcher_gui_1070.ps1     ← PowerShell GUI Orchestrator
├── ollama_shim.js            ← Connection compatibility shim
├── sync_hermes.ps1           ← Local Hermes Agent Synchronizer
├── descargar_binario_oficial_1070.ps1 ← Auto-updater from GitHub release
└── compilar_para_1070.ps1    ← Source compiler (needs VS + CUDA 12)
```

---

*Desarrollado para entornos locales de alto rendimiento y portabilidad máxima.*
