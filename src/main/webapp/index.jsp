<!DOCTYPE html>
<html lang="en" class="h-full bg-slate-900">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ApexShield Insurance - Agent Commission Portal</title>
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
            border: 1px solid rgba(0, 0, 0, 0.08);
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
                                ApexShield <span class="text-xs px-2 py-0.5 rounded bg-emerald-500/10 text-emerald-400 border border-emerald-500/20 font-semibold">ENTERPRISE</span>
                            </span>
                            <p class="text-xs text-slate-400">Agent Commission Portal</p>
                        </div>
                    </div>

                    <!-- Environment Badge & System Indicator -->
                    <div class="hidden md:flex items-center gap-3 bg-slate-900/80 px-3 py-1.5 rounded-full border border-slate-800 text-xs">
                        <span class="flex h-2.5 w-2.5 relative">
                            <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-400 opacity-75"></span>
                            <span class="relative inline-flex rounded-full h-2.5 w-2.5 bg-emerald-500"></span>
                        </span>
                        <span class="text-slate-300 font-mono">Docker: <span class="text-emerald-400 font-semibold">Port 8085</span> (Live)</span>
                        <span class="text-slate-600">|</span>
                        <span class="text-slate-400 font-mono">JDK 25 / Tomcat 10.1</span>
                    </div>

                    <!-- User Profile & Action Controls -->
                    <div class="flex items-center gap-4">
                        <div class="hidden sm:flex items-center gap-3 border-r border-slate-800 pr-4">
                            <div class="w-9 h-9 rounded-full bg-gradient-to-br from-indigo-500 to-purple-600 flex items-center justify-center font-bold text-white shadow-inner">
                                SJ
                            </div>
                            <div class="text-left">
                                <div class="text-sm font-semibold text-slate-200">Sarah Jenkins</div>
                                <div class="text-xs text-slate-400 font-mono">Code: AGT-99042</div>
                            </div>
                        </div>

                        <!-- System Diagnostics Toggle Button -->
                        <button onclick="toggleDevOpsModal()" class="p-2 text-slate-400 hover:text-emerald-400 hover:bg-slate-800/80 rounded-lg transition-all" title="DevOps Diagnostics">
                            <i class="fa-solid fa-server text-lg"></i>
                        </button>

                        <!-- Dark/Light Theme Toggle -->
                        <button onclick="toggleTheme()" class="p-2 text-slate-400 hover:text-amber-400 hover:bg-slate-800/80 rounded-lg transition-all" title="Toggle Theme">
                            <i class="fa-solid fa-moon text-lg" id="themeIcon"></i>
                        </button>
                    </div>
                </div>
            </div>
        </header>

        <!-- MAIN CONTENT AREA -->
        <main class="flex-1 max-w-7xl w-full mx-auto px-4 sm:px-6 lg:px-8 py-8 space-y-8">

            <!-- 2. ANALYTICS OVERVIEW DASHBOARD -->
            <section class="space-y-6">
                <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
                    <div>
                        <h1 class="text-2xl font-bold text-white tracking-tight">Executive Dashboard</h1>
                        <p class="text-sm text-slate-400">Real-time performance metrics and commission payouts status.</p>
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
                            <div class="text-2xl font-black text-white font-mono" id="kpiTotalEarnings">$24,850.00</div>
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
                                <span>12 new this week</span>
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
                                <i class="fa-solid fa-spinner animate-spin text-[10px]"></i>
                                <span>Processing via Queue</span>
                            </div>
                        </div>
                    </div>

                    <!-- KPI 4 -->
                    <div class="glass-panel p-5 rounded-2xl relative overflow-hidden group hover:border-slate-700 transition-all">
                        <div class="flex items-center justify-between">
                            <span class="text-xs font-semibold text-slate-400 uppercase tracking-wider">Avg Commission Rate</span>
                            <div class="p-2.5 bg-purple-500/10 text-purple-400 rounded-xl border border-purple-500/20">
                                <i class="fa-solid fa-percent text-lg"></i>
                            </div>
                        </div>
                        <div class="mt-3">
                            <div class="text-2xl font-black text-white font-mono">12.5%</div>
                            <div class="mt-1 flex items-center gap-1.5 text-xs text-purple-400">
                                <i class="fa-solid fa-layer-group"></i>
                                <span>Tier 2 Senior Agent</span>
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
                                <i class="fa-solid fa-chart-line text-emerald-400"></i> Monthly Earnings Trend ($)
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
            <section class="grid grid-cols-1 lg:grid-cols-12 gap-6">
                <!-- Calculator Form -->
                <div class="lg:col-span-7 glass-panel p-6 rounded-2xl space-y-5 border-l-4 border-l-emerald-500">
                    <div>
                        <h2 class="text-lg font-bold text-white flex items-center gap-2">
                            <i class="fa-solid fa-calculator text-emerald-400"></i> Instant Commission Calculator
                        </h2>
                        <p class="text-xs text-slate-400">Calculate agent payout, tax estimates, and queue for automated processing.</p>
                    </div>

                    <form id="calculatorForm" onsubmit="handlePolicySubmit(event)" class="space-y-4">
                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                            <div>
                                <label class="block text-xs font-semibold text-slate-300 mb-1">Client Full Name *</label>
                                <input type="text" id="calcClient" required placeholder="e.g. Robert Vance" class="w-full bg-slate-900 border border-slate-700 rounded-xl px-3.5 py-2 text-sm text-white focus:outline-none focus:border-emerald-500 transition-colors">
                            </div>
                            <div>
                                <label class="block text-xs font-semibold text-slate-300 mb-1">Insurance Type *</label>
                                <select id="calcType" onchange="calculatePayout()" class="w-full bg-slate-900 border border-slate-700 rounded-xl px-3.5 py-2 text-sm text-white focus:outline-none focus:border-emerald-500 transition-colors">
                                    <option value="Auto">Auto Insurance (10%)</option>
                                    <option value="Health">Health Insurance (12.5%)</option>
                                    <option value="Life" selected>Life Insurance (15%)</option>
                                    <option value="Property">Property & Casualty (8%)</option>
                                </select>
                            </div>
                        </div>

                        <div class="grid grid-cols-1 sm:grid-cols-3 gap-4">
                            <div>
                                <label class="block text-xs font-semibold text-slate-300 mb-1">Annual Premium ($) *</label>
                                <input type="number" id="calcPremium" value="4500" min="100" step="50" oninput="calculatePayout()" required class="w-full bg-slate-900 border border-slate-700 rounded-xl px-3.5 py-2 text-sm text-white focus:outline-none focus:border-emerald-500 transition-colors font-mono">
                            </div>
                            <div>
                                <label class="block text-xs font-semibold text-slate-300 mb-1">Term Length</label>
                                <select id="calcTerm" class="w-full bg-slate-900 border border-slate-700 rounded-xl px-3.5 py-2 text-sm text-white focus:outline-none focus:border-emerald-500 transition-colors">
                                    <option value="1 Year">1 Year</option>
                                    <option value="3 Years">3 Years</option>
                                    <option value="5 Years" selected>5 Years</option>
                                    <option value="10+ Years">10+ Years</option>
                                </select>
                            </div>
                            <div>
                                <label class="block text-xs font-semibold text-slate-300 mb-1">Agent Tier Modifier</label>
                                <select id="calcTier" onchange="calculatePayout()" class="w-full bg-slate-900 border border-slate-700 rounded-xl px-3.5 py-2 text-sm text-white focus:outline-none focus:border-emerald-500 transition-colors">
                                    <option value="1.0">Standard Tier (1.0x)</option>
                                    <option value="1.15" selected>Senior Tier (1.15x)</option>
                                    <option value="1.3">Premier Tier (1.3x)</option>
                                </select>
                            </div>
                        </div>

                        <div class="pt-2">
                            <button type="submit" class="w-full bg-gradient-to-r from-emerald-600 to-teal-500 hover:from-emerald-500 hover:to-teal-400 text-slate-950 font-bold py-2.5 px-4 rounded-xl shadow-lg shadow-emerald-500/20 flex items-center justify-center gap-2 transition-all">
                                <i class="fa-solid fa-paper-plane text-sm"></i> Submit Policy for Automated Processing
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
                                <span class="text-slate-400">Gross Payout:</span>
                                <span class="text-white font-bold" id="outGross">$776.25</span>
                            </div>
                            <div class="flex justify-between items-center text-sm">
                                <span class="text-slate-400">Est. Tax Withholding (15%):</span>
                                <span class="text-rose-400" id="outTax">-$116.44</span>
                            </div>
                            <div class="pt-3 border-t border-slate-800 flex justify-between items-center">
                                <span class="text-sm font-semibold text-slate-200">Net Estimated Payout:</span>
                                <span class="text-2xl font-black text-emerald-400" id="outNet">$659.81</span>
                            </div>
                        </div>
                    </div>

                    <div class="bg-slate-900/80 p-3 rounded-xl border border-slate-800 text-xs text-slate-400 flex items-start gap-2.5">
                        <i class="fa-solid fa-circle-info text-blue-400 text-sm mt-0.5"></i>
                        <span>Automated engine validates rule-sets via Jenkins CI/CD background pipeline before triggering direct deposit.</span>
                    </div>
                </div>
            </section>

            <!-- 4. POLICY & COMMISSION REGISTRY TABLE -->
            <section class="glass-panel rounded-2xl overflow-hidden space-y-4">
                <div class="p-6 border-b border-slate-800/80 flex flex-col md:flex-row md:items-center justify-between gap-4">
                    <div>
                        <h2 class="text-lg font-bold text-white flex items-center gap-2">
                            <i class="fa-solid fa-table-list text-blue-400"></i> Commission Registry
                        </h2>
                        <p class="text-xs text-slate-400">Searchable repository of logged policy payouts and processing statuses.</p>
                    </div>

                    <!-- Search and Filters -->
                    <div class="flex flex-wrap items-center gap-3">
                        <div class="relative min-w-[200px]">
                            <i class="fa-solid fa-magnifying-glass absolute left-3 top-2.5 text-xs text-slate-500"></i>
                            <input type="text" id="searchInput" oninput="filterTable()" placeholder="Search client or policy..." class="w-full bg-slate-900 border border-slate-700 rounded-xl pl-8 pr-3 py-1.5 text-xs text-white focus:outline-none focus:border-emerald-500 transition-colors">
                        </div>
                        <select id="statusFilter" onchange="filterTable()" class="bg-slate-900 border border-slate-700 rounded-xl px-3 py-1.5 text-xs text-white focus:outline-none focus:border-emerald-500 transition-colors">
                            <option value="ALL">All Statuses</option>
                            <option value="Approved">Approved</option>
                            <option value="Pending">Pending</option>
                            <option value="Under Review">Under Review</option>
                            <option value="Disbursed">Disbursed</option>
                        </select>
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
                                <th class="py-3.5 px-4 text-right">Premium ($)</th>
                                <th class="py-3.5 px-4 text-right">Rate (%)</th>
                                <th class="py-3.5 px-4 text-right">Payout ($)</th>
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
                        <button class="px-2.5 py-1 bg-slate-800 hover:bg-slate-700 rounded text-slate-300 disabled:opacity-50" disabled>Previous</button>
                        <button class="px-2.5 py-1 bg-emerald-500/20 text-emerald-400 border border-emerald-500/30 rounded font-bold">1</button>
                        <button class="px-2.5 py-1 bg-slate-800 hover:bg-slate-700 rounded text-slate-300 disabled:opacity-50" disabled>Next</button>
                    </div>
                </div>
            </section>
        </main>

        <!-- FOOTER -->
        <footer class="mt-auto border-t border-slate-800/80 bg-slate-950 py-6 text-center text-xs text-slate-500">
            <div class="max-w-7xl mx-auto px-4 flex flex-col sm:flex-row items-center justify-between gap-3">
                <div>ApexShield Insurance Infrastructure &copy; 2026. All Rights Reserved.</div>
                <div class="flex items-center gap-4 font-mono">
                    <span class="hover:text-slate-400 cursor-pointer" onclick="toggleDevOpsModal()">DevOps Diagnostics</span>
                    <span>•</span>
                    <span>Jenkins CI/CD Active</span>
                    <span>•</span>
                    <span>Tomcat 10.1</span>
                </div>
            </div>
        </footer>
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
        // Mock Initial Policy Dataset
        let policyRegistry = [
            { id: 'POL-8821', client: 'Michael Scott', type: 'Life', premium: 5200, rate: 15.0, payout: 780.00, status: 'Disbursed' },
            { id: 'POL-8822', client: 'Pam Beesly', type: 'Health', premium: 3100, rate: 12.5, payout: 387.50, status: 'Approved' },
            { id: 'POL-8823', client: 'Jim Halpert', type: 'Auto', premium: 1850, rate: 10.0, payout: 185.00, status: 'Disbursed' },
            { id: 'POL-8824', client: 'Dwight Schrute', type: 'Property', premium: 8900, rate: 8.0, payout: 712.00, status: 'Approved' },
            { id: 'POL-8825', client: 'Stanley Hudson', type: 'Life', premium: 6400, rate: 15.0, payout: 960.00, status: 'Pending' },
        ];

        let filteredPolicies = [...policyRegistry];

        // Chart instances
        let trendChartInstance = null;
        let breakdownChartInstance = null;

        // Initialize Application
        window.addEventListener('DOMContentLoaded', () => {
            renderTable();
            initCharts();
            calculatePayout();
        });

        // Calculate Payout Live
        function calculatePayout() {
            const premium = parseFloat(document.getElementById('calcPremium').value) || 0;
            const type = document.getElementById('calcType').value;
            const tierMultiplier = parseFloat(document.getElementById('calcTier').value) || 1.0;

            // Base rate lookup
            let baseRate = 10.0;
            if (type === 'Health') baseRate = 12.5;
            if (type === 'Life') baseRate = 15.0;
            if (type === 'Property') baseRate = 8.0;

            const effectiveRate = baseRate * tierMultiplier;
            const grossPayout = premium * (effectiveRate / 100);
            const taxEstimate = grossPayout * 0.15;
            const netPayout = grossPayout - taxEstimate;

            // Update DOM
            document.getElementById('outBaseRate').innerText = baseRate.toFixed(1) + '%';
            document.getElementById('outEffRate').innerText = effectiveRate.toFixed(2) + '%';
            document.getElementById('outGross').innerText = '$' + grossPayout.toFixed(2);
            document.getElementById('outTax').innerText = '-$' + taxEstimate.toFixed(2);
            document.getElementById('outNet').innerText = '$' + netPayout.toFixed(2);
        }

        // Handle Policy Form Submit
        function handlePolicySubmit(e) {
            e.preventDefault();
            const client = document.getElementById('calcClient').value.trim();
            const type = document.getElementById('calcType').value;
            const premium = parseFloat(document.getElementById('calcPremium').value) || 0;
            const tierMultiplier = parseFloat(document.getElementById('calcTier').value) || 1.0;

            let baseRate = 10.0;
            if (type === 'Health') baseRate = 12.5;
            if (type === 'Life') baseRate = 15.0;
            if (type === 'Property') baseRate = 8.0;

            const effectiveRate = baseRate * tierMultiplier;
            const payout = premium * (effectiveRate / 100);
            const newId = 'POL-' + Math.floor(1000 + Math.random() * 9000);

            const newPolicy = {
                id: newId,
                client: client,
                type: type,
                premium: premium,
                rate: parseFloat(effectiveRate.toFixed(2)),
                payout: parseFloat(payout.toFixed(2)),
                status: 'Pending'
            };

            policyRegistry.unshift(newPolicy);
            filterTable();
            updateKPIs();
            
            // Reset form
            document.getElementById('calcClient').value = '';
            showToast(`Policy ${newId} submitted and queued for processing!`, 'success');
        }

        // Render Policy Table
        function renderTable() {
            const tbody = document.getElementById('policyTableBody');
            tbody.innerHTML = '';

            if (filteredPolicies.length === 0) {
                tbody.innerHTML = `<tr><td colspan="8" class="text-center py-6 text-slate-500">No matching policies found.</td></tr>`;
                document.getElementById('tablePaginationInfo').innerText = 'Showing 0 entries';
                return;
            }

            filteredPolicies.forEach(pol => {
                let badgeClass = 'bg-slate-800 text-slate-300 border-slate-700';
                if (pol.status === 'Approved') badgeClass = 'bg-emerald-500/10 text-emerald-400 border-emerald-500/20';
                if (pol.status === 'Pending') badgeClass = 'bg-amber-500/10 text-amber-400 border-amber-500/20';
                if (pol.status === 'Disbursed') badgeClass = 'bg-blue-500/10 text-blue-400 border-blue-500/20';

                const tr = document.createElement('tr');
                tr.className = 'hover:bg-slate-800/40 transition-colors';
                tr.innerHTML = `
                    <td class="py-3 px-4 font-bold text-white">${pol.id}</td>
                    <td class="py-3 px-4 text-slate-200 font-sans font-medium">${pol.client}</td>
                    <td class="py-3 px-4 text-slate-400 font-sans">${pol.type}</td>
                    <td class="py-3 px-4 text-right text-slate-300">$${pol.premium.toLocaleString()}</td>
                    <td class="py-3 px-4 text-right text-teal-400">${pol.rate}%</td>
                    <td class="py-3 px-4 text-right text-emerald-400 font-bold">$${pol.payout.toFixed(2)}</td>
                    <td class="py-3 px-4 text-center">
                        <span class="px-2 py-0.5 rounded text-[11px] border ${badgeClass} font-sans font-semibold">${pol.status}</span>
                    </td>
                    <td class="py-3 px-4 text-center">
                        <button onclick="viewDetails('${pol.id}')" class="text-slate-400 hover:text-emerald-400 mr-2" title="View Details"><i class="fa-solid fa-eye"></i></button>
                        <button onclick="downloadInvoice('${pol.id}')" class="text-slate-400 hover:text-blue-400" title="Download Invoice"><i class="fa-solid fa-download"></i></button>
                    </td>
                `;
                tbody.appendChild(tr);
            });

            document.getElementById('tablePaginationInfo').innerText = `Showing 1 to ${filteredPolicies.length} of ${filteredPolicies.length} entries`;
        }

        // Filter Table
        function filterTable() {
            const query = document.getElementById('searchInput').value.toLowerCase();
            const status = document.getElementById('statusFilter').value;

            filteredPolicies = policyRegistry.filter(p => {
                const matchesQuery = p.client.toLowerCase().includes(query) || p.id.toLowerCase().includes(query) || p.type.toLowerCase().includes(query);
                const matchesStatus = (status === 'ALL') || (p.status === status);
                return matchesQuery && matchesStatus;
            });

            renderTable();
        }

        // Action Handlers
        function viewDetails(id) {
            const pol = policyRegistry.find(p => p.id === id);
            if (pol) {
                showToast(`Policy ${pol.id} (${pol.client}): $${pol.payout} commission payout.`, 'info');
            }
        }

        function downloadInvoice(id) {
            showToast(`Generating PDF statement for ${id}...`, 'info');
        }

        function updateKPIs() {
            const total = policyRegistry.reduce((acc, curr) => acc + curr.payout, 24850);
            const pendingCount = policyRegistry.filter(p => p.status === 'Pending').length + 8;
            
            document.getElementById('kpiTotalEarnings').innerText = '$' + total.toLocaleString('en-US', {minimumFractionDigits: 2, maximumFractionDigits: 2});
            document.getElementById('kpiActivePolicies').innerText = 142 + policyRegistry.length - 5;
            document.getElementById('kpiPendingCount').innerText = pendingCount;
        }

        function refreshData() {
            const icon = document.getElementById('refreshIcon');
            icon.classList.add('animate-spin');
            setTimeout(() => {
                icon.classList.remove('animate-spin');
                showToast('Data synced with Dockerized Tomcat API.', 'success');
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
            toast.innerHTML = `<i class="fa-solid fa-circle-check text-sm"></i> <span>${message}</span>`;

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
            const icon = document.getElementById('themeIcon');
            if (body.classList.contains('light')) {
                body.classList.remove('light');
                body.classList.add('bg-slate-950', 'text-slate-100');
                icon.className = 'fa-solid fa-moon text-lg';
            } else {
                body.classList.add('light');
                body.classList.remove('bg-slate-950');
                icon.className = 'fa-solid fa-sun text-lg';
            }
        }

        // Initialize Chart.js Data
        function initCharts() {
            // Trend Chart
            const ctxTrend = document.getElementById('monthlyTrendChart').getContext('2d');
            trendChartInstance = new Chart(ctxTrend, {
                type: 'line',
                data: {
                    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct'],
                    datasets: [{
                        label: 'Commission Payout ($)',
                        data: [1850, 2100, 1950, 2400, 2800, 2600, 3100, 3400, 3200, 3850],
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
                            ticks: { color: '#64748b', font: { size: 10 } }
                        }
                    }
                }
            });

            // Breakdown Chart
            const ctxBreakdown = document.getElementById('productBreakdownChart').getContext('2d');
            breakdownChartInstance = new Chart(ctxBreakdown, {
                type: 'doughnut',
                data: {
                    labels: ['Life', 'Health', 'Auto', 'Property'],
                    datasets: [{
                        data: [42, 28, 18, 12],
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
                        }
                    },
                    cutout: '70%'
                }
            });
        }
    </script>
</body>
</html>