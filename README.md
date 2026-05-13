# UTS Mobile Flutter - Moh Ramdani

## Deskripsi Aplikasi
Sneaker Store App merupakan aplikasi mobile berbasis Flutter yang digunakan untuk menampilkan katalog produk sneaker dengan tampilan modern dan interaktif.

Aplikasi ini terdiri dari satu sisi pengguna, yaitu sisi pelanggan (user). Berikut diuraikan hasil implementasi dan pengujian sistem secara menyeluru. 

1.	Antarmuka Halaman registrasi memungkinkan pengguna baru untuk mendaftarkan akun dengan mengisi data nama lengkap, email, nomor telpon dan kata sandi. Sistem akan menampilkan pesan kesalahan apabila data yang dimasukkan tidak lengkap atau format email tidak valid.
<img width="376" height="545" alt="create account" src="https://github.com/user-attachments/assets/955cc0d4-4ca3-4937-a193-5de0653541ce" />

3.	Antarmuka Login Halaman login memungkinkan pengguna yang telah terdaftar untuk masuk ke dalam sistem menggunakan email dan kata sandi minmal 6 karakter. Apabila kredensial yang dimasukkan tidak sesuai, sistem akan menampilkan notifikasi kesalahan dan pengguna diminta untuk memasukkan ulang data yang benar.
<img width="376" height="545"" alt="login" src="https://github.com/user-attachments/assets/75e2d339-55e2-4c27-898f-fc579f776787" />

4.	Halaman Utama (Home) Halaman utama menampilkan antarmuka beranda aplikasi Sneaker Store yang dirancang dengan tema gelap (dark mode) dan aksen warna oranye. Halaman ini memuat beberapa komponen utama, yaitu bilah pencarian (search bar) untuk memudahkan pengguna menemukan produk, banner promosi yang menampilkan informasi diskon hingga 50%, filter kategori produk meliputi Sneakers, Running, Basketball, Casual, dan lainnya, serta daftar produk yang menampilkan nama produk, harga, dan tombol Add to Cart. Navigasi bawah (bottom navigation bar) menyediakan akses cepat ke halaman Home, Profile, dan Logout.
<img width="376" height="545" alt="home" src="https://github.com/user-attachments/assets/0e027f1e-6554-4445-99db-f007e11e392f" />
   
5.	Halaman Kategori Produk Halaman kategori menampilkan daftar produk yang telah difilter berdasarkan kategori yang dipilih pengguna. Pada halaman ini tersedia pilihan kategori Sneakers, Running, Basketball, Casual, dan Training yang dapat dipilih secara interaktif, di mana kategori yang sedang aktif ditandai dengan latar belakang berwarna oranye. Setiap produk ditampilkan dalam kartu (card) yang memuat gambar produk, nama produk, harga, dan tombol Add to Cart.
<img width="376" height="545" alt="categori" src="https://github.com/user-attachments/assets/150d4e4c-167c-470f-b188-5646b7a55a4a" />

6.	Halaman Keranjang Belanja (My Cart) Halaman keranjang belanja menampilkan daftar produk yang telah ditambahkan oleh pengguna sebelum melanjutkan ke proses pembelian. Setiap item menampilkan gambar produk, nama, dan harga.
<img width="376" height="545" alt="cart" src="https://github.com/user-attachments/assets/be67f022-be75-4a53-9dc6-70ec34241f8e" />

7.	Halaman Profil (Profile) Halaman profil memungkinkan pengguna untuk melihat dan memperbarui data diri secara langsung di dalam aplikasi. Terdapat foto profil pengguna yang dapat diganti melalui tombol kamera (icon camera) yang tersedia di pojok bawah foto. Data yang dapat diperbarui meliputi nama (Name), alamat email (Email), dan nomor telepon (Phone Number). Setelah melakukan perubahan, pengguna menekan tombol Save Changes untuk menyimpan data yang telah diperbarui. Halaman ini juga menyediakan tombol Logout untuk keluar dari sesi pengguna yang sedang aktif.
<img width="376" height="545" alt="update profile" src="https://github.com/user-attachments/assets/b6426fa5-3b3d-4c77-9b1d-5b44688191e7" />

