```javascript
// =============================
// AKASHIC
// Powered by OPN Network
// =============================

const CONTRACT_ADDRESS =
"0x12Fc16A532b463AEfb23A7d9F3F97D275F4c36d0";

// ABI rút gọn
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

// =============================
// Connect Wallet
// =============================

async function connectWallet(){

    if(!window.ethereum){

        alert(
            "Please install MetaMask"
        );

        return;
    }

    try{

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
        ).innerText =
        shortenAddress(address);

        // kiểm tra network
        const network =
        await provider.getNetwork();

        if(network.chainId !== 984){

            alert(
                "Please switch to OPN Testnet (Chain ID 984)"
            );

        }

        contract =
        new ethers.Contract(

            CONTRACT_ADDRESS,

            ABI,

            provider

        );

        loadDashboard(address);

    }

    catch(error){

        console.log(error);

    }

}

// =============================
// Dashboard
// =============================

async function loadDashboard(address){

    try{

        const symbol =
        await contract.symbol();

        const decimals =
        await contract.decimals();

        const balance =
        await contract.balanceOf(address);

        document.getElementById(
            "tokenBalance"
        ).innerText =

        Number(

            ethers.utils.formatUnits(
                balance,
                decimals
            )

        ).toLocaleString()

        +

        " "

        +

        symbol;

        const totalSupply =
        await contract.totalSupply();

        document.getElementById(
            "totalSupply"
        ).innerText =

        Number(

            ethers.utils.formatUnits(
                totalSupply,
                decimals
            )

        ).toLocaleString()

        +

        " "

        +

        symbol;

        const owner =
        await contract.owner();

        document.getElementById(
            "ownerAddress"
        ).innerText =
        shortenAddress(owner);

    }

    catch(error){

        console.log(error);

    }

}

// =============================
// Address Formatter
// =============================

function shortenAddress(address){

    return (

        address.substring(0,6)

        +

        "..."

        +

        address.substring(38)

    );

}

// =============================
// Auto reconnect
// =============================

window.addEventListener(

    "load",

    async ()=>{

        if(window.ethereum){

            try{

                const accounts =
                await ethereum.request({

                    method:
                    "eth_accounts"

                });

                if(accounts.length > 0){

                    connectWallet();

                }

            }

            catch(error){

                console.log(error);

            }

        }

    }

);

// =============================
// Button Event
// =============================

document

.getElementById(
    "connectButton"
)

.addEventListener(

    "click",

    connectWallet

);
```
