/* Client-side calculators - educational only */
(function () {
  function money(n, digits) {
    if (!isFinite(n)) return "-";
    var d = typeof digits === "number" ? digits : 0;
    return n.toLocaleString("en-US", {
      style: "currency",
      currency: "USD",
      maximumFractionDigits: d,
      minimumFractionDigits: d
    });
  }

  function num(id) {
    var el = document.getElementById(id);
    if (!el) return 0;
    return Number(el.value) || 0;
  }

  function setResult(id, html) {
    var el = document.getElementById(id);
    if (el) el.innerHTML = html;
  }

  function payment(loan, annualRatePct, years) {
    var r = annualRatePct / 100 / 12;
    var n = years * 12;
    if (n <= 0) return 0;
    if (r === 0) return loan / n;
    return (loan * r * Math.pow(1 + r, n)) / (Math.pow(1 + r, n) - 1);
  }

  function maxLoanFromPayment(pi, annualRatePct, years) {
    var r = annualRatePct / 100 / 12;
    var n = years * 12;
    if (n <= 0) return 0;
    if (r === 0) return pi * n;
    return (pi * (Math.pow(1 + r, n) - 1)) / (r * Math.pow(1 + r, n));
  }

  // --- Mortgage / payment ---
  var mForm = document.getElementById("mortgage-form");
  if (mForm) {
    mForm.addEventListener("submit", function (e) {
      e.preventDefault();
      var price = num("home-price");
      var downPct = num("down-pct");
      var rate = num("rate");
      var years = num("years") || 30;
      var tax = num("tax-mo");
      var ins = num("ins-mo");
      var hoa = num("hoa-mo");
      var loan = price * (1 - downPct / 100);
      var pi = payment(loan, rate, years);
      var total = pi + tax + ins + hoa;
      setResult(
        "mortgage-result",
        "Est. principal and interest: <strong>" + money(pi) + "/mo</strong><br>" +
        "Est. total (PITI + HOA): <strong>" + money(total) + "/mo</strong><br>" +
        "<span class='muted'>Loan amount " + money(loan) + ". Educational estimate only - not a lender quote.</span>"
      );
    });
  }

  // --- Seller net sheet ---
  var nForm = document.getElementById("net-form");
  if (nForm) {
    nForm.addEventListener("submit", function (e) {
      e.preventDefault();
      var sale = num("sale-price");
      var commission = num("commission");
      var closing = num("closing-costs");
      var repairs = num("repairs");
      var mortgage = num("mortgage-balance");
      var taxes = num("seller-taxes");
      var insurance = num("seller-insurance");
      var other = num("other-costs");
      var commAmt = sale * (commission / 100);
      var costs = commAmt + closing + repairs + mortgage + taxes + insurance + other;
      var net = sale - costs;
      setResult(
        "net-result",
        "Rough estimated net: <strong>" + money(net) + "</strong><br>" +
        "Commission: " + money(commAmt) + "<br>" +
        "Taxes (prorations / amounts due): " + money(taxes) + "<br>" +
        "Insurance (prorations / amounts due): " + money(insurance) + "<br>" +
        "Total estimated costs and payoffs: " + money(costs) + "<br>" +
        "<span class='muted'>Not a guarantee. Title, prorations, concessions, and actual fees vary. Verify independently. Text Tudy for a walkthrough: 918-813-3771.</span>"
      );
    });
  }

  // --- Affordability: how much home ---
  var aForm = document.getElementById("afford-form");
  if (aForm) {
    aForm.addEventListener("submit", function (e) {
      e.preventDefault();
      var income = num("gross-income");
      var debts = num("monthly-debts");
      var dti = num("dti-pct") || 36;
      var rate = num("aff-rate");
      var years = num("aff-years") || 30;
      var downPct = num("aff-down");
      var taxInsHoa = num("aff-tih");
      var maxHousing = Math.max(0, (income / 12) * (dti / 100) - debts);
      var maxPi = Math.max(0, maxHousing - taxInsHoa);
      var maxLoan = maxLoanFromPayment(maxPi, rate, years);
      var maxPrice = downPct >= 100 ? maxLoan : maxLoan / (1 - downPct / 100);
      setResult(
        "afford-result",
        "Est. max housing budget: <strong>" + money(maxHousing) + "/mo</strong><br>" +
        "Est. max P&amp;I: <strong>" + money(maxPi) + "/mo</strong><br>" +
        "Est. max loan: <strong>" + money(maxLoan) + "</strong><br>" +
        "Est. max home price (with " + downPct + "% down): <strong>" + money(maxPrice) + "</strong><br>" +
        "<span class='muted'>Uses a simple DTI model. Lenders use different ratios, credit, and reserves. Educational only.</span>"
      );
    });
  }

  // --- Down payment savings timeline ---
  var dForm = document.getElementById("downpay-form");
  if (dForm) {
    dForm.addEventListener("submit", function (e) {
      e.preventDefault();
      var price = num("dp-price");
      var downPct = num("dp-pct");
      var saved = num("dp-saved");
      var monthly = num("dp-monthly");
      var target = price * (downPct / 100);
      var need = Math.max(0, target - saved);
      var months = monthly > 0 ? Math.ceil(need / monthly) : (need > 0 ? Infinity : 0);
      var msg =
        "Target down payment: <strong>" + money(target) + "</strong><br>" +
        "Still needed: <strong>" + money(need) + "</strong><br>";
      if (!isFinite(months)) {
        msg += "Add a monthly savings amount to estimate a timeline.";
      } else if (months === 0) {
        msg += "You may already have enough for this target (before closing costs/reserves).";
      } else {
        msg += "Est. months to goal: <strong>" + months + "</strong> (~" + (months / 12).toFixed(1) + " years)<br>";
      }
      msg += "<span class='muted'>Does not include closing costs, moving, or reserves. Educational only.</span>";
      setResult("downpay-result", msg);
    });
  }

  // --- Rent vs buy (simplified 5-year style) ---
  var rbForm = document.getElementById("rentbuy-form");
  if (rbForm) {
    rbForm.addEventListener("submit", function (e) {
      e.preventDefault();
      var rent = num("rb-rent");
      var rentInfl = num("rb-rent-infl") / 100;
      var price = num("rb-price");
      var downPct = num("rb-down");
      var rate = num("rb-rate");
      var years = num("rb-loan-years") || 30;
      var taxMo = num("rb-tax");
      var insMo = num("rb-ins");
      var maintMo = num("rb-maint");
      var hoaMo = num("rb-hoa");
      var appr = num("rb-appr") / 100;
      var horizon = num("rb-years") || 5;
      var sellCostPct = num("rb-sell-cost") / 100;

      var down = price * (downPct / 100);
      var loan = price - down;
      var pi = payment(loan, rate, years);
      var ownMo = pi + taxMo + insMo + maintMo + hoaMo;

      var rentCost = 0;
      var r = rent;
      for (var y = 0; y < horizon; y++) {
        rentCost += r * 12;
        r *= 1 + rentInfl;
      }

      var ownCash = down + ownMo * 12 * horizon;
      var futureValue = price * Math.pow(1 + appr, horizon);
      // remaining loan approx after horizon months
      var rMo = rate / 100 / 12;
      var n = years * 12;
      var paid = horizon * 12;
      var bal = loan;
      if (rMo === 0) bal = Math.max(0, loan - (loan / n) * paid);
      else bal = loan * (Math.pow(1 + rMo, n) - Math.pow(1 + rMo, paid)) / (Math.pow(1 + rMo, n) - 1);
      var sellCosts = futureValue * sellCostPct;
      var equity = futureValue - bal - sellCosts;
      var ownNetCost = ownCash - equity;

      var better = ownNetCost < rentCost ? "Buying looks cheaper in this simplified model." : "Renting looks cheaper in this simplified model.";
      setResult(
        "rentbuy-result",
        "Over " + horizon + " years (rough):<br>" +
        "Total rent paid: <strong>" + money(rentCost) + "</strong><br>" +
        "Cash spent owning (down + housing): <strong>" + money(ownCash) + "</strong><br>" +
        "Est. equity after sale costs: <strong>" + money(equity) + "</strong><br>" +
        "Net cost of owning (cash − equity): <strong>" + money(ownNetCost) + "</strong><br>" +
        "<strong>" + better + "</strong><br>" +
        "<span class='muted'>Ignores tax deductions, opportunity cost of down payment, renovations, and market shocks. Educational only - not advice.</span>"
      );
    });
  }

  // --- Buyer closing cost estimator ---
  var bcForm = document.getElementById("buyclose-form");
  if (bcForm) {
    bcForm.addEventListener("submit", function (e) {
      e.preventDefault();
      var price = num("bc-price");
      var loanPct = num("bc-ltv");
      var closePct = num("bc-close-pct");
      var prepaid = num("bc-prepaid");
      var other = num("bc-other");
      var loan = price * (loanPct / 100);
      var closeFees = price * (closePct / 100);
      var total = closeFees + prepaid + other;
      setResult(
        "buyclose-result",
        "Est. loan amount: <strong>" + money(loan) + "</strong><br>" +
        "Est. closing fees (" + closePct + "% of price): <strong>" + money(closeFees) + "</strong><br>" +
        "Prepaids / escrows entered: " + money(prepaid) + "<br>" +
        "Other: " + money(other) + "<br>" +
        "Rough cash to close (fees + prepaids + other, not including down payment): <strong>" + money(total) + "</strong><br>" +
        "<span class='muted'>Typical total buyer costs often land ~2–5% of price depending on loan and credits. Not a title or lender quote.</span>"
      );
    });
  }

  // --- Rental cash flow ---
  var cfForm = document.getElementById("cashflow-form");
  if (cfForm) {
    cfForm.addEventListener("submit", function (e) {
      e.preventDefault();
      var rent = num("cf-rent");
      var otherInc = num("cf-other-inc");
      var vacancy = num("cf-vacancy") / 100;
      var taxes = num("cf-taxes");
      var ins = num("cf-ins");
      var maint = num("cf-maint");
      var propMgmt = num("cf-mgmt");
      var utilities = num("cf-util");
      var hoa = num("cf-hoa");
      var otherExp = num("cf-other-exp");
      var mortgage = num("cf-mortgage");
      var price = num("cf-price");

      var gpi = rent + otherInc;
      var egi = gpi * (1 - vacancy);
      var opex = taxes + ins + maint + propMgmt + utilities + hoa + otherExp;
      var noi = egi - opex;
      var cashFlow = noi - mortgage;
      var cap = price > 0 ? (noi * 12) / price : 0;
      var coc = price > 0 ? (cashFlow * 12) / (price * 0.25) : 0; // rough 25% down assumption for CoC display only

      setResult(
        "cashflow-result",
        "Effective gross income: <strong>" + money(egi) + "/mo</strong><br>" +
        "Operating expenses: <strong>" + money(opex) + "/mo</strong><br>" +
        "NOI (before mortgage): <strong>" + money(noi) + "/mo</strong> (" + money(noi * 12) + "/yr)<br>" +
        "Cash flow after mortgage: <strong>" + money(cashFlow) + "/mo</strong><br>" +
        "Rough cap rate (NOI/price): <strong>" + (cap * 100).toFixed(2) + "%</strong><br>" +
        "<span class='muted'>Cap rate ignores financing. Cash-on-cash depends on your actual down payment and costs. Educational only.</span>"
      );
    });
  }

  // --- Flip / BRRRR rough ---
  var flipForm = document.getElementById("flip-form");
  if (flipForm) {
    flipForm.addEventListener("submit", function (e) {
      e.preventDefault();
      var purchase = num("flip-purchase");
      var rehab = num("flip-rehab");
      var holding = num("flip-holding");
      var closingBuy = num("flip-close-buy");
      var closingSell = num("flip-close-sell");
      var arv = num("flip-arv");
      var totalIn = purchase + rehab + holding + closingBuy + closingSell;
      var profit = arv - totalIn;
      var margin = arv > 0 ? profit / arv : 0;
      setResult(
        "flip-result",
        "Total project cost (all-in): <strong>" + money(totalIn) + "</strong><br>" +
        "ARV: <strong>" + money(arv) + "</strong><br>" +
        "Rough profit: <strong>" + money(profit) + "</strong> (" + (margin * 100).toFixed(1) + "% of ARV)<br>" +
        "<span class='muted'>Does not include financing interest detail, unexpected repairs, or tax. Educational only - not investment advice.</span>"
      );
    });
  }

  // --- Sell or rent rough ---
  var srForm = document.getElementById("sellrent-form");
  if (srForm) {
    srForm.addEventListener("submit", function (e) {
      e.preventDefault();
      var value = num("sr-value");
      var mortgage = num("sr-mortgage-bal");
      var sellCostPct = num("sr-sell-cost") / 100;
      var rent = num("sr-rent");
      var expenses = num("sr-exp");
      var pitia = num("sr-pitia");
      var years = num("sr-years") || 5;

      var sellNet = value - mortgage - value * sellCostPct;
      var annualCash = (rent - expenses - pitia) * 12;
      var rentCashTotal = annualCash * years;
      // simple: keep property, equity growth ignored beyond mortgage paydown
      setResult(
        "sellrent-result",
        "Est. cash if you sell now: <strong>" + money(sellNet) + "</strong><br>" +
        "Est. annual cash flow if you rent: <strong>" + money(annualCash) + "/yr</strong><br>" +
        "Est. cash flow over " + years + " years (no appreciation modeled): <strong>" + money(rentCashTotal) + "</strong><br>" +
        (annualCash >= 0
          ? "Renting may produce positive cash flow in this model - still weigh management, vacancy, and risk."
          : "Renting looks negative cash flow here - selling (or raising rent/cutting costs) may fit better.") +
        "<br><span class='muted'>Ignores appreciation, tax, capex spikes, and opportunity cost. Educational only.</span>"
      );
    });
  }

  // --- Home prep cost sum ---
  var prepForm = document.getElementById("prep-form");
  if (prepForm) {
    prepForm.addEventListener("submit", function (e) {
      e.preventDefault();
      var ids = ["prep-clean", "prep-paint", "prep-carpet", "prep-land", "prep-repairs", "prep-stage", "prep-other"];
      var total = 0;
      ids.forEach(function (id) { total += num(id); });
      setResult(
        "prep-result",
        "Rough prep budget total: <strong>" + money(total) + "</strong><br>" +
        "<span class='muted'>Spending does not guarantee a higher sale price. Prioritize high-ROI fixes - ask Tudy what buyers notice most.</span>"
      );
    });
  }
})();
