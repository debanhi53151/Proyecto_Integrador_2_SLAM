# Proyecto_Integrador_2_SLAM
# 🗺️ Proyecto_Integrador_2 – SLAM con LiDAR

Este proyecto implementa un sistema simplificado de **SLAM (Simultaneous Localization and Mapping)** utilizando datos reales del robot móvil **MiR100**.  
El objetivo es construir un mapa de ocupación a partir de mediciones LiDAR, odometría y localización AMCL, aplicando un pipeline clásico de SLAM: **lectura de sensores → predicción → corrección → actualización del mapa**.

---

## 📂 Estructura del Proyecto

El código está organizado de forma modular para facilitar su comprensión y mantenimiento:

| Carpeta / Archivo | Descripción |
|--------------------|-------------|
| **`main.m`** | Script principal que ejecuta el pipeline SLAM completo. |
| **`/auxiliar`** | Contiene los módulos funcionales del sistema. |
| ├── `leerLidarRosbag.m` | Extrae mensajes del tópico `/scan` desde un rosbag. |
| ├── `analyze_bag.m` | Analiza `/odom`, `/amcl_pose` y ground truth. |
| ├── `actualizarMapaBayesiano.m` | Núcleo del SLAM: actualización log-odds del mapa. |
| ├── `bresenham.m` | Algoritmo de Bresenham para discretizar rayos LiDAR. |
| ├── `dibujarMapaOcupacion.m` | Visualiza el mapa de ocupación y la trayectoria. |
| ├── `superponerDeteccionesMapa.m` | Superpone detecciones LiDAR sobre el mapa. |
| ├── `prediccionEKF.m` | Predicción del estado mediante EKF (opcional). |
| ├── `correccionEKF.m` | Corrección del estado mediante EKF (opcional). |
| ├── `metricas_evaluator.m` | Calcula métricas de error entre odometría, AMCL y GT. |
| └── `plot_scan.m` | Visualiza un escaneo LiDAR individual. |

---

## 🚀 Cómo ejecutar

1. Clona este repositorio en tu equipo.  
2. Abre **MATLAB** y navega a la carpeta raíz del proyecto.  
3. Ejecuta el script principal:

```matlab
run('main.m')
