<!DOCTYPE html>
<html lang="vi" class="scroll-smooth">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Akashic - DeFi & RWA trên nền tảng IOPN</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://tailwindcss.com"></script>
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cloudflare.com">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        darkbg: '#0B0F19',
                        darkcard: '#151D30',
                        accentcyan: '#00F2FE',
                        accentpurple: '#4FACFE',
                    },
                    boxShadow: {
                        'neon': '0 0 15px rgba(0, 242, 254, 0.4)',
                        'neon-purple': '0 0 15px rgba(79, 172, 254, 0.4)',
                    }
                }
            }
        }
    </script>
</head>
<body class="bg-darkbg text-gray-200 font-sans antialiased selection:bg-accentcyan selection:text-darkbg">

    <!-- Thanh Điều Hướng (Navbar) -->
    <nav class="fixed top-0 w-full z-50 bg-darkbg/80 backdrop-blur-md border-b border-gray-800">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-20 flex items-center justify-between">
            <div class="flex items-center space-x-3">
                <div class="w-10 h-10 rounded-xl bg-gradient-to-br from-accentcyan to-accentpurple flex items-center justify-center shadow-neon">
                    <i class="fa-solid fa-cube text-darkbg font-bold text-xl"></i>
                </div>
                <span class="text-2xl font-black tracking-wider text-transparent bg-clip-text bg-gradient-to-r from-accentcyan to-accentpurple">AKASHIC</span>
            </div>
            <div class="hidden md:flex items-center space-x-8 font-medium">
                <a href="#hero" class="hover:text-accentcyan transition-colors">Giới thiệu</a>
                <a href="#iopn" class="hover:text-accentcyan transition-colors">Mạng IOPN</a>
                <a href="#contracts" class="hover:text-accentcyan transition-colors">Hợp đồng thông minh</a>
                <a href="#roadmap" class="hover:text-accentcyan transition-colors">Lộ trình</a>
            </div>
            <button class="bg-gradient-to-r from-accentcyan to-accentpurple text-darkbg font-bold px-5 py-2.5 rounded-xl transition-all hover:scale-105 hover:shadow-neon">
                <i class="fa-solid fa-wallet mr-2"></i>Kết nối ví
            </button>
        </div>
    </nav>

    <!-- 1. Phần Giới Thiệu (Hero Section) -->
    <section id="hero" class="pt-32 pb-20 min-h-screen flex items-center relative overflow-hidden">
        <!-- Hiệu ứng nền mờ -->
        <div class="absolute top-1/4 left-1/4 w-96 h-96 bg-accentcyan/10 rounded-full blur-3xl"></div>
        <div class="absolute bottom-1/4 right-1/4 w-96 h-96 bg-accentpurple/10 rounded-full blur-3xl"></div>
        
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10 grid md:grid-cols-2 gap-12 items-center">
            <div>
                <span class="inline-flex items-center gap-2 px-3 py-1.5 rounded-full text-xs font-semibold bg-accentcyan/10 text-accentcyan border border-accentcyan/20 mb-6">
                    <span class="w-2 h-2 rounded-full bg-accentcyan animate-pulse"></span> DeFi Thế Hệ Mới
                </span>
                <h1 class="text-4xl sm:text-5xl lg:text-6xl font-black tracking-tight leading-tight text-white mb-6">
                    Akashic - Cầu nối <span class="text-transparent bg-clip-text bg-gradient-to-r from-accentcyan to-accentpurple">tài sản thực</span> và mạng lưới IOPN.
                </h1>
                <p class="text-gray-400 text-lg mb-8 leading-relaxed">
                    Nền tảng phân quyền cho phép bạn số hóa, phân đoạn và đầu tư vào các Tài sản Thực (RWA) như Bất động sản, Trái phiếu hoặc Nghệ thuật với độ an toàn tuyệt đối.
                </p>
                <div class="flex flex-col sm:flex-row gap-4">
                    <a href="#contracts" class="text-center bg-gradient-to-r from-accentcyan to-accentpurple text-darkbg font-bold px-8 py-4 rounded-xl transition-all hover:shadow-neon hover:-translate-y-1">
                        Khám phá hệ sinh thái
                    </a>
                    <a href="#" class="text-center border border-gray-700 bg-darkcard/50 text-white font-semibold px-8 py-4 rounded-xl hover:bg-darkcard hover:border-accentpurple transition-all hover:-translate-y-1">
                        Tham gia Staking
                    </a>
                </div>
            </div>
            <!-- Bảng số liệu mô phỏng trực quan -->
            <div class="bg-darkcard border border-gray-800 rounded-3xl p-6 lg:p-8 shadow-2xl relative">
                <div class="absolute top-0 right-0 w-24 h-24 bg-accentpurple/20 rounded-bl-full blur-2xl"></div>
                <h3 class="text-xl font-bold text-white mb-6 flex items-center gap-2">
                    <i class="fa-solid fa-chart-pie text-accentcyan"></i> Live Market Dashboard
                </h3>
                <div class="space-y-6">
                    <div class="p-4 bg-darkbg/60 border border-gray-800/80 rounded-2xl">
                        <p class="text-xs text-gray-500 font-medium uppercase tracking-wider mb-1">Tổng giá trị tài sản khóa (TVL)</p>
                        <p class="text-3xl font-black text-white">$142,508,390 <span class="text-xs text-green-400 font-semibold"><i class="fa-solid fa-caret-up"></i> +12.4%</span></p>
                    </div>
                    <div class="grid grid-cols-2 gap-4">
                        <div class="p-4 bg-darkbg/60 border border-gray-800/80 rounded-2xl">
                            <p class="text-xs text-gray-500 font-medium uppercase tracking-wider mb-1">Lợi suất APY trung bình</p>
                            <p class="text-2xl font-bold text-accentcyan">11.85%</p>
                        </div>
                        <div class="p-4 bg-darkbg/60 border border-gray-800/80 rounded-2xl">
                            <p class="text-xs text-gray-500 font-medium uppercase tracking-wider mb-1">Xác thực Neo ID</p>
                            <p class="text-2xl font-bold text-accentpurple">42,912 Ví</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 2. Tích hợp Mạng IOPN (IOPN Network Integration) -->
    <section id="iopn" class="py-24 bg-darkcard/30 border-y border-gray-900 relative">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="text-center max-w-3xl mx-auto mb-16">
                <h2 class="text-3xl sm:text-4xl font-extrabold text-white mb-4">Cơ sở hạ tầng mạng IOPN</h2>
                <p class="text-gray-400">Akashic vận hành trên hệ sinh thái Layer 1 toàn cầu chú trọng vào chủ quyền kỹ thuật số và định danh người dùng.</p>
            </div>
            <div class="grid md:grid-cols-2 gap-8">
                <div class="bg-darkcard border border-gray-800 p-8 rounded-2xl hover:border-accentcyan/30 transition-all group">
                    <div class="w-12 h-12 rounded-xl bg-accentcyan/10 border border-accentcyan/20 flex items-center justify-center text-accentcyan text-xl mb-6 group-hover:bg-accentcyan group-hover:text-darkbg transition-all">
                        <i class="fa-solid fa-id-card-clip"></i>
                    </div>
                    <h3 class="text-xl font-bold text-white mb-3">Neo ID - Định danh phi tập trung</h3>
                    <p class="text-gray-400 leading-relaxed">
                        Hợp đồng thông minh định danh phi tập trung tiên tiến. Người dùng thực hiện xác thực danh tính một lần duy nhất để đảm bảo tuân thủ pháp lý toàn diện (KYC) khi thực hiện giao dịch các tài sản lớn trên chuỗi.
                    </p>
                </div>
                <div class="bg-darkcard border border-gray-800 p-8 rounded-2xl hover:border-accentpurple/30 transition-all group">
                    <div class="w-12 h-12 rounded-xl bg-accentpurple/10 border border-accentpurple/20 flex items-center justify-center text-accentpurple text-xl mb-6 group-hover:bg-accentpurple group-hover:text-darkbg transition-all">
                        <i class="fa-solid fa-bolt"></i>
                    </div>
                    <h3 class="text-xl font-bold text-white mb-3">Tốc độ tối ưu & Chi phí cực thấp</h3>
                    <p class="text-gray-400 leading-relaxed">
                        Xây dựng trên nền tảng OPN Chain vững chắc, hỗ trợ hiệu năng xử lý mạnh mẽ vượt ngưỡng <strong>10,000 TPS</strong> với mức phí gas siêu thấp, giúp các hợp đồng thông minh phức tạp thực thi mượt mà.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- 3. Hợp đồng thông minh (Smart Contracts) -->
    <section id="contracts" class="py-24">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="text-center max-w-3xl mx-auto mb-16">
                <h2 class="text-3xl sm:text-4xl font-extrabold text-white mb-4">Lớp Hợp đồng Thông minh Cốt lõi</h2>
                <p class="text-gray-400">Kiến trúc an toàn mã hóa tự động hóa hoàn toàn quy trình xử lý tài sản và bảo mật danh tính người dùng.</p>
            </div>
            <div class="grid md:grid-cols-2 gap-8">
                <!-- Hợp đồng A -->
                <div class="bg-darkcard border border-gray-800 rounded-2xl overflow-hidden flex flex-col justify-between">
                    <div class="p-8">
                        <div class="flex items-center justify-between mb-6">
                            <span class="text-xs font-bold uppercase tracking-wider text-accentcyan bg-accentcyan/10 px-3 py-1 rounded-md border border-accentcyan/20">Mã hóa RWA</span>
