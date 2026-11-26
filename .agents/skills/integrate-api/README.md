# Cara Pakai Skill `integrate-api`

File ini adalah catatan panduan untuk developer. Agent hanya membaca `SKILL.md`, sehingga keberadaan file `README.md` ini aman dan tidak mengganggu cara kerja skill.

---

## 1. Persiapan Sebelum Prompt ke Agent
Karena skill ini diatur untuk **tidak membuat file model secara otomatis**, pastikan kamu sudah menyiapkan file model terlebih dahulu (jika endpoint membutuhkan request/response model):
- Request Model: `lib/features/<nama_feature>/data/models/request/<nama>_request_model.dart`
- Response Model: `lib/features/<nama_feature>/data/models/response/<nama>_response_model.dart`

---

## 2. Format Prompt ke Agent
Kamu bebas mengetik dengan bahasa sehari-hari, cukup sertakan:
1. **Endpoint API** (contoh: `/auth/login`, `/dashboard/summary`)
2. **Method HTTP** (`GET`, `POST`, `PUT`, `DELETE`)
3. **Nama Feature** (contoh: `auth`, `home`, `profile`, `attendance`)
4. *(Opsional)* **Lokasi Sub-BLoC** jika dalam 1 feature terdapat beberapa BLoC terpisah (contoh: `bloc/summary`, `bloc/detail`).

---

## 3. Contoh Prompt

### A. Menambah Endpoint ke Feature & BLoC yang Sudah Ada
> `Integrasikan /auth/logout method POST untuk feature auth`

**Yang akan dikerjakan Agent:**
- Menambahkan method `logout()` ke file `AuthRemoteDatasource` yang sudah ada.
- Menambahkan event `_Logout`, state `LoadingLogout` & `LogoutSucces`, serta handler-nya ke `AuthBloc` yang sudah ada.
- Menjalankan `build_runner`.

---

### B. Integrasi API di Feature Baru (1 BLoC Utama)
> `Fetch /profile method GET untuk feature profile`

**Yang akan dikerjakan Agent:**
- Mengecek model di `lib/features/profile/data/models/response/`.
- Membuat `ProfileRemoteDatasource` (jika belum ada).
- Membuat `ProfileBloc`, `ProfileEvent`, dan `ProfileState` di `lib/features/profile/presentation/bloc/`.
- Menjalankan `build_runner`.
- Mendaftarkan `ProfileRemoteDatasource` dan `ProfileBloc` ke `lib/main.dart`.

---

### C. Integrasi API dengan Sub-BLoC Terpisah (`bloc/summary`, `bloc/detail`, dll.)
> `Integrasikan /dashboard/summary method GET untuk feature home, buat bloc-nya di bloc/summary`

**Yang akan dikerjakan Agent:**
- Mengecek model di `lib/features/home/data/models/response/`.
- Membuat atau melanjutkan `HomeRemoteDatasource`.
- Membuat `SummaryBloc`, `SummaryEvent`, dan `SummaryState` di dalam `lib/features/home/presentation/bloc/summary/`.
- Menjalankan `build_runner`.
- Mendaftarkan `HomeRemoteDatasource` dan `SummaryBloc` ke `lib/main.dart`.

---

## 4. Cara Memakai Skill Ini di Project Lain
- **Per Project**: Salin folder `.agents/skills/integrate-api` ke root project Flutter lainnya.
- **Global (Otomatis di Semua Project)**: Salin folder `integrate-api` ke `C:\Users\<username>\.gemini\config\skills\integrate-api`.
