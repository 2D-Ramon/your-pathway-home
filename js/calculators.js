/* Client-side calculators - educational only */
(function () {
  function money(n) {
    if (!isFinite(n)) return "-";
    return n.toLocaleString("en-US", { style: "currency", currency: "USD", maximumFractionDigits: 0 });
  }

  // Mortgage / affordability
  var mForm = document.getElementById("mortgage-form");
  if (mForm) {
    mForm.addEventListener("submit", function (e) {
      e.preventDefault();
      var price = Number(document.getElementById("home-price").value) || 0;
      var downPct = Number(document.getElementById("down-pct").value) || 0;
      var rate = Number(document.getElementById("rate").value) || 0;
      var years = Number(document.getElementById("years").value) || 30;
      var tax = Number(document.getElementById("tax-mo").value) || 0;
      var ins = Number(document.getElementById("ins-mo").value) || 0;
      var hoa = Number(document.getElementById("hoa-mo").value) || 0;

      var loan = price * (1 - downPct / 100);
      var r = rate / 100 / 12;
      var n = years * 12;
      var pi = 0;
      if (r === 0) pi = loan / n;
      else pi = (loan * r * Math.pow(1 + r, n)) / (Math.pow(1 + r, n) - 1);
      var total = pi + tax + ins + hoa;

      document.getElementById("mortgage-result").innerHTML =
        "Est. principal and interest: <strong>" + money(pi) + "/mo</strong><br>" +
        "Est. total (PITI + HOA): <strong>" + money(total) + "/mo</strong><br>" +
        "<span class='muted'>Loan amount " + money(loan) + ". Educational estimate only - not a lender quote.</span>";
    });
  }

  // Seller net sheet (educational) - includes taxes and insurance
  var nForm = document.getElementById("net-form");
  if (nForm) {
    nForm.addEventListener("submit", function (e) {
      e.preventDefault();
      var sale = Number(document.getElementById("sale-price").value) || 0;
      var commission = Number(document.getElementById("commission").value) || 0;
      var closing = Number(document.getElementById("closing-costs").value) || 0;
      var repairs = Number(document.getElementById("repairs").value) || 0;
      var mortgage = Number(document.getElementById("mortgage-balance").value) || 0;
      var taxes = Number(document.getElementById("seller-taxes").value) || 0;
      var insurance = Number(document.getElementById("seller-insurance").value) || 0;
      var other = Number(document.getElementById("other-costs").value) || 0;

      var commAmt = sale * (commission / 100);
      var costs = commAmt + closing + repairs + mortgage + taxes + insurance + other;
      var net = sale - costs;

      document.getElementById("net-result").innerHTML =
        "Rough estimated net: <strong>" + money(net) + "</strong><br>" +
        "Commission: " + money(commAmt) + "<br>" +
        "Taxes (prorations / amounts due): " + money(taxes) + "<br>" +
        "Insurance (prorations / amounts due): " + money(insurance) + "<br>" +
        "Total estimated costs and payoffs: " + money(costs) + "<br>" +
        "<span class='muted'>Not a guarantee. Title, prorations, concessions, and actual fees vary. Verify independently. Text Tudy for a walkthrough: 918-813-3771.</span>";
    });
  }
})();
