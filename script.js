// =========================
// AKASHIC
// Powered by OPN Network
// =========================

const CONTRACT_ADDRESS =
"0x12Fc16A532b463AEfb23A7d9F3F97D275F4c36d0";

const ABI = [

"function name() view returns(string)",
"function symbol() view returns(string)",
"function decimals() view returns(uint8)",
"function totalSupply() view returns(uint256)",
"function balanceOf(address) view returns(uint256)",
"function owner() view returns(address)",

"function transfer(address,uint256) returns(bool)",

"function mint(address,uint256)"

];

let provider;
let signer;
let contract;


// =========================
// Connect Wallet
// =========================

async function connectWallet() {

    if (!window.ethereum) {

        alert("Please install MetaMask");

        return;
    }

    try {

        provider = new ethers.providers.Web3Provider(window.ethereum);

        await provider.send(
            "eth_requestAccounts",
            []
        );

        signer = provider.getSigner();

        const address =
            await signer.getAddress();

        document.getElementById(
            "walletAddress"
        ).innerText =
            shortenAddress(address);

        contract = new ethers.Contract(

            CONTRACT_ADDRESS,
            ABI,
            signer

        );

        await loadDashboard(address);

        document.getElementById(
            "connectButton"
        ).innerText =
            "Connected";

    }

    catch (error) {

        console.log(error);

    }

}


// =========================
// Dashboard
// =========================

async function loadDashboard(address) {

    try {

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

    catch (error) {

        console.log(error);

    }

}


// =========================
// Address Format
// =========================

function shortenAddress(address) {

    return (

        address.substring(0, 6)

        +

        "..."

        +

        address.substring(38)

    );

}


// =========================
// Auto Reconnect
// =========================

window.addEventListener(

    "load",

    async () => {

        if (window.ethereum) {

            try {

                const accounts =
                    await window.ethereum.request({

                        method:
                            "eth_accounts"

                    });

                if (accounts.length > 0) {

                    connectWallet();

                }

            }

            catch (error) {

                console.log(error);

            }

        }

    }

);


// =========================
// Button Event
// =========================

document
.getElementById(
    "connectButton"
)
.addEventListener(

    "click",

    connectWallet

);
