const CONTRACT_ADDRESS =
"0x12Fc16A532b463AEfb23A7d9F3F97D275F4c36d0";

const ABI = [

"function name() view returns(string)",
"function symbol() view returns(string)",
"function decimals() view returns(uint8)",
"function totalSupply() view returns(uint256)",
"function balanceOf(address) view returns(uint256)",
"function owner() view returns(address)"

];

let provider;
let signer;
let contract;

async function connectWallet(){

if(!window.ethereum){

alert("Install MetaMask");

return;

}

provider =
new ethers.providers.Web3Provider(
window.ethereum
);

await provider.send(
"eth_requestAccounts",
[]
);

signer =
provider.getSigner();

const address =
await signer.getAddress();

document.getElementById(
"walletAddress"
).innerText = address;

contract =
new ethers.Contract(
CONTRACT_ADDRESS,
ABI,
provider
);

loadData(address);

}

async function loadData(address){

const decimals =
await contract.decimals();

const balance =
await contract.balanceOf(address);

document.getElementById(
"tokenBalance"
).innerText =
ethers.utils.formatUnits(
balance,
decimals
);

const supply =
await contract.totalSupply();

document.getElementById(
"totalSupply"
).innerText =
ethers.utils.formatUnits(
supply,
decimals
);

const owner =
await contract.owner();

document.getElementById(
"ownerAddress"
).innerText =
owner;

}

document
.getElementById(
"connectButton"
)
.addEventListener(
"click",
connectWallet
);
