# aristeia

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## 2.2 Diagrama MVVM del proyecto Aristeia

```mermaid
graph TD

A[DashboardPage]
B[AnalisisPage]
C[MateriasPage]
D[ProgresoPage]
E[RetroalimentacionPage]

VM[ViewModel]

R[Repository]

DB[(Supabase)]

A --> VM
B --> VM
C --> VM
D --> VM
E --> VM

VM --> R
R --> DB
```
## 3.2 Flujo de datos — Carga de tareas con Realtime

El siguiente diagrama muestra cómo la aplicación carga los datos iniciales desde Supabase y se mantiene sincronizada en tiempo real con cualquier cambio en la base de datos.

```mermaid
sequenceDiagram

participant UI as Pantalla (DashboardPage)
participant VM as ViewModel
participant R as Repository
participant DB as Supabase

UI->>VM: solicita datos
VM->>R: getTareas()
R->>DB: consulta inicial
DB-->>R: datos
R-->>VM: lista de tareas
VM-->>UI: muestra datos

DB-->>R: cambio en tiempo real
R-->>VM: datos actualizados
VM-->>UI: actualiza pantalla
```
```mermaid
erDiagram

USUARIOS {
  uuid id_usuario PK
  varchar nombre
  varchar correo
}

ESTUDIANTES {
  int id_estudiante PK
  uuid id_usuario FK
  varchar matricula
}

MATERIAS {
  int id_materia PK
  varchar nombre
}

RESULTADOS {
  int id_resultado PK
  int id_estudiante FK
  int id_examen FK
}

USUARIOS ||--|| ESTUDIANTES : tiene
ESTUDIANTES ||--o{ RESULTADOS : obtiene
MATERIAS ||--o{ RESULTADOS : evalua
```
