# UTS Mobile Flutter - Moh Ramdani

## Deskripsi Aplikasi
Sneaker Store App merupakan aplikasi mobile berbasis Flutter yang digunakan untuk menampilkan katalog produk sneaker dengan tampilan modern dan interaktif.

Aplikasi ini terdiri dari satu sisi pengguna, yaitu sisi pelanggan (user). Berikut diuraikan hasil implementasi dan pengujian sistem secara menyeluru. 

1.	Antarmuka Halaman registrasi memungkinkan pengguna baru untuk mendaftarkan akun dengan mengisi data nama lengkap, email, nomor telpon dan kata sandi. Sistem akan menampilkan pesan kesalahan apabila data yang dimasukkan tidak lengkap atau format email tidak valid.
2.	<img width="754" height="1089" alt="create account" src="https://github.com/user-attachments/assets/955cc0d4-4ca3-4937-a193-5de0653541ce" />

3.	Antarmuka Login Halaman login memungkinkan pengguna yang telah terdaftar untuk masuk ke dalam sistem menggunakan email dan kata sandi minmal 6 karakter. Apabila kredensial yang dimasukkan tidak sesuai, sistem akan menampilkan notifikasi kesalahan dan pengguna diminta untuk memasukkan ulang data yang benar.

4.	Halaman Utama (Home) Halaman utama menampilkan antarmuka beranda aplikasi Sneaker Store yang dirancang dengan tema gelap (dark mode) dan aksen warna oranye. Halaman ini memuat beberapa komponen utama, yaitu bilah pencarian (search bar) untuk memudahkan pengguna menemukan produk, banner promosi yang menampilkan informasi diskon hingga 50%, filter kategori produk meliputi Sneakers, Running, Basketball, Casual, dan lainnya, serta daftar produk yang menampilkan nama produk, harga, dan tombol Add to Cart. Navigasi bawah (bottom navigation bar) menyediakan akses cepat ke halaman Home, Profile, dan Logout.
5.	Halaman Kategori Produk Halaman kategori menampilkan daftar produk yang telah difilter berdasarkan kategori yang dipilih pengguna. Pada halaman ini tersedia pilihan kategori Sneakers, Running, Basketball, Casual, dan Training yang dapat dipilih secara interaktif, di mana kategori yang sedang aktif ditandai dengan latar belakang berwarna oranye. Setiap produk ditampilkan dalam kartu (card) yang memuat gambar produk, nama produk, harga, dan tombol Add to Cart.
6.	Halaman Keranjang Belanja (My Cart) Halaman keranjang belanja menampilkan daftar produk yang telah ditambahkan oleh pengguna sebelum melanjutkan ke proses pembelian. Setiap item menampilkan gambar produk, nama, dan harga.


7.	Halaman Profil (Profile) Halaman profil memungkinkan pengguna untuk melihat dan memperbarui data diri secara langsung di dalam aplikasi. Terdapat foto profil pengguna yang dapat diganti melalui tombol kamera (icon camera) yang tersedia di pojok bawah foto. Data yang dapat diperbarui meliputi nama (Name), alamat email (Email), dan nomor telepon (Phone Number). Setelah melakukan perubahan, pengguna menekan tombol Save Changes untuk menyimpan data yang telah diperbarui. Halaman ini juga menyediakan tombol Logout untuk keluar dari sesi pengguna yang sedang aktif.
