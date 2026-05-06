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
