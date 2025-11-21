Soal dan Jawaban Teori
1. Jelaskan perbedaan antara Cubit dan Bloc dalam arsitektur Flutter?
 Cubit itu lebih sederhana, cocok untuk state kecil, tidak ada event lalu langsung memanggil emit() terus cocok untuk UI state sederhana. sedangkan Bloc itu lebih kompleks, cocok untuk state besar, menggunakan event untuk trigger perubahan lalu dalam pemanggilannya Event-Bloc-State dan Cocok untuk bisnis logika kompleks.

2.Mengapa penting untuk memisahkan antara model data, logika bisnis, dan UI dalam pengembangan aplikasi flutter? 
Karena Model Data: Hanya menyimpan data (misal: ProductModel). Tidak tahu apa yang dilakukan dengan datanya.
Logika Bisnis: Di dalam Cubit/Bloc — mengelola bagaimana data berubah (misal: menambahkan ke keranjang, menghitung total).
UI: Hanya menampilkan data dan menerima input pengguna. Tidak boleh mengandung logika bisnis.

3. Sebutkan dan jelaskan minimal tiga state yang mungkin digunakan dalam CartCubit beserta fungsi nya? 
    Dalam CartCubit, minimal ada 3 state yang digunakan:

Initial State / Empty State
→ Saat keranjang kosong (cartItems = []).
Loading State (Opsional tapi baik)
→ Jika ada proses async (misal: fetch dari API), bisa tambahkan isLoading: true.
Loaded State / Success State
→ Saat keranjang sudah berisi item, dan siap ditampilkan.


### ✅ Struktur Proyek
lib/
├── models/
│   └── product_model.dart
├── blocs/
│   └── cart_cubit.dart
├── widgets/
│   └── product_card.dart
├── pages/
│   └── cart_summary_page.dart
│   └── cart_grid_page.dart
│   └── cart_home_page.dart
│
│
└── main.dart



## 📌 Deskripsi Proyek

Aplikasi ini merupakan implementasi **keranjang belanja sederhana** menggunakan **Flutter** dan pola arsitektur **Bloc (Business Logic Component)**. Tujuannya adalah menunjukkan pemahaman terhadap konsep *state management*, *separation of concerns*, dan pengembangan aplikasi berbasis komponen.

Aplikasi ini memungkinkan pengguna:
- Melihat daftar produk (gambar, nama, harga)
- Melihat ringkasan keranjang (total item & total harga)
- Melakukan *checkout* (mengosongkan keranjang)

Dikembangkan sesuai soal UTS dengan 3 bagian utama:
- **A. Teori** — Konsep dasar Bloc dan desain arsitektur  
- **B. Implementasi** — Model, Cubit, UI  
- **C. Bonus** — Fitur peningkatan/penurunan jumlah item  

## 🌟 Fitur Utama

| Fitur | Status | Keterangan |
|-------|--------|-------------|
| 📦 Tampilan Daftar Produk | ✅ | Grid/list produk dengan gambar, nama, harga |
| ➕➕ Tambah ke Keranjang | ✅ | Tombol "Beli", update otomatis di AppBar |
| 🛒 Ringkasan Keranjang | ✅ | Halaman `/cart` dengan daftar item & total |
| 🧹 Checkout | ✅ | Mengosongkan keranjang |
| 📊 State Management | ✅ | Menggunakan `CartCubit` |
| 🖼 Error Handling Gambar | ✅ | Fallback icon jika gambar gagal muat |

---

## 🛠 Teknologi yang Digunakan

| Komponen | Teknologi |
|---------|-----------|
| Framework | Flutter 3.22+ (Dart 3.4+) |
| State Management | `flutter_bloc` + `freezed` |
| Arsitektur | **Layered Architecture**:<br> • Model (data)<br> • Bloc/Cubit (logika bisnis)<br> • UI (tampilan) |
| Styling | Material 3 (Material Design 3) |
| Gambar | Unsplash (publik, tanpa CORS) |
| Tools | `build_runner`, `freezed_annotation`, `equatable` |

--- 
### Screenshot 
<img width="1919" height="1079" alt="Screenshot 2025-11-21 152912" src="https://github.com/user-attachments/assets/5f9d07ed-20b5-4a43-9bb6-8ccb8daaf0af" />
<img width="1727" height="1009" alt="Screenshot 2025-11-21 152927" src="https://github.com/user-attachments/assets/0bda45a9-1883-4e87-94c2-58c3b736a178" />
<img width="1919" height="1079" alt="Screenshot 2025-11-21 152940" src="https://github.com/user-attachments/assets/2830f74b-3d3b-411f-8156-0c6d734e7655" />
<img width="1919" height="1079" alt="Screenshot 2025-11-21 152956" src="https://github.com/user-attachments/assets/d1a372e8-0190-465c-b748-21bcfd5af1be" />
<img width="1919" height="1079" alt="Screenshot 2025-11-21 153025" src="https://github.com/user-attachments/assets/be05046f-6372-483b-8e0a-149ac797f002" />

---
