---
name: integrate-api
description: >-
  Skill untuk mengintegrasikan atau fetch API di project Flutter (membuat/melanjutkan
  Remote Datasource, membuat/melanjutkan BLoC atau Sub-BLoC dengan Freezed, menjalankan
  build_runner, dan mendaftarkan provider di main.dart) tanpa membuat file model
  request/response. Aktifkan skill ini setiap kali user memberikan endpoint API dan
  method HTTP atau meminta integrasi API untuk suatu fitur.
---

# Panduan Integrasi API (Datasource + Freezed BLoC)

Gunakan skill ini setiap kali user meminta integrasi atau fetch endpoint API (misalnya: `/auth/login post`, `/dashboard/summary get`, dll.) untuk sebuah fitur (`feature`).

> **ATURAN PENTING**: **JANGAN** membuat file Request Model atau Response Model (`data/models/request/` atau `data/models/response/`). User membuat file model sendiri secara manual. Selalu cek folder `lib/features/<nama_feature>/data/models/` terlebih dahulu dan gunakan class model yang sudah ada (atau gunakan tipe data primitif seperti `String`, `int`, `Map<String, dynamic>` jika endpoint tidak memakai model request).

## Informasi yang Harus Dikenali dari Prompt User
1. **Endpoint & Method HTTP**: URL path (misal `/auth/login`) dan method-nya (`ApiMethod.get`, `ApiMethod.post`, `ApiMethod.put`, atau `ApiMethod.delete`).
2. **Nama Feature**: Nama folder fitur di dalam `lib/features/<nama_feature>/` sesuai yang disebutkan user atau yang sudah ada di project.
3. **Model yang Sudah Ada**: Cek folder `lib/features/<nama_feature>/data/models/request/` dan `lib/features/<nama_feature>/data/models/response/` untuk mengetahui class Request/Response yang siap di-import.
4. **Target Lokasi BLoC**:
   - **1 BLoC utama per feature**: `lib/features/<nama_feature>/presentation/bloc/<nama_feature>_bloc.dart`
   - **Banyak BLoC / Sub-BLoC di dalam feature** (jika user meminta dipisah, misal `bloc/summary`, `bloc/detail`, dll.): `lib/features/<nama_feature>/presentation/bloc/<nama_sub_bloc>/<nama_sub_bloc>_bloc.dart`

---

## Langkah-Langkah Pengerjaan

### 1. Cek Model yang Tersedia di `data/models/`
- Periksa isi folder `lib/features/<nama_feature>/data/models/request/` dan `lib/features/<nama_feature>/data/models/response/`.
- Jangan membuat file model baru kecuali diminta secara eksplisit oleh user.
- Cocokkan nama aksi endpoint dengan `RequestModel` dan `ResponseModel` yang sudah tersedia.

---

### 2. Buat atau Lanjutkan Remote Datasource
Lokasi: `lib/features/<nama_feature>/data/datasource/`
- **PENTING**: Cek terlebih dahulu apakah file remote datasource sudah ada di dalam folder `lib/features/<nama_feature>/data/datasource/`.
  - **Jika sudah ada**: Tambahkan method baru dan import yang dibutuhkan ke dalam class yang sudah ada. **Jangan** menimpa atau menghapus method lama.
  - **Jika belum ada**: Buat file baru `lib/features/<nama_feature>/data/datasource/<nama_feature>_remote_datasource.dart`.

Ketentuan Kode Datasource:
- Gunakan `ApiDriver` (`core/config/api_driver.dart`) dan `handleResponse` (`core/config/handle_response.dart`).
- Return type menggunakan `Future<Either<String, <NamaResponseModel>>>` dari `package:dartz/dartz.dart`.
- Bungkus pemanggilan di dalam `try / catch` dan kembalikan `const Left('<pesan error yang jelas>')` pada blok `catch`.

```dart
import 'package:dartz/dartz.dart';

import '../../../../core/config/api_driver.dart';
import '../../../../core/config/handle_response.dart';
import '../models/request/contoh_request_model.dart';
import '../models/response/contoh_response_model.dart';

class FeatureRemoteDatasource {
  final _driver = ApiDriver();

  Future<Either<String, ContohResponseModel>> namaMethod(
    ContohRequestModel request,
  ) async {
    try {
      final response = await _driver.request(
        method: ApiMethod.post, // sesuaikan: get, post, put, delete
        url: '/path/endpoint',
        body: request.toJson(), // hapus parameter body jika method GET/DELETE
      );

      return handleResponse(
        response: response,
        fromJson: (String body) => ContohResponseModel.fromJson(body),
        errorMessage: 'Gagal memuat data, silakan coba lagi',
      );
    } catch (e) {
      return const Left('Gagal memuat data, silakan coba lagi');
    }
  }
}
```

---

### 3. Buat atau Lanjutkan BLoC (Menggunakan Freezed)
Tentukan lokasi BLoC sesuai permintaan user:
- BLoC tunggal di fitur: `lib/features/<nama_feature>/presentation/bloc/<nama_feature>_bloc.dart`
- Sub-BLoC di dalam subfolder: `lib/features/<nama_feature>/presentation/bloc/<nama_sub>/<nama_sub>_bloc.dart`

**ATURAN AUTO-ORGANIZE SUB-BLOC**:
Jika user meminta membuat Sub-BLoC baru (misal `bloc/submit_leaves` atau `bloc/presence_history`), **cek terlebih dahulu** apakah di root folder `lib/features/<nama_feature>/presentation/bloc/` sudah ada file BLoC tunggal (misal `leaves_bloc.dart`, `leaves_event.dart`, `leaves_state.dart`, `leaves_bloc.freezed.dart`):
- **Jika ada**: Otomatis pindahkan file BLoC yang lama tersebut ke dalam subfolder sesuai nama BLoC-nya (misal `bloc/leaves/`), sesuaikan relative import di dalam `<nama_bloc_lama>_bloc.dart` (`../../data/` → `../../../data/`), dan perbarui seluruh import yang mereferensikannya di seluruh project (termasuk `lib/main.dart` dan halaman terkait) agar struktur folder `bloc/` rapi dan konsisten.

**Jika file BLoC target sudah ada**:
1. Tambahkan factory event baru di `<nama>_event.dart`:
   ```dart
   const factory FeatureEvent.namaAksi(ContohRequestModel request) = _NamaAksi;
   ```
   *(Jika `GET` tanpa parameter: `const factory FeatureEvent.namaAksi() = _NamaAksi;`)*
2. Tambahkan state loading dan success baru di `<nama>_state.dart` (pertahankan `Initial` dan `Error<Nama>` yang sudah ada):
   ```dart
   const factory FeatureState.loadingNamaAksi() = LoadingNamaAksi;
   const factory FeatureState.namaAksiSucces(ContohResponseModel data) = NamaAksiSucces;
   ```
3. Tambahkan handler `on<_NamaAksi>` di dalam constructor `<nama>_bloc.dart`:
   ```dart
   on<_NamaAksi>((event, emit) async {
     emit(LoadingNamaAksi());
     final result = await _datasource.namaMethod(event.request);
     result.fold(
       (error) => emit(ErrorFeature(error)),
       (data) => emit(NamaAksiSucces(data)),
     );
   });
   ```

**Jika file BLoC target belum ada**:
Buat 3 file (`<nama>_bloc.dart`, `<nama>_event.dart`, dan `<nama>_state.dart`) menggunakan `@freezed`:
- Inject `<Feature>RemoteDatasource` melalui constructor: `<Nama>Bloc(this._datasource) : super(Initial())`.
- Sertakan `part '<nama>_event.dart';`, `part '<nama>_state.dart';`, dan `part '<nama>_bloc.freezed.dart';`.

---

### 4. Jalankan Build Runner (Generate Freezed)
Jalankan perintah berikut agar file `.freezed.dart` ter-generate atau ter-update:
```powershell
dart run build_runner build --delete-conflicting-outputs
```

---

### 5. Daftarkan Datasource & BLoC di `lib/main.dart`
Periksa `lib/main.dart`:
- Pastikan `<Feature>RemoteDatasource` sudah terdaftar di `RepositoryProvider` / `MultiRepositoryProvider`.
- Pastikan `<Nama>Bloc` sudah terdaftar di `BlocProvider` / `MultiBlocProvider` dengan mengambil datasource melalui `context.read<<Feature>RemoteDatasource>()`.
- Jika sebelumnya di `main.dart` baru ada 1 `RepositoryProvider` atau `BlocProvider`, ubah menjadi `MultiRepositoryProvider` dan `MultiBlocProvider` saat menambahkan provider kedua dan seterusnya:

```dart
return MultiRepositoryProvider(
  providers: [
    RepositoryProvider(create: (context) => AuthRemoteDatasource()),
    RepositoryProvider(create: (context) => FeatureRemoteDatasource()),
  ],
  child: MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => AuthBloc(context.read<AuthRemoteDatasource>()),
      ),
      BlocProvider(
        create: (context) => FeatureBloc(context.read<FeatureRemoteDatasource>()),
      ),
    ],
    child: MaterialApp(
      ...
    ),
  ),
);
```

---

### 6. Verifikasi Kode
Jalankan `dart analyze` pada file yang baru dibuat atau diubah untuk memastikan tidak ada error maupun warning.
