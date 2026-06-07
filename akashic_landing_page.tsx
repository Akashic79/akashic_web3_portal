import React, { useState } from 'react';
import { 
  Shield, 
  Globe, 
  Wallet, 
  Cpu, 
  ArrowRight, 
  Fingerprint, 
  BarChart3, 
  Lock,
  ExternalLink,
  Copy,
  CheckCircle2,
  Info,
  Layers,
  Network,
  Building2,
  Gem,
  LineChart,
  Server
} from 'lucide-react';

const Navbar = () => {
  return (
    <nav className="flex items-center justify-between px-6 py-4 bg-slate-900/50 backdrop-blur-md border-b border-slate-800 sticky top-0 z-50">
      <div className="flex items-center gap-2">
        <div className="w-8 h-8 rounded-full bg-gradient-to-tr from-blue-500 to-purple-600 flex items-center justify-center">
          <ActivityIcon className="w-5 h-5 text-white" />
        </div>
        <span className="text-xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-blue-400 to-purple-500">
          Akashic
        </span>
      </div>
      <div className="hidden md:flex items-center gap-8 text-sm font-medium text-slate-300">
        <a href="#ecosystem" className="hover:text-blue-400 transition-colors">Ecosystem</a>
        <a href="#smart-contract" className="hover:text-blue-400 transition-colors">Smart Contract</a>
        <a href="#governance" className="hover:text-blue-400 transition-colors">Governance</a>
        <a href="#docs" className="hover:text-blue-400 transition-colors">Docs</a>
      </div>
      <button className="px-5 py-2 rounded-full bg-blue-600 hover:bg-blue-700 text-white text-sm font-semibold transition-all shadow-[0_0_15px_rgba(37,99,235,0.4)]">
        Connect Wallet
      </button>
    </nav>
  );
};

const ActivityIcon = ({ className }) => (
  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" className={className}>
    <polyline points="22 12 18 12 15 21 9 3 6 12 2 12"></polyline>
  </svg>
);

const Hero = () => {
  return (
    <section className="relative pt-32 pb-20 px-6 max-w-7xl mx-auto flex flex-col items-center text-center">
      <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[600px] h-[600px] bg-blue-600/20 rounded-full blur-[120px] -z-10"></div>
      
      <div className="inline-flex items-center gap-2 px-3 py-1.5 rounded-full bg-slate-800/50 border border-slate-700 mb-8 text-sm text-blue-400 font-medium">
        <span className="relative flex h-2 w-2">
          <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-blue-400 opacity-75"></span>
          <span className="relative inline-flex rounded-full h-2 w-2 bg-blue-500"></span>
        </span>
        Live on the IOPN Network
      </div>

      <h1 className="text-5xl md:text-7xl font-extrabold tracking-tight mb-6 leading-tight">
        Next-Generation <br />
        <span className="bg-clip-text text-transparent bg-gradient-to-r from-blue-400 via-indigo-400 to-purple-500">
          DeFi Ecosystem
        </span>
      </h1>
      
      <p className="text-lg md:text-xl text-slate-400 max-w-2xl mb-10 leading-relaxed">
        Integrating Real-World Assets (RWA) on the Internet of People Network (IOPN). A transparent financial solution for seamless asset management with decentralized identity and superior smart contracts.
      </p>
      
      <div className="flex flex-col sm:flex-row items-center gap-4">
        <button className="w-full sm:w-auto px-8 py-4 rounded-xl bg-gradient-to-r from-blue-600 to-purple-600 hover:from-blue-500 hover:to-purple-500 text-white font-semibold text-lg transition-all flex items-center justify-center gap-2 shadow-lg shadow-blue-900/20">
          Explore Now <ArrowRight className="w-5 h-5" />
        </button>
        <button className="w-full sm:w-auto px-8 py-4 rounded-xl bg-slate-800 hover:bg-slate-700 border border-slate-700 text-white font-semibold text-lg transition-all">
          Read Whitepaper
        </button>
      </div>
    </section>
  );
};

const EcosystemTabs = () => {
  const [activeTab, setActiveTab] = useState('about');

  const tabs = [
    { id: 'about', label: 'About Us', icon: <Info className="w-4 h-4" /> },
    { id: 'features', label: 'Core Features', icon: <Layers className="w-4 h-4" /> },
    { id: 'rwa', label: 'RWA Integration', icon: <Building2 className="w-4 h-4" /> },
    { id: 'iopn', label: 'IOPN Network', icon: <Network className="w-4 h-4" /> },
  ];

  return (
    <section id="ecosystem" className="py-24 px-6 bg-slate-900/30">
      <div className="max-w-7xl mx-auto">
        <div className="text-center mb-12">
          <h2 className="text-3xl md:text-4xl font-bold mb-4">Discover the <span className="text-blue-400">Akashic Ecosystem</span></h2>
          <p className="text-slate-400 max-w-2xl mx-auto">Dive deep into the architecture, features, and the real-world value bridging the gap between traditional finance and Web3.</p>
        </div>

        {/* Tab Navigation */}
        <div className="flex flex-wrap justify-center gap-2 mb-12 bg-slate-800/50 p-2 rounded-2xl max-w-3xl mx-auto border border-slate-700/50">
          {tabs.map((tab) => (
            <button
              key={tab.id}
              onClick={() => setActiveTab(tab.id)}
              className={`flex items-center gap-2 px-6 py-3 rounded-xl font-medium text-sm transition-all duration-300 ${
                activeTab === tab.id 
                  ? 'bg-blue-600 text-white shadow-lg shadow-blue-900/20' 
                  : 'text-slate-400 hover:text-white hover:bg-slate-700/50'
              }`}
            >
              {tab.icon} {tab.label}
            </button>
          ))}
        </div>

        {/* Tab Content Areas */}
        <div className="min-h-[400px]">
          
          {/* ABOUT TAB */}
          {activeTab === 'about' && (
            <div className="animate-in fade-in slide-in-from-bottom-4 duration-500">
              <div className="grid md:grid-cols-2 gap-12 items-center">
                <div>
                  <h3 className="text-3xl font-bold mb-6">Bridging Traditional Finance and Decentralization</h3>
                  <p className="text-slate-400 leading-relaxed mb-6">
                    Akashic is not just another DeFi protocol. It is a comprehensive financial hub designed to eliminate the barriers between physical assets and blockchain liquidity. By leveraging the Internet of People Network (IOPN), we provide a compliant, fast, and highly secure environment for users worldwide.
                  </p>
                  <p className="text-slate-400 leading-relaxed mb-8">
                    Our mission is to democratize access to institutional-grade investment opportunities through tokenization, empowering individuals to take sovereign control of their wealth via Decentralized Identifiers (DIDs).
                  </p>
                  <div className="grid grid-cols-2 gap-6">
                    <div className="p-4 bg-slate-800/50 rounded-xl border border-slate-700">
                      <div className="text-3xl font-bold text-blue-400 mb-1">$0</div>
                      <div className="text-sm text-slate-400">Total Value Locked</div>
                    </div>
                    <div className="p-4 bg-slate-800/50 rounded-xl border border-slate-700">
                      <div className="text-3xl font-bold text-purple-400 mb-1">0+</div>
                      <div className="text-sm text-slate-400">Active DIDs</div>
                    </div>
                  </div>
                </div>
                <div className="relative">
                  <div className="absolute inset-0 bg-gradient-to-tr from-blue-600/20 to-purple-600/20 blur-2xl rounded-3xl"></div>
                  <div className="relative bg-slate-900 border border-slate-800 rounded-3xl p-8 shadow-2xl">
                    <img src="https://images.unsplash.com/photo-1639762681485-074b7f4ec851?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" alt="Web3 Abstract" className="rounded-xl opacity-80 mix-blend-luminosity hover:mix-blend-normal transition-all duration-500" />
                  </div>
                </div>
              </div>
            </div>
          )}

          {/* FEATURES TAB */}
          {activeTab === 'features' && (
            <div className="animate-in fade-in slide-in-from-bottom-4 duration-500 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
              {[
                {
                  icon: <BarChart3 className="w-6 h-6 text-blue-400" />,
                  title: "RWA Integration",
                  description: "Bring real-world assets on-chain, unlocking unprecedented liquidity and creating limitless new investment opportunities."
                },
                {
                  icon: <Globe className="w-6 h-6 text-purple-400" />,
                  title: "Powered by IOPN",
                  description: "Built on the Internet of People platform, ensuring high-speed transactions, minimal fees, and massive scalability."
                },
                {
                  icon: <Fingerprint className="w-6 h-6 text-indigo-400" />,
                  title: "Decentralized Identity",
                  description: "Give users full sovereignty over their personal data, ensuring maximum privacy and security for all financial activities."
                },
                {
                  icon: <Cpu className="w-6 h-6 text-pink-400" />,
                  title: "Advanced Smart Contracts",
                  description: "Strictly audited smart contracts that automate financial workflows transparently, eliminating counterparty risks."
                }
              ].map((feature, index) => (
                <div key={index} className="p-8 rounded-2xl bg-slate-800/40 border border-slate-700/50 hover:bg-slate-800/80 transition-all hover:-translate-y-2 group">
                  <div className="w-14 h-14 rounded-xl bg-slate-900/80 flex items-center justify-center mb-6 group-hover:scale-110 transition-transform">
                    {feature.icon}
                  </div>
                  <h3 className="text-xl font-semibold mb-3">{feature.title}</h3>
                  <p className="text-slate-400 leading-relaxed text-sm">{feature.description}</p>
                </div>
              ))}
            </div>
          )}

          {/* RWA TAB */}
          {activeTab === 'rwa' && (
            <div className="animate-in fade-in slide-in-from-bottom-4 duration-500">
               <div className="bg-slate-800/30 border border-slate-700/50 rounded-3xl p-8 md:p-12">
                  <div className="text-center max-w-3xl mx-auto mb-12">
                    <h3 className="text-2xl md:text-3xl font-bold mb-4">Unlocking Trillions in Real-World Value</h3>
                    <p className="text-slate-400">Akashic establishes a secure, legal, and transparent bridge to tokenize traditional assets. From real estate to commodities, trade global assets 24/7 directly from your DeFi wallet.</p>
                  </div>
                  
                  <div className="grid md:grid-cols-3 gap-8 relative">
                    {/* Connecting line for desktop */}
                    <div className="hidden md:block absolute top-1/2 left-10 right-10 h-0.5 bg-slate-700 -z-10 -translate-y-1/2"></div>
                    
                    <div className="bg-slate-900 p-6 rounded-2xl border border-slate-700 relative text-center">
                      <div className="w-12 h-12 bg-blue-600 rounded-full flex items-center justify-center mx-auto mb-4 border-4 border-slate-900 outline outline-1 outline-slate-700">
                        <Shield className="w-5 h-5 text-white" />
                      </div>
                      <h4 className="font-semibold text-lg mb-2">1. Verification & Legal Setup</h4>
                      <p className="text-sm text-slate-400">Physical assets undergo strict auditing and are placed into compliant SPVs (Special Purpose Vehicles).</p>
                    </div>

                    <div className="bg-slate-900 p-6 rounded-2xl border border-slate-700 relative text-center">
                      <div className="w-12 h-12 bg-purple-600 rounded-full flex items-center justify-center mx-auto mb-4 border-4 border-slate-900 outline outline-1 outline-slate-700">
                        <Gem className="w-5 h-5 text-white" />
                      </div>
                      <h4 className="font-semibold text-lg mb-2">2. On-Chain Tokenization</h4>
                      <p className="text-sm text-slate-400">Assets are minted as standardized tokens on IOPN, representing fractional ownership.</p>
                    </div>

                    <div className="bg-slate-900 p-6 rounded-2xl border border-slate-700 relative text-center">
                      <div className="w-12 h-12 bg-indigo-600 rounded-full flex items-center justify-center mx-auto mb-4 border-4 border-slate-900 outline outline-1 outline-slate-700">
                        <LineChart className="w-5 h-5 text-white" />
                      </div>
                      <h4 className="font-semibold text-lg mb-2">3. Liquid Trading & Yield</h4>
                      <p className="text-sm text-slate-400">Users can instantly buy, sell, or stake RWA tokens to earn automated yield via Smart Contracts.</p>
                    </div>
                  </div>
               </div>
            </div>
          )}

          {/* IOPN TAB */}
          {activeTab === 'iopn' && (
            <div className="animate-in fade-in slide-in-from-bottom-4 duration-500">
               <div className="grid md:grid-cols-2 gap-10">
                  <div className="bg-slate-800/30 border border-slate-700/50 rounded-3xl p-8 flex flex-col justify-center">
                    <h3 className="text-3xl font-bold mb-4">The Infrastructure for the Decentralized Web</h3>
                    <p className="text-slate-400 mb-6 leading-relaxed">
                      The Internet of People Network (IOPN) is explicitly designed for high-frequency financial applications and identity sovereignty. It avoids the congestion and high gas fees of legacy blockchains while maintaining true decentralization.
                    </p>
                    <ul className="space-y-4">
                      <li className="flex items-start gap-3">
                        <div className="mt-1 bg-green-500/20 p-1 rounded-full"><CheckCircle2 className="w-4 h-4 text-green-400" /></div>
                        <div>
                          <strong className="block text-white">Ultra-Low Latency</strong>
                          <span className="text-sm text-slate-400">Sub-second block finality suitable for enterprise-level RWA trading.</span>
                        </div>
                      </li>
                      <li className="flex items-start gap-3">
                        <div className="mt-1 bg-green-500/20 p-1 rounded-full"><CheckCircle2 className="w-4 h-4 text-green-400" /></div>
                        <div>
                          <strong className="block text-white">Native Identity (DID)</strong>
                          <span className="text-sm text-slate-400">Built-in protocol for KYC/AML compliance without exposing raw personal data to the public ledger.</span>
                        </div>
                      </li>
                      <li className="flex items-start gap-3">
                        <div className="mt-1 bg-green-500/20 p-1 rounded-full"><CheckCircle2 className="w-4 h-4 text-green-400" /></div>
                        <div>
                          <strong className="block text-white">Interoperability Protocol</strong>
                          <span className="text-sm text-slate-400">Seamlessly bridge assets between IOPN, Ethereum, and other major L1 ecosystems.</span>
                        </div>
                      </li>
                    </ul>
                  </div>
                  <div className="bg-slate-900 border border-slate-800 rounded-3xl p-8 flex items-center justify-center relative overflow-hidden">
                    <div className="absolute inset-0 opacity-20" style={{ backgroundImage: 'radial-gradient(circle at 2px 2px, rgba(255,255,255,0.15) 1px, transparent 0)', backgroundSize: '24px 24px' }}></div>
                    <div className="relative z-10 w-full">
                      <div className="flex justify-between items-center mb-8 border-b border-slate-800 pb-4">
                        <div className="flex items-center gap-3">
                          <Server className="w-6 h-6 text-slate-400" />
                          <span className="font-mono text-sm text-slate-300">IOPN Network Status</span>
                        </div>
                        <span className="flex items-center gap-2 text-xs font-mono text-green-400 bg-green-400/10 px-2 py-1 rounded">
                          <span className="w-2 h-2 rounded-full bg-green-500 animate-pulse"></span> Operational
                        </span>
                      </div>
                      
                      <div className="space-y-6 font-mono text-sm">
                        <div className="flex justify-between">
                          <span className="text-slate-500">Current Block</span>
                          <span className="text-blue-400">#14,293,012</span>
                        </div>
                        <div className="flex justify-between">
                          <span className="text-slate-500">Avg. Block Time</span>
                          <span className="text-white">0.8s</span>
                        </div>
                        <div className="flex justify-between">
                          <span className="text-slate-500">Active Validator Nodes</span>
                          <span className="text-white">1,024</span>
                        </div>
                        <div className="flex justify-between">
                          <span className="text-slate-500">Avg. Gas Fee</span>
                          <span className="text-white">$0.0001</span>
                        </div>
                      </div>
                    </div>
                  </div>
               </div>
            </div>
          )}

        </div>
      </div>
    </section>
  );
};

const SmartContractWallet = () => {
  const [copied, setCopied] = useState(false);
  const address = "0x962D4Cf024F687e5f04176ead33f461D371a7A0F";

  const handleCopy = () => {
    navigator.clipboard.writeText(address);
    setCopied(true);
    setTimeout(() => setCopied(false), 2000);
  };

  return (
    <section id="smart-contract" className="py-24 px-6 max-w-7xl mx-auto">
      <div className="rounded-3xl bg-gradient-to-b from-blue-900/20 to-slate-900 border border-blue-800/30 p-8 md:p-12 overflow-hidden relative">
        <div className="absolute top-0 right-0 p-32 bg-blue-500/10 blur-[100px] rounded-full"></div>
        
        <div className="relative z-10 flex flex-col md:flex-row items-center justify-between gap-10">
          <div className="w-full md:w-1/2">
            <div className="inline-flex items-center justify-center w-12 h-12 rounded-xl bg-blue-500/20 text-blue-400 mb-6">
              <Wallet className="w-6 h-6" />
            </div>
            <h2 className="text-3xl md:text-4xl font-bold mb-4">Smart Contract Management</h2>
            <p className="text-slate-400 text-lg mb-6 leading-relaxed">
              Every transaction and asset on Akashic is managed and protected by advanced multi-signature smart contracts. Below is the main governance contract address of the ecosystem.
            </p>
            <ul className="space-y-3 mb-8">
              <li className="flex items-center gap-3 text-slate-300">
                <CheckCircle2 className="w-5 h-5 text-green-400" /> Fully transparent on the blockchain
              </li>
              <li className="flex items-center gap-3 text-slate-300">
                <CheckCircle2 className="w-5 h-5 text-green-400" /> Automated yield and disbursement routing
              </li>
              <li className="flex items-center gap-3 text-slate-300">
                <CheckCircle2 className="w-5 h-5 text-green-400" /> Enterprise-grade security protocols
              </li>
            </ul>
          </div>
          
          <div className="w-full md:w-1/2">
            <div className="bg-slate-950 p-6 rounded-2xl border border-slate-800 shadow-2xl">
              <div className="flex items-center justify-between mb-4">
                <span className="text-sm font-medium text-slate-400">Ecosystem Contract Address</span>
                <span className="flex items-center gap-1 text-xs font-semibold text-green-400 bg-green-400/10 px-2 py-1 rounded-md">
                  <Lock className="w-3 h-3" /> Verified
                </span>
              </div>
              
              <div className="bg-slate-900 rounded-xl p-4 flex items-center justify-between mb-4 border border-slate-800 group hover:border-blue-500/50 transition-colors">
                <code className="text-blue-300 text-sm sm:text-base break-all font-mono">
                  {address}
                </code>
                <button 
                  onClick={handleCopy}
                  className="ml-4 p-2 rounded-lg bg-slate-800 hover:bg-slate-700 text-slate-300 transition-colors flex-shrink-0"
                  title="Copy address"
                >
                  {copied ? <CheckCircle2 className="w-5 h-5 text-green-400" /> : <Copy className="w-5 h-5" />}
                </button>
              </div>
              
              <div className="flex gap-3">
                <button className="flex-1 py-3 rounded-xl bg-blue-600/10 hover:bg-blue-600/20 text-blue-400 font-medium text-sm transition-colors flex items-center justify-center gap-2">
                  View on Explorer <ExternalLink className="w-4 h-4" />
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

const Footer = () => {
  return (
    <footer className="border-t border-slate-800 bg-slate-950 pt-16 pb-8 px-6 text-slate-400">
      <div className="max-w-7xl mx-auto grid grid-cols-1 md:grid-cols-4 gap-10 mb-12">
        <div className="col-span-1 md:col-span-2">
          <div className="flex items-center gap-2 mb-4">
            <div className="w-6 h-6 rounded-full bg-gradient-to-tr from-blue-500 to-purple-600 flex items-center justify-center">
              <ActivityIcon className="w-3 h-3 text-white" />
            </div>
            <span className="text-xl font-bold text-white">Akashic</span>
          </div>
          <p className="text-sm max-w-md leading-relaxed">
            Next-generation DeFi ecosystem, pioneering the integration of Real-World Assets (RWA) on the Internet of People Network (IOPN).
          </p>
        </div>
        <div>
          <h4 className="text-white font-semibold mb-4">Explore</h4>
          <ul className="space-y-2 text-sm">
            <li><a href="#" className="hover:text-blue-400 transition-colors">RWA Market</a></li>
            <li><a href="#" className="hover:text-blue-400 transition-colors">Governance (DAO)</a></li>
            <li><a href="#" className="hover:text-blue-400 transition-colors">Smart Contracts</a></li>
            <li><a href="#" className="hover:text-blue-400 transition-colors">IOPN Network</a></li>
          </ul>
        </div>
        <div>
          <h4 className="text-white font-semibold mb-4">Resources</h4>
          <ul className="space-y-2 text-sm">
            <li><a href="#" className="hover:text-blue-400 transition-colors">Whitepaper</a></li>
            <li><a href="#" className="hover:text-blue-400 transition-colors">API Documentation</a></li>
            <li><a href="#" className="hover:text-blue-400 transition-colors">Audit Reports</a></li>
            <li><a href="#" className="hover:text-blue-400 transition-colors">Support Center</a></li>
          </ul>
        </div>
      </div>
      <div className="max-w-7xl mx-auto pt-8 border-t border-slate-800 flex flex-col md:flex-row items-center justify-between gap-4 text-xs">
        <p>© 2026 Akashic DeFi. All rights reserved.</p>
        <div className="flex gap-6">
          <a href="#" className="hover:text-white transition-colors">Terms of Service</a>
          <a href="#" className="hover:text-white transition-colors">Privacy Policy</a>
        </div>
      </div>
    </footer>
  );
};

export default function App() {
  return (
    <div className="min-h-screen bg-[#050B14] text-slate-100 font-sans selection:bg-blue-500/30">
      <Navbar />
      <main>
        <Hero />
        <EcosystemTabs />
        <SmartContractWallet />
      </main>
      <Footer />
    </div>
  );
}