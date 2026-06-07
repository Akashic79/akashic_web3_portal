import React, { useState, useEffect } from 'react';

// Custom Glowing SVG Icons for futuristic Web3 style
const Icons = {
  Wallet: () => (
    <svg className="w-5 h-5 text-emerald-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M3 10h18M7 15h1m4 0h1m-7 4h12a3 3 0 003-3V8a3 3 0 00-3-3H6a3 3 0 00-3 3v8a3 3 0 003 3z" />
    </svg>
  ),
  Shield: () => (
    <svg className="w-5 h-5 text-cyan-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
    </svg>
  ),
  Cpu: () => (
    <svg className="w-5 h-5 text-purple-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M9 3v2m6-2v2M9 19v2m6-2v2M5 9H3m2 6H3m18-6h-2m2 6h-2M7 19h10a2 2 0 002-2V7a2 2 0 00-2-2H7a2 2 0 00-2 2v10a2 2 0 002 2zM9 9h6v6H9V9z" />
    </svg>
  ),
  Globe: () => (
    <svg className="w-5 h-5 text-blue-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M21 12a9 9 0 01-9 9m9-9a9 9 0 00-9-9m9 9H3m9 9a9 9 0 01-9-9m9 9c1.657 0 3-4.03 3-9s-1.343-9-3-9m0 18c-1.657 0-3-4.03-3-9s1.343-9 3-9m-9 9a9 9 0 019-9" />
    </svg>
  ),
  TrendingUp: () => (
    <svg className="w-5 h-5 text-emerald-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6" />
    </svg>
  ),
  Layers: () => (
    <svg className="w-5 h-5 text-amber-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10" />
    </svg>
  ),
  Code: () => (
    <svg className="w-5 h-5 text-purple-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M8 9l3 3-3 3m5 0h3M5 20h14a2 2 0 002-2V6a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
    </svg>
  )
};

export default function App() {
  const primaryWallet = "0x962D4Cf024F687e5f04176ead33f461D371a7A0F";
  
  // State Management
  const [activeTab, setActiveTab] = useState('dashboard');
  const [balance, setBalance] = useState({ iopn: 12540.50, usdt: 250000.00 });
  const [didStatus, setDidStatus] = useState({ verified: true, level: "Tier-3 Global Compliance", holder: "Akashic Member #940" });
  const [logs, setLogs] = useState([
    { time: "19:25:01", type: "system", msg: "Successfully initialized connection to Internet of People Network (IOPN)." },
    { time: "19:26:12", type: "wallet", msg: `Synchronized governance wallet: ${primaryWallet}` },
    { time: "19:26:15", type: "did", msg: "Decentralized Identity (DID) Tier-3 verification successful." }
  ]);

  // Real World Assets List
  const [rwaList, setRwaList] = useState([
    { id: "RWA-GOLD", name: "Swiss Secured Gold Vault", type: "Precious Metals", apr: 8.5, invested: 45000, totalCap: 15000000, tokenPrice: 100, progress: 68 },
    { id: "RWA-ESTATE", name: "West Lake Premium Apartments", type: "Real Estate", apr: 12.4, invested: 120000, totalCap: 45000000, tokenPrice: 500, progress: 41 },
    { id: "RWA-ENERGY", name: "South Central Wind Power Farm", type: "Green Infrastructure", apr: 14.2, invested: 0, totalCap: 28000000, tokenPrice: 50, progress: 85 }
  ]);

  // Smart Contract Builder State
  const [selectedTemplate, setSelectedTemplate] = useState('rwa-tokenizer');
  const [contractParams, setContractParams] = useState({
    assetName: 'Cat Ba Premium Hotel',
    valuation: '5000000',
    minInvestment: '100',
    targetYield: '11.5'
  });
  const [deploying, setDeploying] = useState(false);
  const [deployedContracts, setDeployedContracts] = useState([
    { address: "0x1AbA78D...E412", type: "RWA Tokenizer", name: "Swiss Gold Pool", date: "2026-06-05", status: "Active" },
    { address: "0x89CdA8F...A902", type: "Liquid Staking", name: "IOPN Liquidity", date: "2026-06-06", status: "Active" }
  ]);

  // Action simulated logs helper
  const addLog = (msg, type = "info") => {
    const now = new Date();
    const timeStr = `${String(now.getHours()).padStart(2, '0')}:${String(now.getMinutes()).padStart(2, '0')}:${String(now.getSeconds()).padStart(2, '0')}`;
    setLogs(prev => [{ time: timeStr, type, msg }, ...prev]);
  };

  // Investment simulation
  const handleInvest = (rwaId, amount) => {
    if (balance.usdt < amount) {
      addLog(`Transaction failed: Insufficient USDT balance to purchase ${rwaId}`, "error");
      return;
    }
    
    setBalance(prev => ({ ...prev, usdt: prev.usdt - amount }));
    setRwaList(prev => prev.map(rwa => {
      if (rwa.id === rwaId) {
        addLog(`Successfully invested ${amount.toLocaleString()} USDT into ${rwa.name} via wallet ${primaryWallet.substring(0, 8)}...`, "success");
        return { ...rwa, invested: rwa.invested + amount };
      }
      return rwa;
    }));
  };

  // Deploy smart contract simulation
  const handleDeployContract = () => {
    setDeploying(true);
    addLog(`Compiling smart contract template [${selectedTemplate.toUpperCase()}] from wallet ${primaryWallet}...`, "system");
    
    setTimeout(() => {
      addLog("Static security analysis complete. Security Rating: 100/100 (Audited).", "system");
    }, 1000);

    setTimeout(() => {
      addLog(`Issuing digital signature & broadcasting transaction to IOPN via wallet ${primaryWallet}...`, "wallet");
    }, 2200);

    setTimeout(() => {
      const mockAddress = "0x" + Array.from({length: 40}, () => Math.floor(Math.random()*16).toString(16)).join('').substring(0, 10).toUpperCase() + "...";
      const newContract = {
        address: mockAddress,
        type: selectedTemplate === 'rwa-tokenizer' ? 'RWA Tokenizer' : selectedTemplate === 'yield-farm' ? 'Yield Aggregator' : 'DID Verifier',
        name: contractParams.assetName,
        date: new Date().toISOString().split('T')[0],
        status: "Active"
      };
      
      setDeployedContracts(prev => [newContract, ...prev]);
      setDeploying(false);
      addLog(`Smart contract [${contractParams.assetName}] successfully deployed at address ${mockAddress}`, "success");
    }, 4000);
  };

  return (
    <div className="min-h-screen bg-slate-950 text-slate-100 font-sans flex flex-col">
      {/* Upper Glowing Header */}
      <header className="border-b border-slate-800 bg-slate-900/50 backdrop-blur-md sticky top-0 z-40">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-20 flex items-center justify-between">
          
          {/* Logo Brand */}
          <div className="flex items-center space-x-3">
            <div className="w-10 h-10 rounded-xl bg-gradient-to-tr from-emerald-500 to-cyan-500 flex items-center justify-center shadow-lg shadow-emerald-500/20">
              <span className="font-black text-xl text-slate-950">A</span>
            </div>
            <div>
              <h1 className="text-xl font-bold tracking-wider text-white">AKASHIC</h1>
              <p className="text-xs text-slate-400 font-mono tracking-tight">RWA & DeFi Hub on IOPN</p>
            </div>
          </div>

          {/* Wallet Address Header Info */}
          <div className="hidden lg:flex items-center space-x-4 bg-slate-950/80 border border-slate-800 px-4 py-2 rounded-xl">
            <div className="flex items-center space-x-2">
              <span className="w-2.5 h-2.5 rounded-full bg-emerald-500 animate-pulse"></span>
              <span className="text-xs text-slate-400 font-mono">IOPN Network</span>
            </div>
            <div className="h-4 w-[1px] bg-slate-800"></div>
            <div className="flex items-center space-x-2">
              <Icons.Wallet />
              <span className="text-xs font-mono text-emerald-400" title={primaryWallet}>
                {primaryWallet.substring(0, 8)}...{primaryWallet.substring(primaryWallet.length - 8)}
              </span>
            </div>
            <div className="h-4 w-[1px] bg-slate-800"></div>
            <div className="flex items-center space-x-2">
              <Icons.Shield />
              <span className="text-xs text-cyan-400 font-semibold">{didStatus.level}</span>
            </div>
          </div>

          {/* Quick Mobile Wallet view indicator */}
          <div className="lg:hidden flex items-center space-x-2 bg-slate-900 border border-slate-800 px-3 py-1.5 rounded-lg text-xs font-mono text-emerald-400">
            <span>Wallet: {primaryWallet.substring(0, 6)}...</span>
          </div>

        </div>
      </header>

      {/* Main Body Grid */}
      <main className="flex-1 max-w-7xl w-full mx-auto p-4 sm:p-6 lg:p-8 flex flex-col gap-6">
        
        {/* Subtitle Introduction Block */}
        <div className="bg-gradient-to-r from-emerald-950/40 via-slate-900 to-cyan-950/30 border border-emerald-500/20 rounded-2xl p-6 relative overflow-hidden">
          <div className="absolute top-0 right-0 w-64 h-64 bg-emerald-500/5 rounded-full blur-3xl -mr-20 -mt-20"></div>
          <div className="relative z-10">
            <div className="inline-flex items-center gap-2 bg-emerald-500/10 border border-emerald-500/30 text-emerald-400 px-3 py-1 rounded-full text-xs font-medium mb-3">
              <span className="w-1.5 h-1.5 rounded-full bg-emerald-400"></span>
              The New Frontier of RWA and DeFi
            </div>
            <h2 className="text-2xl sm:text-3xl font-bold text-white mb-2">Next-Gen Decentralized Transparent Finance</h2>
            <p className="text-slate-300 max-w-3xl leading-relaxed text-sm sm:text-base">
              Akashic seamlessly integrates Real World Assets (RWA) with on-chain Web3 liquidity built over the **Internet of People (IOPN)**. 
              Utilizing decentralized compliance identity keys, the framework guards sovereign legal ownership while harvesting global yields.
            </p>
          </div>
        </div>

        {/* Quick Statistics Banner */}
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
          <div className="bg-slate-900 border border-slate-800 rounded-xl p-4 flex items-center justify-between">
            <div>
              <span className="text-xs text-slate-400 uppercase tracking-wider block">USDT Balance</span>
              <span className="text-2xl font-bold text-white font-mono">{balance.usdt.toLocaleString()} <span className="text-xs text-slate-500">USDT</span></span>
            </div>
            <div className="p-3 bg-emerald-500/10 rounded-xl"><Icons.Wallet /></div>
          </div>
          <div className="bg-slate-900 border border-slate-800 rounded-xl p-4 flex items-center justify-between">
            <div>
              <span className="text-xs text-slate-400 uppercase tracking-wider block">IOPN Balance</span>
              <span className="text-2xl font-bold text-white font-mono">{balance.iopn.toLocaleString()} <span className="text-xs text-slate-500">IOPN</span></span>
            </div>
            <div className="p-3 bg-cyan-500/10 rounded-xl"><Icons.Globe /></div>
          </div>
          <div className="bg-slate-900 border border-slate-800 rounded-xl p-4 flex items-center justify-between">
            <div>
              <span className="text-xs text-slate-400 uppercase tracking-wider block">Average RWA Yield</span>
              <span className="text-2xl font-bold text-emerald-400 font-mono">11.7% <span className="text-xs text-slate-500">APR</span></span>
            </div>
            <div className="p-3 bg-teal-500/10 rounded-xl"><Icons.TrendingUp /></div>
          </div>
          <div className="bg-slate-900 border border-slate-800 rounded-xl p-4 flex items-center justify-between">
            <div>
              <span className="text-xs text-slate-400 uppercase tracking-wider block">Active Contracts</span>
              <span className="text-2xl font-bold text-purple-400 font-mono">{deployedContracts.length} <span className="text-xs text-slate-500">Active</span></span>
            </div>
            <div className="p-3 bg-purple-500/10 rounded-xl"><Icons.Cpu /></div>
          </div>
        </div>

        {/* Tab Selection Area */}
        <div className="flex border-b border-slate-800">
          <button 
            onClick={() => setActiveTab('dashboard')} 
            className={`py-3 px-6 font-medium text-sm border-b-2 transition-all flex items-center gap-2 ${activeTab === 'dashboard' ? 'border-emerald-500 text-emerald-400 bg-emerald-950/10' : 'border-transparent text-slate-400 hover:text-slate-200'}`}
          >
            <Icons.Layers />
            RWA Market
          </button>
          <button 
            onClick={() => setActiveTab('deployer')} 
            className={`py-3 px-6 font-medium text-sm border-b-2 transition-all flex items-center gap-2 ${activeTab === 'deployer' ? 'border-emerald-500 text-emerald-400 bg-emerald-950/10' : 'border-transparent text-slate-400 hover:text-slate-200'}`}
          >
            <Icons.Code />
            Smart Contracts
          </button>
          <button 
            onClick={() => setActiveTab('did')} 
            className={`py-3 px-6 font-medium text-sm border-b-2 transition-all flex items-center gap-2 ${activeTab === 'did' ? 'border-emerald-500 text-emerald-400 bg-emerald-950/10' : 'border-transparent text-slate-400 hover:text-slate-200'}`}
          >
            <Icons.Shield />
            DID Identity Hub
          </button>
        </div>

        {/* TAB 1: RWA MARKETPLACE */}
        {activeTab === 'dashboard' && (
          <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
            
            {/* Left Column: RWA Pools */}
            <div className="lg:col-span-2 space-y-4">
              <h3 className="text-lg font-bold text-white flex items-center gap-2">
                <span className="w-1.5 h-5 bg-emerald-500 rounded-full"></span>
                Tokenized Real World Assets
              </h3>

              {rwaList.map((rwa) => (
                <div key={rwa.id} className="bg-slate-900 border border-slate-800 hover:border-slate-700 transition-all rounded-xl p-6">
                  <div className="flex flex-col sm:flex-row sm:items-center justify-between mb-4">
                    <div>
                      <div className="flex items-center gap-2 mb-1">
                        <span className="text-xs font-mono font-bold bg-slate-800 text-cyan-400 px-2 py-0.5 rounded">
                          {rwa.id}
                        </span>
                        <span className="text-xs text-slate-400">{rwa.type}</span>
                      </div>
                      <h4 className="text-lg font-bold text-white">{rwa.name}</h4>
                    </div>
                    <div className="mt-2 sm:mt-0 text-right">
                      <span className="text-xs text-slate-400 block">Target Yield</span>
                      <span className="text-xl font-bold text-emerald-400">+{rwa.apr}% APR</span>
                    </div>
                  </div>

                  {/* Allocation Status Indicator */}
                  <div className="mb-4">
                    <div className="flex justify-between text-xs text-slate-400 mb-1">
                      <span>Collateral Crowdfund Progress:</span>
                      <span className="font-semibold text-slate-200">{rwa.progress}% ({((rwa.totalCap * rwa.progress)/100).toLocaleString()} USDT)</span>
                    </div>
                    <div className="w-full bg-slate-800 h-2.5 rounded-full overflow-hidden">
                      <div 
                        className="bg-gradient-to-r from-emerald-500 to-cyan-500 h-full rounded-full" 
                        style={{ width: `${rwa.progress}%` }}
                      ></div>
                    </div>
                  </div>

                  {/* User Position & Interaction */}
                  <div className="bg-slate-950/60 p-4 rounded-xl border border-slate-850 flex flex-col sm:flex-row justify-between items-center gap-4">
                    <div>
                      <span className="text-xs text-slate-400 block">Your Current Holding Balance:</span>
                      <span className="text-sm font-semibold text-emerald-400 font-mono">
                        {rwa.invested > 0 ? `${rwa.invested.toLocaleString()} USDT` : "No active holdings"}
                      </span>
                    </div>
                    
                    <div className="flex gap-2 w-full sm:w-auto">
                      <button 
                        onClick={() => handleInvest(rwa.id, 1000)}
                        className="flex-1 sm:flex-none bg-emerald-500 hover:bg-emerald-600 text-slate-950 font-bold px-4 py-2 rounded-lg text-xs transition-colors flex items-center justify-center gap-1"
                      >
                        Invest +1K USDT
                      </button>
                      <button 
                        onClick={() => handleInvest(rwa.id, 5000)}
                        className="flex-1 sm:flex-none bg-slate-800 hover:bg-slate-700 text-slate-200 font-bold px-4 py-2 rounded-lg text-xs transition-colors"
                      >
                        +5K USDT
                      </button>
                    </div>
                  </div>
                </div>
              ))}
            </div>

            {/* Right Column: Platform Mechanics */}
            <div className="space-y-6">
              <div className="bg-slate-900 border border-slate-800 rounded-xl p-5">
                <h4 className="text-base font-bold text-white mb-3 flex items-center gap-2">
                  <Icons.Shield />
                  RWA Standard Blueprint
                </h4>
                <ul className="space-y-3 text-xs text-slate-400">
                  <li className="flex gap-2">
                    <span className="text-emerald-400">1.</span>
                    <span>Real-world assets (Estate, metals, resources) are legally audited & valued by independent institutional custodians.</span>
                  </li>
                  <li className="flex gap-2">
                    <span className="text-emerald-400">2.</span>
                    <span>A dedicated SPV (Special Purpose Vehicle) manages the deed, then issues corresponding back-to-back 1:1 asset-backed tokens on the IOPN network.</span>
                  </li>
                  <li className="flex gap-2">
                    <span className="text-emerald-400">3.</span>
                    <span>Eligible KYC-registered wallets buy fractional tokens, securing ownership dividends automated dynamically via code.</span>
                  </li>
                </ul>
              </div>

              <div className="bg-gradient-to-br from-slate-900 to-indigo-950/30 border border-slate-800 rounded-xl p-5">
                <h4 className="text-base font-bold text-white mb-2">Instant Liquidity Pipeline</h4>
                <p className="text-xs text-slate-400 mb-4">
                  Unlike traditional paperwork taking weeks, Akashic lets you collateralize your RWA token holdings to borrow stablecoins, or trade directly on the IOPN AMM engine within seconds.
                </p>
                <div className="flex gap-2">
                  <button onClick={() => addLog("RWA AMM Swapper feature coming soon!", "info")} className="w-full bg-cyan-500/10 border border-cyan-500/30 hover:bg-cyan-500/20 text-cyan-400 font-bold py-2 rounded-lg text-xs transition-colors text-center">
                    Swap RWA Assets
                  </button>
                </div>
              </div>
            </div>

          </div>
        )}

        {/* TAB 2: SMART CONTRACT BUILDER */}
        {activeTab === 'deployer' && (
          <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
            
            {/* Deployment Configurator */}
            <div className="lg:col-span-2 bg-slate-900 border border-slate-800 rounded-xl p-6">
              <h3 className="text-lg font-bold text-white mb-4 flex items-center gap-2">
                <Icons.Code />
                Configure Smart Contract Deployment
              </h3>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
                <div>
                  <label className="text-xs text-slate-400 block mb-1">Contract Template</label>
                  <select 
                    value={selectedTemplate} 
                    onChange={(e) => {
                      setSelectedTemplate(e.target.value);
                      if (e.target.value === 'rwa-tokenizer') {
                        setContractParams({ assetName: "Cat Ba Premium Hotel", valuation: "5000000", minInvestment: "100", targetYield: "11.5" });
                      } else if (e.target.value === 'yield-farm') {
                        setContractParams({ assetName: "Agricultural Yield Optimizer", valuation: "2500000", minInvestment: "50", targetYield: "15.0" });
                      } else {
                        setContractParams({ assetName: "Akashic identity verification core", valuation: "0", minInvestment: "0", targetYield: "0" });
                      }
                    }}
                    className="w-full bg-slate-950 border border-slate-800 rounded-lg p-2.5 text-sm text-slate-200 focus:outline-none focus:border-emerald-500"
                  >
                    <option value="rwa-tokenizer">RWA Tokenizer (Asset Tokenization)</option>
                    <option value="yield-farm">Yield Aggregator (DeFi Optimizations)</option>
                    <option value="did-verifier">DID Verifier (Identity Verification)</option>
                  </select>
                </div>

                <div>
                  <label className="text-xs text-slate-400 block mb-1">Contract / Collateral Asset Name</label>
                  <input 
                    type="text" 
                    value={contractParams.assetName} 
                    onChange={(e) => setContractParams(prev => ({ ...prev, assetName: e.target.value }))}
                    className="w-full bg-slate-950 border border-slate-800 rounded-lg p-2.5 text-sm text-slate-200 focus:outline-none focus:border-emerald-500" 
                  />
                </div>
              </div>

              {selectedTemplate !== 'did-verifier' && (
                <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
                  <div>
                    <label className="text-xs text-slate-400 block mb-1">Valuation (USDT)</label>
                    <input 
                      type="number" 
                      value={contractParams.valuation} 
                      onChange={(e) => setContractParams(prev => ({ ...prev, valuation: e.target.value }))}
                      className="w-full bg-slate-950 border border-slate-800 rounded-lg p-2.5 text-sm text-slate-200 focus:outline-none focus:border-emerald-500 font-mono" 
                    />
                  </div>
                  <div>
                    <label className="text-xs text-slate-400 block mb-1">Minimum Buy (USDT)</label>
                    <input 
                      type="number" 
                      value={contractParams.minInvestment} 
                      onChange={(e) => setContractParams(prev => ({ ...prev, minInvestment: e.target.value }))}
                      className="w-full bg-slate-950 border border-slate-800 rounded-lg p-2.5 text-sm text-slate-200 focus:outline-none focus:border-emerald-500 font-mono" 
                    />
                  </div>
                  <div>
                    <label className="text-xs text-slate-400 block mb-1">Target Yield (% APR)</label>
                    <input 
                      type="number" 
                      step="0.1" 
                      value={contractParams.targetYield} 
                      onChange={(e) => setContractParams(prev => ({ ...prev, targetYield: e.target.value }))}
                      className="w-full bg-slate-950 border border-slate-800 rounded-lg p-2.5 text-sm text-slate-200 focus:outline-none focus:border-emerald-500 font-mono" 
                    />
                  </div>
                </div>
              )}

              {/* Executor wallet presentation */}
              <div className="bg-slate-950 border border-emerald-500/20 p-4 rounded-xl mb-6">
                <span className="text-xs text-emerald-400 uppercase tracking-wider font-semibold block mb-1">Transaction Deployer Wallet</span>
                <p className="text-xs font-mono text-slate-300 break-all">{primaryWallet}</p>
                <p className="text-[10px] text-slate-400 mt-1">Digital signature authorization and IOPN network gas fee paid from the administrative address above.</p>
              </div>

              <button 
                onClick={handleDeployContract} 
                disabled={deploying}
                className={`w-full py-3 rounded-lg font-bold text-sm transition-all flex items-center justify-center gap-2 ${deploying ? 'bg-emerald-950 text-slate-400 cursor-not-allowed' : 'bg-emerald-500 hover:bg-emerald-600 text-slate-950 shadow-lg shadow-emerald-500/20'}`}
              >
                {deploying ? (
                  <>
                    <svg className="animate-spin h-5 w-5 text-emerald-400" fill="none" viewBox="0 0 24 24">
                      <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
                      <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                    </svg>
                    Publishing on IOPN Network...
                  </>
                ) : (
                  <>
                    <Icons.Cpu />
                    Deploy via Wallet 0x962D...7A0F
                  </>
                )}
              </button>
            </div>

            {/* List of deployed smart contracts */}
            <div className="bg-slate-900 border border-slate-800 rounded-xl p-5">
              <h4 className="text-base font-bold text-white mb-4 flex items-center gap-2">
                <Icons.Layers />
                Active Deployments
              </h4>
              <div className="space-y-3">
                {deployedContracts.map((contract, index) => (
                  <div key={index} className="bg-slate-950 p-3.5 rounded-lg border border-slate-850">
                    <div className="flex justify-between items-start mb-2">
                      <div>
                        <span className="text-xs font-mono text-emerald-400 font-semibold block">{contract.type}</span>
                        <span className="text-sm font-bold text-slate-200">{contract.name}</span>
                      </div>
                      <span className="bg-emerald-500/10 text-emerald-400 text-[10px] px-2 py-0.5 rounded font-bold uppercase">
                        {contract.status}
                      </span>
                    </div>
                    <div className="flex justify-between text-[11px] text-slate-400 font-mono">
                      <span>Address: {contract.address}</span>
                      <span>{contract.date}</span>
                    </div>
                  </div>
                ))}
              </div>
            </div>

          </div>
        )}

        {/* TAB 3: DID IDENTITY MANAGER */}
        {activeTab === 'did' && (
          <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
            
            {/* Identity status card */}
            <div className="lg:col-span-2 bg-slate-900 border border-slate-800 rounded-xl p-6">
              <div className="flex items-start justify-between mb-6">
                <div>
                  <span className="text-xs text-emerald-400 font-semibold block mb-1">Internet of People Network (IOPN)</span>
                  <h3 className="text-2xl font-bold text-white">Akashic Decentralized Identity</h3>
                </div>
                <div className="bg-emerald-500/10 border border-emerald-500/20 text-emerald-400 px-3 py-1.5 rounded-xl flex items-center gap-2">
                  <span className="w-2 h-2 rounded-full bg-emerald-400 animate-pulse"></span>
                  <span className="text-xs font-bold font-mono">Status: Active</span>
                </div>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
                <div className="bg-slate-950 p-4 rounded-xl border border-slate-850">
                  <span className="text-xs text-slate-400 block mb-1">DID Holder Token ID</span>
                  <span className="text-base font-mono font-bold text-slate-200">{didStatus.holder}</span>
                </div>
                <div className="bg-slate-950 p-4 rounded-xl border border-slate-850">
                  <span className="text-xs text-slate-400 block mb-1">Global Compliance Tier</span>
                  <span className="text-base font-bold text-cyan-400">{didStatus.level}</span>
                </div>
              </div>

              {/* Compliance attributes */}
              <h4 className="text-sm font-bold text-white mb-3">Cross-Chain Verification Details</h4>
              <div className="space-y-2 mb-6">
                <div className="flex justify-between items-center p-3 bg-slate-950/40 border border-slate-850 rounded-lg">
                  <span className="text-xs text-slate-400">Anti-Money Laundering (AML) Certification</span>
                  <span className="text-xs text-emerald-400 font-semibold">VERIFIED PASS</span>
                </div>
                <div className="flex justify-between items-center p-3 bg-slate-950/40 border border-slate-850 rounded-lg">
                  <span className="text-xs text-slate-400">Governance Wallet Proof-of-Ownership</span>
                  <span className="text-xs text-emerald-400 font-semibold">SIGNATURE MATCHED</span>
                </div>
                <div className="flex justify-between items-center p-3 bg-slate-950/40 border border-slate-850 rounded-lg">
                  <span className="text-xs text-slate-400">Maximum Investment Threshold</span>
                  <span className="text-xs text-cyan-400 font-semibold">No Cap (Uncapped Limit)</span>
                </div>
              </div>

              <div className="border-t border-slate-800 pt-6">
                <p className="text-xs text-slate-400 leading-relaxed">
                  By utilizing the **IOPN DID protocol**, your sensitive private metadata is kept completely off-chain. Instead, cryptographic Zero-Knowledge Proofs (ZKP) provide trusted confirmations to asset syndicates without ever leaking your regulatory files.
                </p>
              </div>
            </div>

            {/* Verification mechanics */}
            <div className="bg-slate-900 border border-slate-800 rounded-xl p-5">
              <h4 className="text-base font-bold text-white mb-3 flex items-center gap-2">
                <Icons.Shield />
                Security & Data Integrity
              </h4>
              <p className="text-xs text-slate-400 leading-relaxed mb-4">
                The decentralized ID keys are mathematically bonded with your active key holder `{primaryWallet.substring(0, 6)}...`. 
                Should you transfer ownership or register a substitute wallet, autonomic smart contracts safely migrate compliance status instantly.
              </p>
              <div className="p-3.5 bg-slate-950 rounded-lg border border-slate-800">
                <span className="text-[10px] text-slate-400 uppercase tracking-widest block mb-1">ZK-Proof Identity Hash</span>
                <span className="text-xs font-mono text-cyan-400 block break-all">ZKP_IOPN_962D4Cf024F687e5f04176ead33f461D371a7A0F_VERIFIED</span>
              </div>
            </div>

          </div>
        )}

        {/* BOTTOM REAL-TIME BLOCKCHAIN CONSOLE LOG */}
        <div className="bg-slate-950 border border-slate-800 rounded-xl overflow-hidden mt-2">
          <div className="bg-slate-900 px-4 py-2 border-b border-slate-800 flex justify-between items-center">
            <div className="flex items-center space-x-2">
              <span className="w-2.5 h-2.5 rounded-full bg-cyan-400 animate-pulse"></span>
              <span className="text-xs font-mono font-bold text-white uppercase tracking-wider">Blockchain Activity Log (IOPN Core Network)</span>
            </div>
            <button 
              onClick={() => setLogs([])} 
              className="text-slate-400 hover:text-slate-200 text-xs font-semibold"
            >
              Clear Logs
            </button>
          </div>
          <div className="p-4 max-h-48 overflow-y-auto font-mono text-xs space-y-2.5">
            {logs.length === 0 ? (
              <p className="text-slate-600 italic">No new events recorded on the ledger.</p>
            ) : (
              logs.map((log, i) => (
                <div key={i} className="flex items-start space-x-2">
                  <span className="text-slate-500 font-light select-none">[{log.time}]</span>
                  <span className={`font-semibold uppercase text-[10px] px-1.5 py-0.5 rounded ${
                    log.type === 'system' ? 'bg-blue-950 text-blue-400 border border-blue-900' :
                    log.type === 'wallet' ? 'bg-emerald-950 text-emerald-400 border border-emerald-900' :
                    log.type === 'did' ? 'bg-cyan-950 text-cyan-400 border border-cyan-900' :
                    log.type === 'error' ? 'bg-red-950 text-red-400 border border-red-900' :
                    'bg-slate-800 text-slate-300'
                  }`}>
                    {log.type}
                  </span>
                  <span className="text-slate-300">{log.msg}</span>
                </div>
              ))
            )}
          </div>
        </div>

      </main>

      {/* Futuristic footer */}
      <footer className="border-t border-slate-900 bg-slate-950 py-6 mt-8">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center sm:flex sm:justify-between sm:items-center">
          <p className="text-xs text-slate-500">
            &copy; 2026 Akashic. Simulation mapping built on IOPN architecture standardizations.
          </p>
          <p className="text-xs text-slate-500 mt-2 sm:mt-0 font-mono">
            Secured link: 0x962D...7A0F
          </p>
        </div>
      </footer>
    </div>
  );
}