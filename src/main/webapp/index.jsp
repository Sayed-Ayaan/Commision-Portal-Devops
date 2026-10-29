<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en-IN" class="h-full bg-slate-900">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ApexShield India - Agent Commission Portal</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Chart.js CDN -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        tailwind.config = {
            darkMode: 'class',
            theme: {
                extend: {
                    colors: {
                        navy: {
                            800: '#0f172a',
                            900: '#0a0f1d',
                            950: '#050811'
                        },
                        emerald: {
                            400: '#34d399',
                            500: '#10b981',
                            600: '#059669'
                        }
                    }
                }
            }
        }
    </script>
    <style>
        /* Custom Scrollbars and Glassmorphism */
        ::-webkit-scrollbar {
            width: 6px;
            height: 6px;
        }
        ::-webkit-scrollbar-track {
            background: rgba(15, 23, 42, 0.6);
        }
        ::-webkit-scrollbar-thumb {
            background: rgba(51, 65, 85, 0.8);
            border-radius: 4px;
        }
        ::-webkit-scrollbar-thumb:hover {
            background: rgba(71, 85, 105, 1);
        }
        .glass-panel {
            background: rgba(15, 23, 42, 0.75);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.08);
        }
        .light .glass-panel {
            background: rgba(255, 255, 255, 0.85);
            border: 1px solid #dbe3ee;
            box-shadow: 0 8px 24px rgba(15, 23, 42, 0.05);
        }
        body.light {
            background-color: #f1f5f9 !important;
            color: #0f172a !important;
        }
        .light [class~="bg-slate-950"] { background-color: #f8fafc !important; }
        .light [class~="bg-slate-900"], .light [class~="bg-slate-900/80"], .light [class~="bg-slate-900/90"],
        .light [class~="bg-slate-800"], .light [class~="bg-slate-800/50"], .light [class~="bg-slate-800/40"] {
            background-color: #f8fafc !important;
        }
        .light [class~="bg-gradient-to-br"] { background-image: none !important; background-color: #fff !important; }
        .light [class~="text-white"], .light [class~="text-slate-100"], .light [class~="text-slate-200"] { color: #0f172a !important; }
        .light [class~="text-slate-300"], .light [class~="text-slate-400"] { color: #475569 !important; }
        .light [class~="text-slate-500"] { color: #64748b !important; }
        .light [class~="border-slate-800"], .light [class~="border-slate-800/80"], .light [class~="border-slate-700"] { border-color: #cbd5e1 !important; }
        .light [class~="divide-slate-800/60"] > :not([hidden]) ~ :not([hidden]) { border-color: #e2e8f0 !important; }
        .light input, .light select, .light textarea { color: #0f172a !important; background-color: #fff !important; border-color: #cbd5e1 !important; }
        .light input::placeholder { color: #94a3b8 !important; }
        .light table thead { background-color: #e2e8f0 !important; }
        .light footer { background-color: #f8fafc !important; border-color: #cbd5e1 !important; }
        .light .hover\:bg-slate-800\/80:hover, .light .hover\:bg-slate-800\/40:hover, .light .hover\:bg-slate-700:hover { background-color: #e2e8f0 !important; }
        .light .hover\:text-white:hover { color: #0f172a !important; }
        .light ::-webkit-scrollbar-track { background: #e2e8f0; }
        .light ::-webkit-scrollbar-thumb { background: #94a3b8; }
        }
    </style>
</head>
<body class="h-full text-slate-100 bg-slate-950 font-sans antialiased transition-colors duration-200" id="bodyRoot">

    <!-- Toast Notification Container -->
    <div id="toastContainer" class="fixed top-5 right-5 z-50 flex flex-col gap-3 pointer-events-none"></div>

    <div class="min-h-full flex flex-col">
        <!-- 1. HEADER & NAVIGATION -->
        <header class="sticky top-0 z-40 glass-panel border-b border-slate-800/80 shadow-lg">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="flex items-center justify-between h-16">
                    <!-- Brand / Logo -->
                    <div class="flex items-center gap-3">
                        <div class="bg-gradient-to-tr from-emerald-600 to-teal-400 p-2.5 rounded-xl text-slate-950 shadow-md shadow-emerald-500/20">
                            <i class="fa-solid fa-shield-halved text-xl"></i>
                        </div>
                        <div>
                            <span class="text-lg font-bold tracking-tight text-white flex items-center gap-2">
                                ApexShield India <span class="text-xs px-2 py-0.5 rounded bg-emerald-500/10 text-emerald-400 border border-emerald-500/20 font-semibold">INDIA</span>
                            </span>
                            <p class="text-xs text-slate-400">Agent Commission & Policy Desk &middot; India</p>
                        </div>
                    </div>

                    <!-- User Profile & Action Controls -->
                    <div class="flex items-center gap-4">
                        <div class="hidden sm:flex items-center gap-3 border-r border-slate-800 pr-4">
                            <div class="w-9 h-9 rounded-full bg-gradient-to-br from-indigo-500 to-purple-600 flex items-center justify-center font-bold text-white shadow-inner">
                                AS
                            </div>
                            <div class="text-left">
                                <div class="text-sm font-semibold text-slate-200">Ayaan Sayed</div>
                        <div class="text-xs text-slate-400 font-mono">Advisor ID: AGT-99042</div>
                            </div>
                        </div>

                        <!-- Dark/Light Theme Toggle -->
                        <button id="themeToggle" onclick="toggleTheme()" aria-label="Toggle light or dark theme" aria-pressed="false" class="p-2 text-slate-400 hover:text-amber-400 hover:bg-slate-800/80 rounded-lg transition-all" title="Toggle Theme">
                            <i class="fa-solid fa-moon text-lg" id="themeIcon"></i>
                        </button>
                    </div>
                </div>
            </div>
        </header>

        <!-- MAIN CONTENT AREA -->
        <main class="flex-1 max-w-7xl w-full mx-auto px-4 sm:px-6 lg:px-8 py-8 space-y-8">

            <nav class="flex flex-wrap gap-2 border-b border-slate-800 pb-3" role="tablist" aria-label="Portal sections">
                <button type="button" role="tab" aria-selected="true" onclick="switchTab('dashboard')" data-tab="dashboard" class="portal-tab px-4 py-2 rounded-xl text-sm font-semibold bg-emerald-500/15 text-emerald-300 border border-emerald-500/30"><i class="fa-solid fa-chart-line mr-2"></i>Dashboard</button>
                <button type="button" role="tab" aria-selected="false" onclick="switchTab('calculator')" data-tab="calculator" class="portal-tab px-4 py-2 rounded-xl text-sm font-semibold text-slate-400 hover:text-white hover:bg-slate-800"><i class="fa-solid fa-calculator mr-2"></i>Add Policy</button>
                <button type="button" role="tab" aria-selected="false" onclick="switchTab('policies')" data-tab="policies" class="portal-tab px-4 py-2 rounded-xl text-sm font-semibold text-slate-400 hover:text-white hover:bg-slate-800"><i class="fa-solid fa-table-list mr-2"></i>Policy Register</button>
                <button type="button" role="tab" aria-selected="false" onclick="switchTab('renewals')" data-tab="renewals" class="portal-tab px-4 py-2 rounded-xl text-sm font-semibold text-slate-400 hover:text-white hover:bg-slate-800"><i class="fa-solid fa-calendar-check mr-2"></i>Renewals</button>
            </nav>

            <!-- 2. ANALYTICS OVERVIEW DASHBOARD -->
            <section id="dashboardSection" class="space-y-6" role="tabpanel">
                <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
                    <div>
                        <h1 class="text-2xl font-bold text-white tracking-tight">Advisor Dashboard</h1>
                        <p class="text-sm text-slate-400">Commission tracking, policy servicing and renewal follow-ups &middot; India</p>
                    </div>
                    <div class="flex items-center gap-2">
                        <button onclick="refreshData()" class="px-3 py-1.5 bg-slate-800 hover:bg-slate-700 text-slate-300 text-xs font-medium rounded-lg border border-slate-700 flex items-center gap-2 transition-all">
                            <i class="fa-solid fa-rotate-right" id="refreshIcon"></i> Sync Data
                        </button>
                        <span class="text-xs text-slate-500 font-mono">Updated: Just now</span>
                    </div>
                </div>

                <!-- Dynamic KPI Cards -->
                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-5">
                    <!-- KPI 1 -->
                    <div class="glass-panel p-5 rounded-2xl relative overflow-hidden group hover:border-slate-700 transition-all">
                        <div class="flex items-center justify-between">
                            <span class="text-xs font-semibold text-slate-400 uppercase tracking-wider">Total Commission</span>
                            <div class="p-2.5 bg-emerald-500/10 text-emerald-400 rounded-xl border border-emerald-500/20">
                                <i class="fa-solid fa-sack-dollar text-lg"></i>
                            </div>
                        </div>
                        <div class="mt-3">
                            <div class="text-2xl font-black text-white font-mono" id="kpiTotalEarnings">&#8377;24,850.00</div>
                            <div class="mt-1 flex items-center gap-1.5 text-xs text-emerald-400">
                                <i class="fa-solid fa-arrow-trend-up"></i>
                                <span>+14.2% from last month</span>
                            </div>
                        </div>
                    </div>

                    <!-- KPI 2 -->
                    <div class="glass-panel p-5 rounded-2xl relative overflow-hidden group hover:border-slate-700 transition-all">
                        <div class="flex items-center justify-between">
                            <span class="text-xs font-semibold text-slate-400 uppercase tracking-wider">Active Policies</span>
                            <div class="p-2.5 bg-blue-500/10 text-blue-400 rounded-xl border border-blue-500/20">
                                <i class="fa-solid fa-file-contract text-lg"></i>
                            </div>
                        </div>
                        <div class="mt-3">
                            <div class="text-2xl font-black text-white font-mono" id="kpiActivePolicies">142</div>
                            <div class="mt-1 flex items-center gap-1.5 text-xs text-blue-400">
                                <i class="fa-solid fa-plus"></i>
                                <span id="kpiNewThisWeek">0 new this week</span>
                            </div>
                        </div>
                    </div>

                    <!-- KPI 3 -->
                    <div class="glass-panel p-5 rounded-2xl relative overflow-hidden group hover:border-slate-700 transition-all">
                        <div class="flex items-center justify-between">
                            <span class="text-xs font-semibold text-slate-400 uppercase tracking-wider">Pending Approvals</span>
                            <div class="p-2.5 bg-amber-500/10 text-amber-400 rounded-xl border border-amber-500/20">
                                <i class="fa-solid fa-clock-rotate-left text-lg"></i>
                            </div>
                        </div>
                        <div class="mt-3">
                            <div class="text-2xl font-black text-white font-mono" id="kpiPendingCount">8</div>
                            <div class="mt-1 flex items-center gap-1.5 text-xs text-amber-400">
                                <i class="fa-solid fa-list-check text-[10px]"></i>
                                <span>Submitted or under review</span>
                            </div>
                        </div>
                    </div>

                    <!-- KPI 4 -->
                    <div class="glass-panel p-5 rounded-2xl relative overflow-hidden group hover:border-slate-700 transition-all">
                        <div class="flex items-center justify-between">
                            <span class="text-xs font-semibold text-slate-400 uppercase tracking-wider">Renewals Due &middot; 30 Days</span>
                            <div class="p-2.5 bg-purple-500/10 text-purple-400 rounded-xl border border-purple-500/20">
                                <i class="fa-solid fa-percent text-lg"></i>
                            </div>
                        </div>
                        <div class="mt-3">
                            <div class="text-2xl font-black text-white font-mono" id="kpiRenewals">0</div>
                            <div class="mt-1 flex items-center gap-1.5 text-xs text-purple-400">
                                <i class="fa-solid fa-calendar-check"></i>
                                <span>Policies expiring soon</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Interactive Charts Grid -->
                <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
                    <!-- Monthly Trend Chart -->
                    <div class="lg:col-span-2 glass-panel p-5 rounded-2xl space-y-4">
                        <div class="flex items-center justify-between">
                            <h3 class="text-base font-bold text-white flex items-center gap-2">
                                <i class="fa-solid fa-chart-line text-emerald-400"></i> Monthly Commission Trend (&#8377;)
                            </h3>
                            <span class="text-xs text-slate-400 font-mono">FY 2026</span>
                        </div>
                        <div class="h-64 relative">
                            <canvas id="monthlyTrendChart"></canvas>
                        </div>
                    </div>

                    <!-- Product Breakdown Chart -->
                    <div class="glass-panel p-5 rounded-2xl space-y-4">
                        <div class="flex items-center justify-between">
                            <h3 class="text-base font-bold text-white flex items-center gap-2">
                                <i class="fa-solid fa-chart-pie text-purple-400"></i> Product Portfolio
                            </h3>
                            <span class="text-xs text-slate-400">Share %</span>
                        </div>
                        <div class="h-64 relative flex items-center justify-center">
                            <canvas id="productBreakdownChart"></canvas>
                        </div>
                    </div>
                </div>
            </section>

            <!-- 3. COMMISSION CALCULATOR TOOL & ACTIVE QUEUE -->
            <section id="calculatorSection" class="grid grid-cols-1 lg:grid-cols-12 gap-6 hidden" role="tabpanel">
                <!-- Calculator Form -->
                <div class="lg:col-span-7 glass-panel p-6 rounded-2xl space-y-5 border-l-4 border-l-emerald-500">
                    <div>
                        <h2 class="text-lg font-bold text-white flex items-center gap-2">
                            <i class="fa-solid fa-calculator text-emerald-400"></i> Instant Commission Calculator
                        </h2>
                        <p class="text-xs text-slate-400">Estimate commission and add a policy to your register.</p>
                    </div>

                    <form id="calculatorForm" onsubmit="handlePolicySubmit(event)" class="space-y-4">
                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                            <div>
                                <label class="block text-xs font-semibold text-slate-300 mb-1">Client Full Name *</label>
                                <input type="text" id="calcClient" required minlength="2" maxlength="80" autocomplete="name" oninput="validatePolicyholder(this)" placeholder="e.g. Aditi Sharma" class="w-full bg-slate-900 border border-slate-700 rounded-xl px-3.5 py-2 text-sm text-white focus:outline-none focus:border-emerald-500 transition-colors">
                            </div>
                            <div>
                                <label class="block text-xs font-semibold text-slate-300 mb-1">Insurance Type *</label>
                                <select id="calcType" onchange="calculatePayout()" required class="w-full bg-slate-900 border border-slate-700 rounded-xl px-3.5 py-2 text-sm text-white focus:outline-none focus:border-emerald-500 transition-colors">
                                    <option value="Motor">Motor (10%)</option>
                                    <option value="Health">Health (12.5%)</option>
                                    <option value="Life" selected>Life (15%)</option>
                                    <option value="Personal Accident">Personal Accident (8%)</option>
                                    <option value="Travel">Travel (8%)</option>
                                    <option value="Home">Home (8%)</option>
                                </select>
                            </div>
                        </div>

                        <div class="grid grid-cols-1 sm:grid-cols-3 gap-4">
                            <div>
                                <label class="block text-xs font-semibold text-slate-300 mb-1">Annual Premium (&#8377;) *</label>
                                <input type="number" id="calcPremium" value="45000" min="100" max="100000000" step="any" oninput="validatePremium(this); calculatePayout()" required aria-describedby="premiumHelp" class="w-full bg-slate-900 border border-slate-700 rounded-xl px-3.5 py-2 text-sm text-white focus:outline-none focus:border-emerald-500 transition-colors font-mono">
                                <p id="premiumHelp" class="text-[11px] text-slate-500 mt-1">Enter an amount from ₹100 to ₹10 crore.</p>
                            </div>
                            <div>
                                <label class="block text-xs font-semibold text-slate-300 mb-1">Term Length *</label>
                                <select id="calcTerm" required class="w-full bg-slate-900 border border-slate-700 rounded-xl px-3.5 py-2 text-sm text-white focus:outline-none focus:border-emerald-500 transition-colors">
                                    <option value="1 Year">1 Year</option>
                                    <option value="3 Years">3 Years</option>
                                    <option value="5 Years" selected>5 Years</option>
                                    <option value="10+ Years">10+ Years</option>
                                </select>
                            </div>
                            <div>
                                <label class="block text-xs font-semibold text-slate-300 mb-1">Agent Tier Modifier *</label>
                                <select id="calcTier" onchange="calculatePayout()" required class="w-full bg-slate-900 border border-slate-700 rounded-xl px-3.5 py-2 text-sm text-white focus:outline-none focus:border-emerald-500 transition-colors">
                                    <option value="1.0">Standard Tier (1.0x)</option>
                                    <option value="1.15" selected>Senior Tier (1.15x)</option>
                                    <option value="1.3">Premier Tier (1.3x)</option>
                                </select>
                            </div>
                        </div>

                        <div class="grid grid-cols-1 sm:grid-cols-3 gap-4">
                            <div><label class="block text-xs font-semibold text-slate-300 mb-1">Renewal / Expiry Date *</label><input type="date" id="calcExpiry" required class="w-full bg-slate-900 border border-slate-700 rounded-xl px-3.5 py-2 text-sm text-white"></div>
                            <div><label class="block text-xs font-semibold text-slate-300 mb-1">Policy State / UT *</label><select id="calcState" required class="w-full bg-slate-900 border border-slate-700 rounded-xl px-3.5 py-2 text-sm text-white">
                                <option value="">Select state / UT</option>
                                <option>Andhra Pradesh</option><option>Arunachal Pradesh</option><option>Assam</option><option>Bihar</option><option>Chhattisgarh</option><option>Goa</option><option>Gujarat</option><option>Haryana</option><option>Himachal Pradesh</option><option>Jharkhand</option><option>Karnataka</option><option>Kerala</option><option>Madhya Pradesh</option><option>Maharashtra</option><option>Manipur</option><option>Meghalaya</option><option>Mizoram</option><option>Nagaland</option><option>Odisha</option><option>Punjab</option><option>Rajasthan</option><option>Sikkim</option><option>Tamil Nadu</option><option>Telangana</option><option>Tripura</option><option>Uttar Pradesh</option><option>Uttarakhand</option><option>West Bengal</option>
                                <option>Andaman and Nicobar Islands</option><option>Chandigarh</option><option>Dadra and Nagar Haveli and Daman and Diu</option><option>Delhi</option><option>Jammu and Kashmir</option><option>Ladakh</option><option>Lakshadweep</option><option>Puducherry</option>
                            </select></div>
                            <div><label class="block text-xs font-semibold text-slate-300 mb-1">Preferred payout rail *</label><select id="calcPayoutMode" required class="w-full bg-slate-900 border border-slate-700 rounded-xl px-3.5 py-2 text-sm text-white"><option value="">Select payout method</option><option>NEFT / bank transfer</option><option>UPI (insurer-supported)</option></select></div>
                        </div>

                        <div class="pt-2">
                            <button type="submit" class="w-full bg-gradient-to-r from-emerald-600 to-teal-500 hover:from-emerald-500 hover:to-teal-400 text-slate-950 font-bold py-2.5 px-4 rounded-xl shadow-lg shadow-emerald-500/20 flex items-center justify-center gap-2 transition-all">
                                <i class="fa-solid fa-paper-plane text-sm"></i> Add Policy to Register
                            </button>
                        </div>
                    </form>
                </div>

                <!-- Calculation Live Output Card -->
                <div class="lg:col-span-5 glass-panel p-6 rounded-2xl flex flex-col justify-between space-y-4 bg-gradient-to-br from-slate-900/90 to-slate-800/50">
                    <div>
                        <div class="flex items-center justify-between border-b border-slate-800 pb-3">
                            <span class="text-xs font-bold text-slate-400 uppercase tracking-wider">Live Projection</span>
                            <span class="text-xs px-2 py-0.5 rounded bg-emerald-500/20 text-emerald-400 font-mono">Calculated Real-Time</span>
                        </div>

                        <div class="mt-4 space-y-3 font-mono">
                            <div class="flex justify-between items-center text-sm">
                                <span class="text-slate-400">Base Commission Rate:</span>
                                <span class="text-slate-200 font-bold" id="outBaseRate">15.0%</span>
                            </div>
                            <div class="flex justify-between items-center text-sm">
                                <span class="text-slate-400">Effective Rate (w/ Tier):</span>
                                <span class="text-teal-400 font-bold" id="outEffRate">17.25%</span>
                            </div>
                            <div class="flex justify-between items-center text-sm">
                                <span class="text-slate-400">Calculated Commission:</span>
                                <span class="text-white font-bold" id="outGross">&#8377;7,762.50</span>
                            </div>
                        </div>
                    </div>

                </div>
            </section>

            <!-- 4. POLICY & COMMISSION REGISTRY TABLE -->
            <section id="policySection" class="glass-panel rounded-2xl overflow-hidden space-y-4 hidden" role="tabpanel">
                <div class="p-6 border-b border-slate-800/80 flex flex-col md:flex-row md:items-center justify-between gap-4">
                    <div>
                        <h2 class="text-lg font-bold text-white flex items-center gap-2">
                            <i class="fa-solid fa-table-list text-blue-400"></i> <span id="registryHeading">Commission Registry</span>
                        </h2>
                        <p class="text-xs text-slate-400">Search, track renewals and export your current policy list.</p>
                    </div>

                    <!-- Search and Filters -->
                    <div class="flex flex-wrap items-center gap-3">
                        <button onclick="exportPolicies()" class="px-3 py-1.5 text-xs rounded-xl border border-emerald-500/30 text-emerald-300 hover:bg-emerald-500/10"><i class="fa-solid fa-file-csv mr-1"></i> Export CSV</button>
                        <div class="relative min-w-[200px]">
                            <i class="fa-solid fa-magnifying-glass absolute left-3 top-2.5 text-xs text-slate-500"></i>
                            <input type="text" id="searchInput" oninput="filterTable()" placeholder="Search client or policy..." class="w-full bg-slate-900 border border-slate-700 rounded-xl pl-8 pr-3 py-1.5 text-xs text-white focus:outline-none focus:border-emerald-500 transition-colors">
                        </div>
                        <select id="statusFilter" onchange="filterTable()" class="bg-slate-900 border border-slate-700 rounded-xl px-3 py-1.5 text-xs text-white focus:outline-none focus:border-emerald-500 transition-colors">
                            <option value="ALL">All Statuses</option>
                            <option value="Submitted">Submitted</option>
                            <option value="Under Review">Under Review</option>
                            <option value="Approved">Approved</option>
                            <option value="Payout Due">Payout Due</option>
                            <option value="Paid">Paid</option>
                            <option value="Rejected">Rejected</option>
                        </select>
                        <select id="productFilter" onchange="filterTable()" class="bg-slate-900 border border-slate-700 rounded-xl px-3 py-1.5 text-xs text-white focus:outline-none focus:border-emerald-500 transition-colors"><option value="ALL">All Products</option><option>Life</option><option>Health</option><option>Motor</option><option>Travel</option><option>Home</option><option>Personal Accident</option></select>
                    </div>
                </div>

                <!-- Table Container -->
                <div class="overflow-x-auto">
                    <table class="w-full text-left text-xs">
                        <thead class="bg-slate-900/90 text-slate-400 uppercase tracking-wider font-semibold border-b border-slate-800">
                            <tr>
                                <th class="py-3.5 px-4">Policy ID</th>
                                <th class="py-3.5 px-4">Client Name</th>
                                <th class="py-3.5 px-4">Type</th>
                                <th class="py-3.5 px-4 text-right">Premium (&#8377;)</th>
                                <th class="py-3.5 px-4 text-right">Rate (%)</th>
                                <th class="py-3.5 px-4 text-right">Payout (&#8377;)</th>
                                <th class="py-3.5 px-4">Renewal</th>
                                <th class="py-3.5 px-4 text-center">Status</th>
                                <th class="py-3.5 px-4 text-center">Actions</th>
                            </tr>
                        </thead>
                        <tbody id="policyTableBody" class="divide-y divide-slate-800/60 font-mono">
                            <!-- Rows inserted dynamically via JavaScript -->
                        </tbody>
                    </table>
                </div>

                <!-- Table Footer / Pagination -->
                <div class="p-4 border-t border-slate-800 flex items-center justify-between text-xs text-slate-400">
                    <div id="tablePaginationInfo">Showing 1 to 5 of 5 entries</div>
                    <div class="flex gap-1">
                        <button id="previousPageButton" type="button" onclick="changePage(-1)" class="px-2.5 py-1 bg-slate-800 hover:bg-slate-700 rounded text-slate-300 disabled:opacity-50">Previous</button>
                        <span id="currentPageIndicator" class="px-2.5 py-1 bg-emerald-500/20 text-emerald-400 border border-emerald-500/30 rounded font-bold">1 / 1</span>
                        <button id="nextPageButton" type="button" onclick="changePage(1)" class="px-2.5 py-1 bg-slate-800 hover:bg-slate-700 rounded text-slate-300 disabled:opacity-50">Next</button>
                    </div>
                </div>
            </section>
        </main>

        <!-- FOOTER -->
        <footer class="mt-auto border-t border-slate-800/80 bg-slate-950 py-6 text-center text-xs text-slate-500">
            <div class="max-w-7xl mx-auto px-4 flex flex-col sm:flex-row items-center justify-between gap-3">
                <div>ApexShield Insurance Infrastructure &copy; 2026. All Rights Reserved.</div>
            </div>
        </footer>
    </div>

    <div id="policyDetailsModal" class="fixed inset-0 z-50 bg-slate-950/80 backdrop-blur-sm hidden items-center justify-center p-4" role="dialog" aria-modal="true" aria-labelledby="policyDetailsTitle" onclick="if(event.target===this) closePolicyDetails()">
        <div class="glass-panel max-w-lg w-full rounded-2xl border border-slate-700 shadow-2xl overflow-hidden">
            <div class="p-5 border-b border-slate-800 flex items-center justify-between">
                <div><h2 id="policyDetailsTitle" class="text-lg font-bold text-white">Policy history</h2><p id="policyDetailsSummary" class="text-xs text-slate-400 mt-1"></p></div>
                <button type="button" onclick="closePolicyDetails()" aria-label="Close policy details" class="p-2 text-slate-400 hover:text-white rounded-lg"><i class="fa-solid fa-xmark"></i></button>
            </div>
            <div class="p-5"><h3 class="text-xs uppercase tracking-wider text-slate-400 font-bold mb-4">Status history</h3><ol id="policyHistoryList" class="space-y-4"></ol></div>
        </div>
    </div>

    <!-- 5. DEVOPS & SYSTEM DIAGNOSTICS MODAL -->
    <div id="devopsModal" class="fixed inset-0 z-50 bg-slate-950/80 backdrop-blur-sm hidden items-center justify-center p-4">
        <div class="glass-panel max-w-2xl w-full rounded-2xl overflow-hidden border border-slate-700 shadow-2xl flex flex-col max-h-[90vh]">
            <div class="p-5 border-b border-slate-800 flex items-center justify-between bg-slate-900/80">
                <div class="flex items-center gap-3">
                    <div class="p-2 bg-emerald-500/10 text-emerald-400 rounded-lg">
                        <i class="fa-solid fa-server text-lg"></i>
                    </div>
                    <div>
                        <h3 class="text-base font-bold text-white">DevOps & Pipeline Diagnostics</h3>
                        <p class="text-xs text-slate-400 font-mono">Environment: Localhost Docker Daemon</p>
                    </div>
                </div>
                <button onclick="toggleDevOpsModal()" class="text-slate-400 hover:text-white p-1 rounded-lg">
                    <i class="fa-solid fa-xmark text-lg"></i>
                </button>
            </div>

            <div class="p-6 overflow-y-auto space-y-6 font-mono text-xs">
                <!-- System Health Badges -->
                <div class="grid grid-cols-2 sm:grid-cols-3 gap-3">
                    <div class="bg-slate-900 p-3 rounded-xl border border-slate-800">
                        <div class="text-slate-500 text-[10px]">CONTAINER STATUS</div>
                        <div class="text-emerald-400 font-bold mt-1 flex items-center gap-1.5">
                            <i class="fa-solid fa-circle text-[8px] animate-pulse"></i> Healthy (200 OK)
                        </div>
                    </div>
                    <div class="bg-slate-900 p-3 rounded-xl border border-slate-800">
                        <div class="text-slate-500 text-[10px]">DOCKER IMAGE</div>
                        <div class="text-slate-200 font-bold mt-1 truncate">commission-portal:v1.0.0</div>
                    </div>
                    <div class="bg-slate-900 p-3 rounded-xl border border-slate-800">
                        <div class="text-slate-500 text-[10px]">RUNTIME STACK</div>
                        <div class="text-slate-200 font-bold mt-1">Tomcat 10.1 / Java 25</div>
                    </div>
                </div>

                <!-- Pipeline Stage Monitor -->
                <div class="space-y-3">
                    <div class="text-slate-300 font-bold flex justify-between items-center">
                        <span>Jenkins Declarative Pipeline Status</span>
                        <span class="text-emerald-400 text-[11px] bg-emerald-500/10 px-2 py-0.5 rounded border border-emerald-500/20">Build #14 Passed</span>
                    </div>

                    <div class="space-y-2">
                        <!-- Stage 1 -->
                        <div class="bg-slate-900/90 p-2.5 rounded-lg border border-slate-800 flex items-center justify-between">
                            <span class="text-slate-300 flex items-center gap-2"><i class="fa-solid fa-check text-emerald-400"></i> Stage 1: Maven Code Compile</span>
                            <span class="text-slate-500">mvn compile (2.4s)</span>
                        </div>
                        <!-- Stage 2 -->
                        <div class="bg-slate-900/90 p-2.5 rounded-lg border border-slate-800 flex items-center justify-between">
                            <span class="text-slate-300 flex items-center gap-2"><i class="fa-solid fa-check text-emerald-400"></i> Stage 2: Selenium WebDriver Tests</span>
                            <span class="text-emerald-400 font-semibold">100% Passed (4.1s)</span>
                        </div>
                        <!-- Stage 3 -->
                        <div class="bg-slate-900/90 p-2.5 rounded-lg border border-slate-800 flex items-center justify-between">
                            <span class="text-slate-300 flex items-center gap-2"><i class="fa-solid fa-check text-emerald-400"></i> Stage 3: Docker Build & Run</span>
                            <span class="text-slate-500">Port 8085:8080 (1.8s)</span>
                        </div>
                        <!-- Stage 4 -->
                        <div class="bg-slate-900/90 p-2.5 rounded-lg border border-slate-800 flex items-center justify-between">
                            <span class="text-slate-300 flex items-center gap-2"><i class="fa-solid fa-check text-emerald-400"></i> Stage 4: PowerShell Config Check</span>
                            <span class="text-slate-500">Verified (0.6s)</span>
                        </div>
                    </div>
                </div>

                <!-- Live Container Console Log Simulator -->
                <div class="space-y-2">
                    <div class="text-slate-300 font-bold">Tomcat Application Terminal Logs</div>
                    <div class="bg-slate-950 p-3 rounded-xl border border-slate-800 h-28 overflow-y-auto text-[11px] text-slate-400 space-y-1 font-mono">
                        <div>[INFO] --- tomcat-maven-plugin:2.2:run (default-cli) @ commission-portal ---</div>
                        <div>[INFO] Running on Apache Tomcat/10.1.x JVM/JDK 25 (Oracle Corporation)</div>
                        <div>[INFO] Deployment of WAR artifact [target/commission-portal.war] finished in 1,204 ms</div>
                        <div>[INFO] Registered CommissionCalculatorServlet at /api/calculate</div>
                        <div>[INFO] Registered PolicyRegistryServlet at /api/policies</div>
                        <div class="text-emerald-400">[SUCCESS] Container initialization complete. Listening on 0.0.0.0:8085</div>
                    </div>
                </div>
            </div>

            <div class="p-4 border-t border-slate-800 bg-slate-900/80 flex justify-end">
                <button onclick="toggleDevOpsModal()" class="px-4 py-1.5 bg-slate-800 hover:bg-slate-700 text-slate-200 text-xs rounded-xl font-bold transition-all">Close Window</button>
            </div>
        </div>
    </div>

    <!-- JAVASCRIPT APPLICATION LOGIC -->
    <script>
        // Initial Policy Dataset
        const commissionRates = { Motor: 10.0, Health: 12.5, Life: 15.0, 'Personal Accident': 8.0, Travel: 8.0, Home: 8.0 };
        const nextStatuses = {
            'Submitted': ['Under Review', 'Rejected'],
            'Under Review': ['Approved', 'Rejected'],
            'Approved': ['Payout Due'],
            'Payout Due': ['Paid'],
            'Paid': [],
            'Rejected': []
        };
        function dateAfter(days) { const date = new Date(); date.setDate(date.getDate() + days); return [date.getFullYear(), String(date.getMonth() + 1).padStart(2, '0'), String(date.getDate()).padStart(2, '0')].join('-'); }
        function dateMonthsAgo(months) { const date = new Date(); date.setDate(1); date.setMonth(date.getMonth() - months); return [date.getFullYear(), String(date.getMonth() + 1).padStart(2, '0'), String(date.getDate())].join('-'); }
        function todayLocalISO() { const date = new Date(); return [date.getFullYear(), String(date.getMonth() + 1).padStart(2, '0'), String(date.getDate())].join('-'); }
        function formatINR(amount) { return new Intl.NumberFormat('en-IN', { style: 'currency', currency: 'INR', minimumFractionDigits: 2, maximumFractionDigits: 2 }).format(amount || 0); }
        function getCommissionProjection(premium, type, tierMultiplier) {
            const baseRate = commissionRates[type] || 0;
            const effectiveRate = baseRate * tierMultiplier;
            return { baseRate, effectiveRate, payout: Math.round((premium * effectiveRate / 100) * 100) / 100 };
        }
        function escapeHtml(value) { return String(value || '').replace(/[&<>"']/g, char => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[char])); }
        function persistPolicies() { localStorage.setItem('apexShieldIndiaPolicies', JSON.stringify(policyRegistry)); }
        function csvCell(value) { return '"' + String(value ?? '').replace(/"/g, '""') + '"'; }
        function downloadCSV(filename, rows) {
            const blob = new Blob(['\uFEFF' + rows.map(row => row.map(csvCell).join(',')).join('\r\n')], {type: 'text/csv;charset=utf-8'});
            const link = document.createElement('a'); link.href = URL.createObjectURL(blob); link.download = filename; link.click(); URL.revokeObjectURL(link.href);
        }
        function exportPolicies() {
            const rows = [['Policy ID','Policyholder','Product','State / UT','Annual Premium INR','Commission Rate','Commission INR','Status','Renewal Date','Payout Rail'], ...filteredPolicies.map(p => [p.id,p.client,p.type,p.state || '',p.premium,p.rate,p.payout,p.status,p.expiry || '',p.payoutMode || ''])];
            downloadCSV('apexshield-policy-register.csv', rows);
            showToast('Your filtered policy list was exported.', 'success');
        }

        const initialPolicies = [
            { id: 'POL-8821', client: 'Aarav Mehta', type: 'Life', premium: 52000, rate: 15.0, payout: 7800, status: 'Disbursed', expiry: dateAfter(22), state: 'Maharashtra', payoutMode: 'NEFT / bank transfer', createdAt: dateMonthsAgo(4) },
            { id: 'POL-8822', client: 'Priya Nair', type: 'Health', premium: 31000, rate: 12.5, payout: 3875, status: 'Approved', expiry: dateAfter(45), state: 'Karnataka', payoutMode: 'UPI (insurer-supported)', createdAt: dateMonthsAgo(3) },
            { id: 'POL-8823', client: 'Kabir Shah', type: 'Motor', premium: 18500, rate: 10.0, payout: 1850, status: 'Disbursed', expiry: dateAfter(9), state: 'Delhi', payoutMode: 'NEFT / bank transfer', createdAt: dateMonthsAgo(2) },
            { id: 'POL-8824', client: 'Ananya Iyer', type: 'Home', premium: 8900, rate: 8.0, payout: 712, status: 'Approved', expiry: dateAfter(70), state: 'Tamil Nadu', payoutMode: 'NEFT / bank transfer', createdAt: dateMonthsAgo(1) },
            { id: 'POL-8825', client: 'Rohan Das', type: 'Life', premium: 64000, rate: 15.0, payout: 9600, status: 'Pending', expiry: dateAfter(5), state: 'Gujarat', payoutMode: 'UPI (insurer-supported)', createdAt: dateMonthsAgo(0) }
        ];
        function normalizePolicyStatus(status) {
            if (status === 'Pending') return 'Submitted';
            if (status === 'Disbursed') return 'Paid';
            return nextStatuses[status] ? status : 'Submitted';
        }
        let policyRegistry = JSON.parse(localStorage.getItem('apexShieldIndiaPolicies') || 'null') || initialPolicies;
        policyRegistry = policyRegistry.map(policy => {
            const status = normalizePolicyStatus(policy.status);
            return {
                ...policy,
                status,
                createdAt: policy.createdAt || todayLocalISO(),
                history: Array.isArray(policy.history) && policy.history.length
                    ? policy.history
                    : [{ status, note: 'Status recorded when lifecycle tracking was enabled', timestamp: new Date().toISOString() }]
            };
        });
        persistPolicies();

        let filteredPolicies = [...policyRegistry];
        let activeTab = 'dashboard';
        let currentPage = 1;
        const pageSize = 5;

        // Chart instances
        let trendChartInstance = null;
        let breakdownChartInstance = null;

        // Initialize Application
        window.addEventListener('DOMContentLoaded', () => {
            setTheme(localStorage.getItem('apexShieldTheme') === 'light', false);
            renderTable();
            initCharts();
            calculatePayout();
            updateKPIs();
            document.querySelectorAll('.portal-tab').forEach((tab, index, tabs) => tab.addEventListener('keydown', event => {
                if (event.key !== 'ArrowRight' && event.key !== 'ArrowLeft') return;
                event.preventDefault();
                const step = event.key === 'ArrowRight' ? 1 : -1;
                const next = tabs[(index + step + tabs.length) % tabs.length];
                next.focus();
                next.click();
            }));
            document.addEventListener('keydown', event => {
                if (event.key === 'Escape') closePolicyDetails();
            });
        });

        function switchTab(tabName) {
            activeTab = tabName;
            document.getElementById('dashboardSection').classList.toggle('hidden', tabName !== 'dashboard');
            document.getElementById('calculatorSection').classList.toggle('hidden', tabName !== 'calculator');
            document.getElementById('policySection').classList.toggle('hidden', tabName !== 'policies' && tabName !== 'renewals');
            document.getElementById('registryHeading').innerText = tabName === 'renewals' ? 'Renewals Due in the Next 30 Days' : 'Commission Registry';
            document.querySelectorAll('.portal-tab').forEach(button => {
                const selected = button.dataset.tab === tabName;
                button.setAttribute('aria-selected', String(selected));
                button.classList.toggle('bg-emerald-500/15', selected);
                button.classList.toggle('text-emerald-300', selected);
                button.classList.toggle('border', selected);
                button.classList.toggle('border-emerald-500/30', selected);
                button.classList.toggle('text-slate-400', !selected);
            });
            if (tabName === 'policies' || tabName === 'renewals') filterTable();
        }

        // Calculate Payout Live
        function calculatePayout() {
            const premiumInput = document.getElementById('calcPremium');
            const premium = parseFloat(premiumInput.value) || 0;
            const type = document.getElementById('calcType').value;
            const tierMultiplier = parseFloat(document.getElementById('calcTier').value) || 1.0;

            const projection = getCommissionProjection(premium, type, tierMultiplier);

            // Update DOM
            document.getElementById('outBaseRate').innerText = projection.baseRate.toFixed(1) + '%';
            document.getElementById('outEffRate').innerText = projection.effectiveRate.toFixed(2) + '%';
            document.getElementById('outGross').innerText = premiumInput.value && premiumInput.validity.valid ? formatINR(projection.payout) : '—';
        }

        function validatePolicyholder(input) {
            const value = input.value.trim();
            const validName = value.length >= 2 && value.length <= 80 && !/[\d<>]/.test(value);
            input.setCustomValidity(validName || input.value === '' ? '' : 'Enter a name between 2 and 80 characters without digits.');
            return validName;
        }

        function validatePremium(input) {
            let message = '';
            if (input.validity.badInput || (input.value && !Number.isFinite(Number(input.value)))) message = 'Enter a valid premium amount.';
            else if (input.value && Number(input.value) < 100) message = 'Premium must be at least ₹100.';
            else if (input.value && Number(input.value) > 100000000) message = 'Premium cannot exceed ₹10 crore.';
            input.setCustomValidity(message);
            return !message && input.value !== '';
        }

        // Handle Policy Form Submit
        function handlePolicySubmit(e) {
            e.preventDefault();
            const clientInput = document.getElementById('calcClient');
            const premiumInput = document.getElementById('calcPremium');
            validatePolicyholder(clientInput);
            validatePremium(premiumInput);
            if (!e.currentTarget.reportValidity()) return;
            const client = clientInput.value.trim();
            const type = document.getElementById('calcType').value;
            const premium = parseFloat(document.getElementById('calcPremium').value) || 0;
            const tierMultiplier = parseFloat(document.getElementById('calcTier').value) || 1.0;

            const projection = getCommissionProjection(premium, type, tierMultiplier);
            const newId = 'POL-' + Math.floor(1000 + Math.random() * 9000);

            const newPolicy = {
                id: newId,
                client: client,
                type: type,
                premium: premium,
                rate: parseFloat(projection.effectiveRate.toFixed(2)),
                payout: projection.payout,
                expiry: document.getElementById('calcExpiry').value || '',
                state: document.getElementById('calcState').value,
                payoutMode: document.getElementById('calcPayoutMode').value,
                createdAt: todayLocalISO(),
                status: 'Submitted',
                history: [{ status: 'Submitted', note: 'Policy added to register', timestamp: new Date().toISOString() }]
            };

            policyRegistry.unshift(newPolicy);
            persistPolicies();
            filterTable();
            updateKPIs();
            updateCharts();
            
            // Reset form
            document.getElementById('calcClient').value = '';
            document.getElementById('calcExpiry').value = '';
            document.getElementById('calcState').value = '';
            document.getElementById('calcPayoutMode').value = '';
            showToast(`Policy ${newId} submitted and queued for processing!`, 'success');
        }

        // Render Policy Table
        function renderTable() {
            const tbody = document.getElementById('policyTableBody');
            tbody.innerHTML = '';

            if (filteredPolicies.length === 0) {
                tbody.innerHTML = `<tr><td colspan="9" class="text-center py-6 text-slate-500">No matching policies found.</td></tr>`;
                updatePaginationControls(0, 0);
                return;
            }

            const pageStart = (currentPage - 1) * pageSize;
            filteredPolicies.slice(pageStart, pageStart + pageSize).forEach(pol => {
                let badgeClass = 'bg-slate-800 text-slate-300 border-slate-700';
                if (pol.status === 'Approved') badgeClass = 'bg-emerald-500/10 text-emerald-400 border-emerald-500/20';
                if (pol.status === 'Submitted' || pol.status === 'Under Review' || pol.status === 'Payout Due') badgeClass = 'bg-amber-500/10 text-amber-400 border-amber-500/20';
                if (pol.status === 'Paid') badgeClass = 'bg-blue-500/10 text-blue-400 border-blue-500/20';
                if (pol.status === 'Rejected') badgeClass = 'bg-rose-500/10 text-rose-400 border-rose-500/20';

                const tr = document.createElement('tr');
                tr.className = 'hover:bg-slate-800/40 transition-colors';
                tr.innerHTML = `
                    <td class="py-3 px-4 font-bold text-white">${pol.id}</td>
                    <td class="py-3 px-4 text-slate-200 font-sans font-medium">${escapeHtml(pol.client)}</td>
                    <td class="py-3 px-4 text-slate-400 font-sans">${pol.type}</td>
                    <td class="py-3 px-4 text-right text-slate-300">${formatINR(pol.premium)}</td>
                    <td class="py-3 px-4 text-right text-teal-400">${pol.rate}%</td>
                    <td class="py-3 px-4 text-right text-emerald-400 font-bold">${formatINR(pol.payout)}</td>
                    <td class="py-3 px-4 text-slate-400">${pol.expiry ? escapeHtml(new Date(pol.expiry + 'T00:00:00').toLocaleDateString('en-IN')) : '&mdash;'}</td>
                    <td class="py-3 px-4 text-center">
                        <span class="px-2 py-0.5 rounded text-[11px] border ${badgeClass} font-sans font-semibold">${pol.status}</span>
                    </td>
                    <td class="py-3 px-4 text-center">
                        <button onclick="viewDetails('${pol.id}')" class="text-slate-400 hover:text-emerald-400 mr-2" title="View Status History"><i class="fa-solid fa-clock-rotate-left"></i></button>
                        ${renderStatusControl(pol)}
                        <button onclick="downloadInvoice('${pol.id}')" class="text-slate-400 hover:text-blue-400" title="Download Invoice"><i class="fa-solid fa-download"></i></button>
                    </td>
                `;
                tbody.appendChild(tr);
            });

            updatePaginationControls(pageStart + 1, Math.min(pageStart + pageSize, filteredPolicies.length));
        }

        function updatePaginationControls(start, end) {
            const total = filteredPolicies.length;
            const totalPages = Math.max(1, Math.ceil(total / pageSize));
            currentPage = Math.min(Math.max(currentPage, 1), totalPages);
            document.getElementById('tablePaginationInfo').innerText = total ? `Showing ${start} to ${end} of ${total} entries` : 'Showing 0 entries';
            document.getElementById('currentPageIndicator').innerText = `${currentPage} / ${totalPages}`;
            document.getElementById('previousPageButton').disabled = currentPage <= 1 || total === 0;
            document.getElementById('nextPageButton').disabled = currentPage >= totalPages || total === 0;
        }

        function changePage(direction) {
            const totalPages = Math.ceil(filteredPolicies.length / pageSize);
            const nextPage = currentPage + direction;
            if (nextPage < 1 || nextPage > totalPages) return;
            currentPage = nextPage;
            renderTable();
        }

        function renderStatusControl(policy) {
            const allowed = nextStatuses[policy.status] || [];
            if (!allowed.length) return `<span class="text-[10px] text-slate-500">${policy.status === 'Paid' || policy.status === 'Rejected' ? 'Complete' : ''}</span>`;
            return `<select aria-label="Update status for ${escapeHtml(policy.id)}" onchange="updatePolicyStatus('${escapeHtml(policy.id)}', this.value)" class="max-w-32 bg-slate-900 border border-slate-700 rounded-lg px-2 py-1 text-[10px] text-slate-300"><option value="">Update status</option>${allowed.map(status => `<option value="${status}">${status}</option>`).join('')}</select>`;
        }

        function updatePolicyStatus(policyId, nextStatus) {
            const policy = policyRegistry.find(item => item.id === policyId);
            if (!policy || !nextStatus) return;
            const allowed = nextStatuses[policy.status] || [];
            if (!allowed.includes(nextStatus)) {
                showToast(`Cannot move a policy from ${policy.status} to ${nextStatus}.`, 'error');
                filterTable();
                return;
            }
            policy.status = nextStatus;
            policy.history.push({ status: nextStatus, note: `Status changed to ${nextStatus}`, timestamp: new Date().toISOString() });
            persistPolicies();
            filterTable();
            updateKPIs();
            showToast(`${policy.id} moved to ${nextStatus}.`, 'success');
        }

        function viewDetails(id) {
            const policy = policyRegistry.find(item => item.id === id);
            if (!policy) return;
            document.getElementById('policyDetailsTitle').innerText = `Policy ${policy.id}`;
            document.getElementById('policyDetailsSummary').innerText = `${policy.client} · ${policy.type} · ${formatINR(policy.premium)} premium`;
            const list = document.getElementById('policyHistoryList');
            list.innerHTML = '';
            [...(policy.history || [])].reverse().forEach(entry => {
                const item = document.createElement('li');
                item.className = 'relative pl-5 border-l border-slate-700 pb-1';
                const marker = document.createElement('span');
                marker.className = 'absolute -left-1.5 top-1 w-3 h-3 rounded-full bg-emerald-500 ring-4 ring-slate-900';
                const status = document.createElement('div');
                status.className = 'text-sm font-semibold text-white';
                status.textContent = entry.status;
                const note = document.createElement('div');
                note.className = 'text-xs text-slate-400 mt-1';
                note.textContent = entry.note || `Status changed to ${entry.status}`;
                const time = document.createElement('time');
                time.className = 'text-[11px] text-slate-500 mt-1 block';
                const date = new Date(entry.timestamp);
                time.dateTime = Number.isNaN(date.getTime()) ? '' : date.toISOString();
                time.textContent = Number.isNaN(date.getTime()) ? 'Time unavailable' : date.toLocaleString('en-IN');
                item.append(marker, status, note, time);
                list.appendChild(item);
            });
            const modal = document.getElementById('policyDetailsModal');
            modal.classList.remove('hidden');
            modal.classList.add('flex');
        }

        function closePolicyDetails() {
            const modal = document.getElementById('policyDetailsModal');
            modal.classList.add('hidden');
            modal.classList.remove('flex');
        }

        // Filter Table
        function filterTable() {
            currentPage = 1;
            const query = document.getElementById('searchInput').value.toLowerCase();
            const status = document.getElementById('statusFilter').value;
            const product = document.getElementById('productFilter').value;

            filteredPolicies = policyRegistry.filter(p => {
                const matchesQuery = p.client.toLowerCase().includes(query) || p.id.toLowerCase().includes(query) || p.type.toLowerCase().includes(query) || (p.state || '').toLowerCase().includes(query);
                const matchesStatus = (status === 'ALL') || (p.status === status);
                const matchesProduct = product === 'ALL' || p.type === product;
                const daysToRenewal = p.expiry ? (new Date(p.expiry + 'T00:00:00') - new Date(new Date().toDateString())) / 86400000 : null;
                const matchesRenewal = activeTab !== 'renewals' || (daysToRenewal !== null && daysToRenewal >= 0 && daysToRenewal <= 30);
                return matchesQuery && matchesStatus && matchesProduct && matchesRenewal;
            });

            renderTable();
        }

        // Action Handlers
        function downloadInvoice(id) {
            const policy = policyRegistry.find(p => p.id === id);
            if (!policy) return;
            const rows = [['Policy ID','Policyholder','Product','State / UT','Annual Premium INR','Commission Rate','Commission INR','Status','Renewal Date','Payout Rail'], [policy.id, policy.client, policy.type, policy.state || '', policy.premium, policy.rate, policy.payout, policy.status, policy.expiry || '', policy.payoutMode || '']];
            downloadCSV(`${id}-statement.csv`, rows);
        }

        function updateKPIs() {
            const total = policyRegistry.reduce((acc, curr) => acc + curr.payout, 0);
            const pendingCount = policyRegistry.filter(p => p.status === 'Submitted' || p.status === 'Under Review').length;
            const weekStart = new Date();
            weekStart.setHours(0, 0, 0, 0);
            weekStart.setDate(weekStart.getDate() - ((weekStart.getDay() + 6) % 7));
            const newThisWeek = policyRegistry.filter(policy => {
                if (!policy.createdAt) return false;
                const created = new Date(policy.createdAt + 'T00:00:00');
                return !Number.isNaN(created.getTime()) && created >= weekStart && created <= new Date();
            }).length;
            const today = new Date(new Date().toDateString());
            const renewalsDue = policyRegistry.filter(p => {
                if (!p.expiry) return false;
                const days = (new Date(p.expiry + 'T00:00:00') - today) / 86400000;
                return days >= 0 && days <= 30;
            }).length;
            
            document.getElementById('kpiTotalEarnings').innerText = formatINR(total);
            document.getElementById('kpiActivePolicies').innerText = policyRegistry.length;
            document.getElementById('kpiPendingCount').innerText = pendingCount;
            document.getElementById('kpiNewThisWeek').innerText = `${newThisWeek} new this week`;
            document.getElementById('kpiRenewals').innerText = renewalsDue;
        }

        function updateCharts() {
            if (!trendChartInstance || !breakdownChartInstance) return;
            const monthStarts = Array.from({length: 6}, (_, index) => {
                const date = new Date();
                date.setDate(1);
                date.setMonth(date.getMonth() - (5 - index));
                return date;
            });
            const monthKeys = monthStarts.map(date => `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, '0')}`);
            const monthLabels = monthStarts.map(date => date.toLocaleDateString('en-IN', {month: 'short', year: '2-digit'}));
            const monthlyTotals = monthKeys.map(key => policyRegistry
                .filter(policy => (policy.createdAt || '').slice(0, 7) === key)
                .reduce((sum, policy) => sum + Number(policy.payout || 0), 0));
            trendChartInstance.data.labels = monthLabels;
            trendChartInstance.data.datasets[0].data = monthlyTotals;
            trendChartInstance.update();

            const products = Object.keys(commissionRates);
            const productCounts = products.map(product => policyRegistry.filter(policy => policy.type === product).length);
            const totalPolicies = productCounts.reduce((sum, count) => sum + count, 0);
            breakdownChartInstance.data.labels = products;
            breakdownChartInstance.data.datasets[0].data = productCounts.map(count => totalPolicies ? (count / totalPolicies) * 100 : 0);
            breakdownChartInstance.update();
        }

        function refreshData() {
            const icon = document.getElementById('refreshIcon');
            icon.classList.add('animate-spin');
            setTimeout(() => {
                icon.classList.remove('animate-spin');
                document.getElementById('lastUpdated').innerText = 'Updated: ' + new Date().toLocaleTimeString('en-IN', {hour: '2-digit', minute: '2-digit'});
                showToast('Policy list refreshed on this device.', 'success');
            }, 800);
        }

        // Toast Messages
        function showToast(message, type = 'info') {
            const container = document.getElementById('toastContainer');
            const toast = document.createElement('div');
            
            let bg = 'bg-slate-900 border-slate-700 text-slate-200';
            if (type === 'success') bg = 'bg-slate-900 border-emerald-500/40 text-emerald-400';
            if (type === 'info') bg = 'bg-slate-900 border-blue-500/40 text-blue-400';

            toast.className = `pointer-events-auto px-4 py-3 rounded-xl border ${bg} shadow-xl flex items-center gap-3 text-xs font-semibold backdrop-blur-md transition-all duration-300 transform translate-y-2 opacity-0`;
            const icon = document.createElement('i');
            icon.className = 'fa-solid fa-circle-check text-sm';
            const content = document.createElement('span');
            content.textContent = message;
            toast.append(icon, content);

            container.appendChild(toast);

            setTimeout(() => {
                toast.classList.remove('translate-y-2', 'opacity-0');
            }, 10);

            setTimeout(() => {
                toast.classList.add('opacity-0');
                setTimeout(() => toast.remove(), 300);
            }, 3500);
        }

        // Toggle DevOps Modal
        function toggleDevOpsModal() {
            const modal = document.getElementById('devopsModal');
            if (modal.classList.contains('hidden')) {
                modal.classList.remove('hidden');
                modal.classList.add('flex');
            } else {
                modal.classList.add('hidden');
                modal.classList.remove('flex');
            }
        }

        // Toggle Dark/Light Theme Mode
        function toggleTheme() {
            const body = document.getElementById('bodyRoot');
            setTheme(!body.classList.contains('light'), true);
        }

        function setTheme(isLight, savePreference) {
            const body = document.getElementById('bodyRoot');
            const icon = document.getElementById('themeIcon');
            body.classList.toggle('light', isLight);
            icon.className = isLight ? 'fa-solid fa-sun text-lg' : 'fa-solid fa-moon text-lg';
            document.getElementById('themeToggle').setAttribute('aria-pressed', String(isLight));
            if (savePreference) localStorage.setItem('apexShieldTheme', isLight ? 'light' : 'dark');
        }

        // Initialize Chart.js Data
        function initCharts() {
            // Trend Chart
            const ctxTrend = document.getElementById('monthlyTrendChart').getContext('2d');
            trendChartInstance = new Chart(ctxTrend, {
                type: 'line',
                data: {
                    labels: [],
                    datasets: [{
                        label: 'Commission Payout (\u20B9)',
                        data: [],
                        borderColor: '#10b981',
                        backgroundColor: 'rgba(16, 185, 129, 0.1)',
                        fill: true,
                        tension: 0.4,
                        borderWidth: 2,
                        pointBackgroundColor: '#10b981'
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: { display: false }
                    },
                    scales: {
                        x: {
                            grid: { display: false },
                            ticks: { color: '#64748b', font: { size: 10 } }
                        },
                        y: {
                            grid: { color: 'rgba(51, 65, 85, 0.3)' },
                            ticks: { color: '#64748b', font: { size: 10 }, callback: value => '\u20B9' + Number(value).toLocaleString('en-IN') }
                        }
                    }
                }
            });

            // Breakdown Chart
            const ctxBreakdown = document.getElementById('productBreakdownChart').getContext('2d');
            breakdownChartInstance = new Chart(ctxBreakdown, {
                type: 'doughnut',
                data: {
                    labels: [],
                    datasets: [{
                        data: [],
                        backgroundColor: ['#10b981', '#3b82f6', '#f59e0b', '#8b5cf6'],
                        borderWidth: 0
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            position: 'bottom',
                            labels: { color: '#94a3b8', font: { size: 10 }, boxWidth: 10 }
                        },
                        tooltip: { callbacks: { label: context => `${context.label}: ${Number(context.raw).toFixed(1)}%` } }
                    },
                    cutout: '70%'
                }
            });
            updateCharts();
        }
    </script>
</body>
</html>
