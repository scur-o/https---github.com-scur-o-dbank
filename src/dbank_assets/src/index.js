import { dbank } from "../../declarations/dbank";

window.addEventListener("load", async () => {
    update()
});

document.querySelector('form').addEventListener("submit", async (e) => {
    e.preventDefault();

    const button = e.target.querySelector("#submit-btn")
    const depositAmount = parseFloat(document.getElementById('input-amount').value);
    const withdrawAmount = parseFloat(document.getElementById('withdrawal-amount').value);
    button.setAttribute("disabled", true)

    // --------------------- Deposit -------------------------- //
    if (document.getElementById("input-amount").value.length > 0) {
        await dbank.depositFunds(depositAmount);
        document.getElementById("input-amount").value = "";
    };


    // --------------------- Withdraw -------------------------- //   
    if (document.getElementById("withdrawal-amount").value.length > 0) {
        await dbank.withdrawFunds(withdrawAmount);
        document.getElementById("withdrawal-amount").value = "";
    };


    // --------------------- Reset button + amount -------------------------- //
    update()
    button.removeAttribute("disabled");
});


async function update() {
    const currentAmount = await dbank.checkBalance();
    document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;
}