# 📦 Inventario de Repuestos - Lenguaje Ensamblador

## 📋 Problemática
Un laboratorio de cómputo necesita revisar sus existencias actuales antes de solicitar una reposición de material. En este contexto, una **referencia** corresponde a un tipo específico de artículo (como teclados, ratones, cables o adaptadores).

## 🎯 Objetivo del Programa
Desarrollar una solución en lenguaje ensamblador que permita evaluar el estado del inventario bajo las siguientes reglas:

* **Entrada de datos:** Ingresar la cantidad de unidades disponibles para **5 referencias** distintas.
* **Rango permitido:** Cada referencia debe tener un valor entre **0 y 200** unidades.
* **Criterio de reposición:** Contar cuántas referencias tienen **menos de 10 unidades** disponibles.
* **Nota importante:** Si una referencia tiene **0 unidades**, se considera agotada y **debe incluirse** en el conteo de artículos por reponer.

