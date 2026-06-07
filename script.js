async function connectWallet() {

    if (!window.ethereum) {
        alert("Please install MetaMask");
        return;
    }

    const accounts = await ethereum.request({
        method: "eth_requestAccounts"
    });

    document.getElementById("walletAddress").innerText =
        accounts[0];
}

document
.getElementById("connectButton")
.addEventListener("click", connectWallet);
