const CONTRACT_ADDRESS =
"0x962D4Cf024F687e5f04176ead33f461D371a7A0F";

const ABI = [

"function balanceOf(address) view returns (uint256)",

"function totalSupply() view returns (uint256)",

"function symbol() view returns (string)",

"function decimals() view returns (uint8)"

];

let provider;
let signer;
let contract;

async function connectWallet() {

    if (!window.ethereum) {

        alert("Please install MetaMask");

        return;
    }

    provider = new ethers.providers.Web3Provider(
        window.ethereum
    );

    await provider.send(
        "eth_requestAccounts",
        []
    );

    signer = provider.getSigner();

    const address =
        await signer.getAddress();

    document.getElementById(
        "walletAddress"
    ).innerText = address;

    contract = new ethers.Contract(
        CONTRACT_ADDRESS,
        ABI,
        provider
    );

    await loadTokenData(address);
}

async function loadTokenData(address) {

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
}

document
.getElementById("connectButton")
.addEventListener(
    "click",
    connectWallet
);
