# Llama.cpp Pascal Engine — GTX 1070 Edition (v1.3.0)

Este es un fork adaptado para exprimir al máximo la GPU **NVIDIA GTX 1070 (Pascal sm_61, 8GB VRAM)** con herramientas de compatibilidad de red y agentes autónomos.

---

## 🌟 Qué hay de nuevo en esta edición
- **Pascal MMVQ & __dp4a Optimization**: Kernels cargados de forma específica para arquitectura `sm_61` desactivando emulaciones innecesarias.
- **VRAM Safeguards**: Perfiles de contexto integrados de 4K, 8K y 12K para prevenir fallos por falta de memoria (Out-of-Memory / OOM).
- **Auto-Discovery LAN**: El servidor se publica automáticamente para poder ser descubierto por aplicaciones móviles como **Off Grid** en iOS/Android.
- **Ollama Identity Shim**: Incluye puentes de compatibilidad local (`ollama_shim.js`) emulando la API en el puerto `11434`.
- **Tavily MCP Search Link**: Soporte opcional para inyectar búsqueda agéntica directa en tus entornos móviles/locales.
- **Hermes Sync**: Sincronizador de variables de entorno para que el agente local de tu PC mantenga contexto automático.

---

## 📱 Cómo conectar tu Teléfono/Tablet (Off Grid u otros)
1. Ejecuta **`Llama-Server_GTX1070.bat`**.
2. Selecciona tu modelo GGUF y elige la opción de habilitar red LAN.
3. En la aplicación **Off Grid**, pulsa en buscar/escanear.
4. El servidor se auto-conecta asignándote compatibilidad Ollama instantánea.

---

## 💾 Descargas Rápidas (Engine Portable)
Si no deseas compilar nada, puedes descargar el paquete preempaquetado listo con el ejecutable y drivers de CUDA necesarios:
- 👉 **[Descargar Llama-GTX1070-portable-b9843.zip](https://github.com/marbycore/llama-cpp-custom-for-1070-fork/releases/download/v1.0.0-gtx1070/Llama-GTX1070-portable-b9843.zip)** (634 MB)

Extrae el contenido en el directorio que prefieras y ejecuta `Llama-Server_GTX1070.bat`.

---

## 🛠️ Requisitos
- Windows 10/11 x64
- NVIDIA GTX 1070 (8GB VRAM)
- Driver NVIDIA compatible con CUDA 12.4+ (v530 o superior)
- Node.js instalado (para correr el shim de compatibilidad con Ollama)

---

*Desarrollado para entornos de rendimiento local óptimo en la arquitectura Pascal.*
