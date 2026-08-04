# Additional free tools, guides, and resource pages (dot-sourced by _build-pages.ps1)
# Requires: Write-Page function already defined

$calc = '<script src="js/calculators.js"></script>'
$cta = '<p style="margin-top:1.25rem"><a class="btn btn-primary" href="sms:9188133771">Text Tudy 918-813-3771</a> <a class="btn btn-ghost" href="tools.html">Tools hub</a> <a class="btn btn-ghost" href="https://tudyvaldez.axenrealty.com/contact-lead" target="_blank" rel="noopener">Contact form</a></p>'
$edu = '<div class="disclaimer">Educational only - not lender, tax, legal, appraisal, or investment advice. Rules change. Verify with licensed professionals and official sources.</div>'

# ========== BUYER CALCULATORS ==========
Write-Page 'tools-affordability.html' 'Affordability Calculator' 'tools-affordability' @"
<section class="page-hero"><div class="container">
  <span class="badge">Buyer tools</span>
  <h1>How much home can I afford?</h1>
  <p class="lead">Simple DTI-based estimate of a monthly housing budget and home price range.</p>
  <p><a class="btn btn-ghost" href="tools.html#buyers">All buyer tools</a></p>
</div></section>
<section><div class="container">
  <div class="tool-panel">
    <form id="afford-form" class="form">
      <div class="grid-2">
        <label>Gross annual household income (`$)<input id="gross-income" type="number" value="90000" min="0" step="1000" /></label>
        <label>Other monthly debts (`$)<span class="tool-hint">Car, student loans, credit cards, etc. NOT rent or utilities.</span><input id="monthly-debts" type="number" value="400" min="0" step="50" /></label>
        <label>Target DTI for housing (%)<input id="dti-pct" type="number" value="36" min="1" max="55" step="1" /></label>
        <label>Interest rate (%)<input id="aff-rate" type="number" value="6.5" min="0" step="0.125" /></label>
        <label>Loan term (years)<input id="aff-years" type="number" value="30" min="1" max="40" /></label>
        <label>Down payment (%)<span class="tool-hint">At 20% or higher, this model estimates `$0 PMI (no private mortgage insurance).</span><input id="aff-down" type="number" value="5" min="0" max="100" step="0.5" /></label>
        <label>Est. taxes + insurance + HOA / mo (`$)<input id="aff-tih" type="number" value="400" min="0" step="25" /></label>
      </div>
      <button class="btn btn-primary" type="submit">Estimate</button>
    </form>
    <div class="tool-result" id="afford-result">Enter numbers and estimate.</div>
    $edu
  </div>
  $cta
</div></section>
"@ $calc

Write-Page 'tools-down-payment.html' 'Down Payment Savings' 'tools-down-payment' @"
<section class="page-hero"><div class="container">
  <span class="badge">Buyer tools</span>
  <h1>Down payment savings timeline</h1>
  <p class="lead">See how long it may take to reach your target down payment at your current savings rate.</p>
  <p><a class="btn btn-ghost" href="tools.html#buyers">All buyer tools</a></p>
</div></section>
<section><div class="container">
  <div class="tool-panel">
    <form id="downpay-form" class="form">
      <div class="grid-2">
        <label>Target home price (`$)<input id="dp-price" type="number" value="300000" min="0" step="1000" /></label>
        <label>Down payment (%)<input id="dp-pct" type="number" value="5" min="0" max="100" step="0.5" /></label>
        <label>Already saved (`$)<input id="dp-saved" type="number" value="5000" min="0" step="500" /></label>
        <label>Monthly savings (`$)<input id="dp-monthly" type="number" value="800" min="0" step="50" /></label>
      </div>
      <button class="btn btn-primary" type="submit">Calculate timeline</button>
    </form>
    <div class="tool-result" id="downpay-result">Enter numbers and calculate.</div>
    $edu
  </div>
  $cta
</div></section>
"@ $calc

Write-Page 'tools-rent-vs-buy.html' 'Rent vs Buy' 'tools-rent-vs-buy' @"
<section class="page-hero"><div class="container">
  <span class="badge">Buyer tools</span>
  <h1>Rent vs buy calculator</h1>
  <p class="lead">A simplified multi-year comparison. Fields are split into <strong>Renting</strong> vs <strong>Home purchase</strong>. Not a final decision model.</p>
  <p><a class="btn btn-ghost" href="tools.html#buyers">All buyer tools</a></p>
</div></section>
<section><div class="container">
  <div class="tool-panel">
    <form id="rentbuy-form" class="form">
      <fieldset class="tool-fieldset">
        <legend>Renting (stay a renter)</legend>
        <div class="grid-2">
          <label>Current rent / mo (`$)<input id="rb-rent" type="number" value="1600" min="0" step="50" /></label>
          <label>Expected rent increases / yr (%)<input id="rb-rent-infl" type="number" value="3" min="0" step="0.25" /></label>
        </div>
      </fieldset>
      <fieldset class="tool-fieldset">
        <legend>Home purchase (if you buy)</legend>
        <div class="grid-2">
          <label>Home purchase price (`$)<input id="rb-price" type="number" value="300000" min="0" step="1000" /></label>
          <label>Down payment (%)<input id="rb-down" type="number" value="5" min="0" max="100" step="0.5" /></label>
          <label>Mortgage interest rate (%)<input id="rb-rate" type="number" value="6.5" min="0" step="0.125" /></label>
          <label>Loan term (years)<input id="rb-loan-years" type="number" value="30" min="1" max="40" /></label>
          <label>Property tax / mo (`$)<input id="rb-tax" type="number" value="250" min="0" /></label>
          <label>Homeowners insurance / mo (`$)<input id="rb-ins" type="number" value="150" min="0" /></label>
          <label>Maintenance / mo (`$)<input id="rb-maint" type="number" value="200" min="0" /></label>
          <label>HOA / mo (`$)<input id="rb-hoa" type="number" value="0" min="0" /></label>
          <label>Home appreciation / yr (%)<input id="rb-appr" type="number" value="2.5" step="0.25" /></label>
          <label>Years you plan to stay<input id="rb-years" type="number" value="5" min="1" max="30" /></label>
          <label>Selling costs when you sell later (% of future value)<input id="rb-sell-cost" type="number" value="7" min="0" step="0.5" /></label>
        </div>
      </fieldset>
      <button class="btn btn-primary" type="submit">Compare renting vs buying</button>
    </form>
    <div class="tool-result" id="rentbuy-result">Enter numbers and compare.</div>
    $edu
  </div>
  $cta
</div></section>
"@ $calc

Write-Page 'tools-preapproval.html' 'Pre-Approval Checklist' 'tools-preapproval' @"
<section class="page-hero"><div class="container">
  <span class="badge">Buyer tools</span>
  <h1>Pre-approval checklist</h1>
  <p class="lead">What to gather so a lender can pre-approve you - and why it matters before serious touring.</p>
  <p><a class="btn btn-ghost" href="tools.html#buyers">All buyer tools</a></p>
</div></section>
<section><div class="container">
  <div class="tool-panel">
    <div class="checklist">
      <label><input type="checkbox" /> Government ID</label>
      <label><input type="checkbox" /> Last 2 years W-2s (or tax returns if self-employed)</label>
      <label><input type="checkbox" /> Recent pay stubs (often 30 days)</label>
      <label><input type="checkbox" /> Last 2 months bank statements (all pages)</label>
      <label><input type="checkbox" /> Other income docs (SSI, child support, rental, etc. if used)</label>
      <label><input type="checkbox" /> Gift letter draft if using gift funds</label>
      <label><input type="checkbox" /> Landlord contact / rent history if asked</label>
      <label><input type="checkbox" /> List of monthly debts (cars, student loans, cards)</label>
      <label><input type="checkbox" /> Credit checked with a lender (not just a free soft-pull app)</label>
      <label><input type="checkbox" /> Pre-approval letter in hand before writing strong offers</label>
    </div>
  </div>
  <div class="prose" style="margin-top:1.5rem">
    <h2>Why pre-approval first?</h2>
    <p>You learn a realistic budget, sellers take you seriously, and you waste less time on homes that will not finance. Need a local lender introduction? Text Tudy - happy to connect you (no pressure).</p>
    $edu
    $cta
  </div>
</div></section>
"@

Write-Page 'guides-offer-strategy.html' 'Offer Strategy' 'guides-offer-strategy' @"
<section class="page-hero"><div class="container">
  <span class="badge">Buyer guides</span>
  <h1>Offer strategy</h1>
  <p class="lead">Price is only one lever. Terms, timing, and risk allocation matter just as much.</p>
  <p><a class="btn btn-ghost" href="tools.html#buyers">All buyer tools</a></p>
</div></section>
<section><div class="container prose">
  <h2>Core pieces of an offer</h2>
  <ul>
    <li><strong>Price</strong> - where you land vs comps and list strategy.</li>
    <li><strong>Earnest money</strong> - good-faith deposit that shows seriousness.</li>
    <li><strong>Financing type</strong> - conventional, FHA, VA, USDA, cash (see loan guide).</li>
    <li><strong>Contingencies</strong> - inspection, appraisal, financing, sale of current home.</li>
    <li><strong>Closing date &amp; possession</strong> - can win deals without being highest price.</li>
    <li><strong>Repairs / credits</strong> - negotiated after inspection, or sometimes upfront.</li>
  </ul>
  <h2>Competitive market tips</h2>
  <ul>
    <li>Be pre-approved, not just pre-qualified.</li>
    <li>Respond fast - good homes move.</li>
    <li>Know your walk-away number before emotions spike.</li>
    <li>Clean terms can beat a slightly higher messy offer.</li>
  </ul>
  <h2>Slower market tips</h2>
  <ul>
    <li>Ask for inspection period, credits, or rate-buydown help when it fits.</li>
    <li>Use comps and days-on-market - do not negotiate blind.</li>
  </ul>
  $edu
  $cta
</div></section>
"@

Write-Page 'resources-schools.html' 'Schools Hub' 'resources-schools' @"
<section class="page-hero"><div class="container">
  <span class="badge">Buyer resources</span>
  <h1>Schools &amp; districts (Tulsa metro)</h1>
  <p class="lead">Start with official district sites and independent research. School fit is personal - verify boundaries for a specific address.</p>
  <p><a class="btn btn-ghost" href="tools.html#buyers">All buyer tools</a></p>
</div></section>
<section><div class="container prose">
  <h2>Official district starting points</h2>
  <ul>
    <li><a href="https://www.tulsaschools.org/" target="_blank" rel="noopener">Tulsa Public Schools</a></li>
    <li><a href="https://www.jenksps.org/" target="_blank" rel="noopener">Jenks Public Schools</a></li>
    <li><a href="https://www.bixbyps.org/" target="_blank" rel="noopener">Bixby Public Schools</a></li>
    <li><a href="https://www.baschools.org/" target="_blank" rel="noopener">Broken Arrow Public Schools</a></li>
    <li><a href="https://www.owassops.org/" target="_blank" rel="noopener">Owasso Public Schools</a></li>
    <li><a href="https://www.sandites.org/" target="_blank" rel="noopener">Sand Springs Public Schools</a></li>
    <li><a href="https://www.glenpoolps.org/" target="_blank" rel="noopener">Glenpool Public Schools</a></li>
    <li><a href="https://www.unionps.org/" target="_blank" rel="noopener">Union Public Schools</a></li>
  </ul>
  <h2>Research tools</h2>
  <ul>
    <li><a href="https://www.greatschools.org/" target="_blank" rel="noopener">GreatSchools</a> - parent/research ratings (one input, not the whole story)</li>
    <li><a href="https://nces.ed.gov/ccd/schoolsearch/" target="_blank" rel="noopener">NCES school search</a> - federal school directory data</li>
    <li><a href="https://sde.ok.gov/" target="_blank" rel="noopener">Oklahoma State Department of Education</a></li>
  </ul>
  <div class="alert"><strong>Boundary tip:</strong> Always confirm which school a specific address feeds into with the district. Websites and maps can lag.</div>
  $edu
  $cta
</div></section>
"@

Write-Page 'resources-commute.html' 'Commute & Neighborhood Fit' 'resources-commute' @"
<section class="page-hero"><div class="container">
  <span class="badge">Buyer resources</span>
  <h1>Commute &amp; neighborhood fit</h1>
  <p class="lead">A home can look perfect online and fail Monday morning traffic. Use this guide before you fall in love with a listing.</p>
  <p><a class="btn btn-ghost" href="tools.html#buyers">All buyer tools</a> <a class="btn btn-ghost" href="neighborhoods.html">Neighborhoods</a></p>
</div></section>
<section><div class="container prose">
  <h2>Questions that save regret</h2>
  <ul>
    <li>What time will I actually leave for work - and return?</li>
    <li>How many days per week am I in-office vs remote?</li>
    <li>Do I need highway access, or is surface-street life fine?</li>
    <li>Where are schools, daycare, gym, worship, and grocery on the map?</li>
    <li>Will guests / teens / aging parents navigate this easily?</li>
  </ul>
  <h2>Try this before you offer</h2>
  <ol>
    <li>Drive the commute at your real departure time (not Saturday noon).</li>
    <li>Park and walk a block - listen for noise, note lighting, sidewalks.</li>
    <li>Check flood / drainage history for the street (see flood resource page).</li>
    <li>Look up HOA rules if applicable (pets, parking, rentals, fences).</li>
  </ol>
  <h2>Map tools</h2>
  <ul>
    <li><a href="https://www.google.com/maps" target="_blank" rel="noopener">Google Maps</a> - commute and traffic layers</li>
    <li><a href="https://www.google.com/maps" target="_blank" rel="noopener">Street View</a> - curb and corridor feel</li>
  </ul>
  <p>Want a short list of areas that match your commute + budget? Text Tudy your workplace zip and must-haves.</p>
  $cta
</div></section>
"@

# ========== SELLERS ==========
Write-Page 'tools-home-prep.html' 'Home Prep Cost Estimator' 'tools-home-prep' @"
<section class="page-hero"><div class="container">
  <span class="badge">Seller tools</span>
  <h1>Home prep cost estimator</h1>
  <p class="lead">Budget the common prep categories before you list. Spending does not guarantee a higher price - prioritize what buyers notice.</p>
  <p><a class="btn btn-ghost" href="tools.html#sellers">All seller tools</a></p>
</div></section>
<section><div class="container">
  <div class="tool-panel">
    <form id="prep-form" class="form">
      <div class="grid-2">
        <label>Deep clean (`$)<input id="prep-clean" type="number" value="400" min="0" step="50" /></label>
        <label>Paint / touch-up (`$)<input id="prep-paint" type="number" value="800" min="0" step="50" /></label>
        <label>Carpet / flooring (`$)<input id="prep-carpet" type="number" value="0" min="0" step="100" /></label>
        <label>Landscaping / curb (`$)<input id="prep-land" type="number" value="300" min="0" step="50" /></label>
        <label>Repairs (`$)<input id="prep-repairs" type="number" value="500" min="0" step="50" /></label>
        <label>Staging / declutter help (`$)<input id="prep-stage" type="number" value="0" min="0" step="50" /></label>
        <label>Other (`$)<input id="prep-other" type="number" value="0" min="0" step="50" /></label>
      </div>
      <button class="btn btn-primary" type="submit">Total prep budget</button>
    </form>
    <div class="tool-result" id="prep-result">Enter numbers and total.</div>
    $edu
  </div>
  $cta
</div></section>
"@ $calc

Write-Page 'guides-pricing-strategy.html' 'Pricing Strategy' 'guides-pricing-strategy' @"
<section class="page-hero"><div class="container">
  <span class="badge">Seller guides</span>
  <h1>Pricing strategy guide</h1>
  <p class="lead">Price for the market you have - not the market you wish you had.</p>
  <p><a class="btn btn-ghost" href="tools.html#sellers">All seller tools</a></p>
</div></section>
<section><div class="container prose">
  <h2>What drives list price</h2>
  <ul>
    <li>Recent comparable sales (condition-adjusted)</li>
    <li>Active competition and days on market (DOM)</li>
    <li>Interest rates and buyer purchasing power</li>
    <li>Your goals: speed vs max price vs convenience</li>
  </ul>
  <h2>Common pricing mistakes</h2>
  <ul>
    <li>Pricing from what a neighbor "heard they got"</li>
    <li>Adding every improvement dollar-for-dollar</li>
    <li>Testing a high number "just to see" and burning DOM</li>
    <li>Ignoring photos and condition while blaming price alone</li>
  </ul>
  <h2>DOM mindset</h2>
  <p>Fresh listings get the most attention. Overpricing early can force larger cuts later. A clean CMA with Tudy beats guesswork.</p>
  $edu
  $cta
</div></section>
"@

Write-Page 'tools-moving-checklist.html' 'Moving Timeline Checklist' 'tools-moving-checklist' @"
<section class="page-hero"><div class="container">
  <span class="badge">Seller tools</span>
  <h1>Moving timeline checklist</h1>
  <p class="lead">From "thinking about listing" to keys-out - a simple timeline you can check off.</p>
  <p><a class="btn btn-ghost" href="tools.html#sellers">All seller tools</a></p>
</div></section>
<section><div class="container">
  <div class="tool-panel">
    <h3>6–8 weeks out</h3>
    <div class="checklist">
      <label><input type="checkbox" /> Talk goals, timing, and rough net with Tudy</label>
      <label><input type="checkbox" /> Declutter / donate plan started</label>
      <label><input type="checkbox" /> List repairs that are cheap but high-visibility</label>
    </div>
    <h3 style="margin-top:1.25rem">3–4 weeks out</h3>
    <div class="checklist">
      <label><input type="checkbox" /> Deep clean booked or scheduled</label>
      <label><input type="checkbox" /> Photos / media plan set</label>
      <label><input type="checkbox" /> Gather HOA docs, warranties, keys, remotes</label>
    </div>
    <h3 style="margin-top:1.25rem">Under contract</h3>
    <div class="checklist">
      <label><input type="checkbox" /> Buyer inspection window on calendar</label>
      <label><input type="checkbox" /> Movers / truck reserved if needed</label>
      <label><input type="checkbox" /> Utility transfer plan (gas, electric, water, internet)</label>
      <label><input type="checkbox" /> Change-of-address started</label>
    </div>
    <h3 style="margin-top:1.25rem">Closing week</h3>
    <div class="checklist">
      <label><input type="checkbox" /> Final walkthrough scheduled</label>
      <label><input type="checkbox" /> Wire instructions verified with title (never trust random emails)</label>
      <label><input type="checkbox" /> Keys, codes, garage remotes ready</label>
    </div>
  </div>
  $cta
</div></section>
"@

Write-Page 'guides-capital-gains.html' 'Capital Gains Basics' 'guides-capital-gains' @"
<section class="page-hero"><div class="container">
  <span class="badge">Seller guides</span>
  <h1>Primary residence &amp; capital gains (basics)</h1>
  <p class="lead">High-level concepts only. Tax outcomes depend on your facts - talk to a CPA or tax attorney.</p>
  <p><a class="btn btn-ghost" href="tools.html#sellers">All seller tools</a></p>
</div></section>
<section><div class="container prose">
  <h2>Why sellers ask about this</h2>
  <p>If your home appreciated, you may wonder how much of the gain is taxable when you sell. Special rules often apply to a <strong>primary residence</strong>.</p>
  <h2>Section 121 exclusion (concept)</h2>
  <p>Many primary-residence sellers may exclude some gain if they meet ownership and use tests (commonly described as 2 of the last 5 years - confirm current IRS rules). Limits differ for single vs joint filers and can be reduced in some situations.</p>
  <h2>What usually affects the math</h2>
  <ul>
    <li>Original purchase price + allowable improvements (basis)</li>
    <li>Depreciation if any portion was rented or used for business</li>
    <li>Selling costs</li>
    <li>Whether you meet the exclusion tests</li>
  </ul>
  <h2>Official reading</h2>
  <p><a href="https://www.irs.gov/publications/p523" target="_blank" rel="noopener">IRS Publication 523 - Selling Your Home</a></p>
  $edu
  <p>Tudy can help with market strategy and timing conversations; your tax pro owns the tax return.</p>
  $cta
</div></section>
"@

Write-Page 'tools-sell-or-rent.html' 'Sell or Rent' 'tools-sell-or-rent' @"
<section class="page-hero"><div class="container">
  <span class="badge">Seller tools</span>
  <h1>Sell or rent?</h1>
  <p class="lead">For owners deciding whether to <strong>sell now</strong> or <strong>keep the home and rent it out</strong>. Fields are split by scenario.</p>
  <p><a class="btn btn-ghost" href="tools.html#sellers">All seller tools</a></p>
</div></section>
<section><div class="container">
  <div class="tool-panel">
    <form id="sellrent-form" class="form">
      <fieldset class="tool-fieldset">
        <legend>If you sell</legend>
        <div class="grid-2">
          <label>Est. market value / sale price (`$)<input id="sr-value" type="number" value="300000" min="0" step="1000" /></label>
          <label>Mortgage payoff balance (`$)<input id="sr-mortgage-bal" type="number" value="180000" min="0" step="1000" /></label>
          <label>Selling costs (% of sale price)<span class="tool-hint">Commission, title, concessions, etc.</span><input id="sr-sell-cost" type="number" value="7" min="0" step="0.5" /></label>
        </div>
      </fieldset>
      <fieldset class="tool-fieldset">
        <legend>If you rent (keep the home as a rental)</legend>
        <div class="grid-2">
          <label>Expected rent / mo (`$)<input id="sr-rent" type="number" value="1900" min="0" step="50" /></label>
          <label>Vacancy allowance (%)<span class="tool-hint">Default 10% for empty months / turnover.</span><input id="sr-vacancy" type="number" value="10" min="0" max="50" step="1" /></label>
          <label>Property management / mo (`$)<span class="tool-hint">Defaults to 10% of expected rent. Uncheck below to type your own amount.</span><input id="sr-mgmt" type="number" value="190" min="0" step="10" /></label>
          <label style="display:flex;align-items:center;gap:0.5rem;flex-direction:row"><input id="sr-mgmt-auto" type="checkbox" checked style="width:auto;margin:0" /> Auto-set management to 10% of rent</label>
          <label>Other landlord expenses / mo (`$)<span class="tool-hint">Repairs, reserves, utilities you pay, etc. (not PITI)</span><input id="sr-exp" type="number" value="350" min="0" step="25" /></label>
          <label>PITI + HOA / mo while renting (`$)<span class="tool-hint">Principal, interest, taxes, insurance, HOA if you keep the loan.</span><input id="sr-pitia" type="number" value="1600" min="0" step="25" /></label>
          <label>Years to compare<input id="sr-years" type="number" value="5" min="1" max="30" /></label>
        </div>
      </fieldset>
      <button class="btn btn-primary" type="submit">Compare sell vs rent</button>
    </form>
    <div class="tool-result" id="sellrent-result">Enter numbers and compare.</div>
  </div>
  <div class="prose" style="margin-top:1.5rem">
    <h2>Non-number questions</h2>
    <ul>
      <li>Do I want late-night landlord calls?</li>
      <li>Is my equity trapped or better redeployed?</li>
      <li>Am I emotionally ready to keep this property?</li>
      <li>What are local rental rules / HOA rental caps?</li>
    </ul>
    $edu
    $cta
  </div>
</div></section>
"@ $calc

# ========== INVESTORS ==========
Write-Page 'tools-cash-flow.html' 'Rental Cash Flow' 'tools-cash-flow' @"
<section class="page-hero"><div class="container">
  <span class="badge">Investor tools</span>
  <h1>Rental cash-flow calculator</h1>
  <p class="lead">Estimate effective income, expenses, NOI, cash flow, and a rough cap rate.</p>
  <p><a class="btn btn-ghost" href="tools.html#investors">All investor tools</a></p>
</div></section>
<section><div class="container">
  <div class="tool-panel">
    <form id="cashflow-form" class="form">
      <div class="grid-2">
        <label>Purchase price (`$)<input id="cf-price" type="number" value="250000" min="0" step="1000" /></label>
        <label>Gross rent / mo (`$)<input id="cf-rent" type="number" value="1800" min="0" step="50" /></label>
        <label>Other income / mo (`$)<input id="cf-other-inc" type="number" value="0" min="0" /></label>
        <label>Vacancy (%)<input id="cf-vacancy" type="number" value="5" min="0" max="50" step="0.5" /></label>
        <label>Property taxes / mo (`$)<input id="cf-taxes" type="number" value="200" min="0" /></label>
        <label>Insurance / mo (`$)<input id="cf-ins" type="number" value="120" min="0" /></label>
        <label>Maintenance / mo (`$)<input id="cf-maint" type="number" value="150" min="0" /></label>
        <label>Property management / mo (`$)<input id="cf-mgmt" type="number" value="0" min="0" /></label>
        <label>Owner-paid utilities / mo (`$)<input id="cf-util" type="number" value="0" min="0" /></label>
        <label>HOA / mo (`$)<input id="cf-hoa" type="number" value="0" min="0" /></label>
        <label>Other expenses / mo (`$)<input id="cf-other-exp" type="number" value="50" min="0" /></label>
        <label>Mortgage payment / mo (`$)<input id="cf-mortgage" type="number" value="1400" min="0" /></label>
      </div>
      <button class="btn btn-primary" type="submit">Calculate cash flow</button>
    </form>
    <div class="tool-result" id="cashflow-result">Enter numbers and calculate.</div>
    $edu
  </div>
  $cta
</div></section>
"@ $calc

Write-Page 'tools-flip.html' 'Flip / BRRRR Worksheet' 'tools-flip' @"
<section class="page-hero"><div class="container">
  <span class="badge">Investor tools</span>
  <h1>Flip / BRRRR rough worksheet</h1>
  <p class="lead">All-in cost vs ARV for a quick go/no-go screen. Not a full underwriting package.</p>
  <p><a class="btn btn-ghost" href="tools.html#investors">All investor tools</a></p>
</div></section>
<section><div class="container">
  <div class="tool-panel">
    <form id="flip-form" class="form">
      <div class="grid-2">
        <label>Purchase price (`$)<input id="flip-purchase" type="number" value="180000" min="0" step="1000" /></label>
        <label>Rehab budget (`$)<input id="flip-rehab" type="number" value="40000" min="0" step="1000" /></label>
        <label>Holding costs (taxes, ins, utilities, interest) (`$)<input id="flip-holding" type="number" value="8000" min="0" step="500" /></label>
        <label>Buy-side closing costs (`$)<input id="flip-close-buy" type="number" value="4000" min="0" step="250" /></label>
        <label>Sell-side costs / commissions (`$)<input id="flip-close-sell" type="number" value="15000" min="0" step="500" /></label>
        <label>ARV - after repair value (`$)<input id="flip-arv" type="number" value="280000" min="0" step="1000" /></label>
      </div>
      <button class="btn btn-primary" type="submit">Estimate profit</button>
    </form>
    <div class="tool-result" id="flip-result">Enter numbers and estimate.</div>
    <p class="muted" style="margin-top:0.75rem">BRRRR reminder: Buy, Rehab, Rent, Refinance, Repeat - refinance rules and appraisals can change the outcome even if the rehab looks good on paper.</p>
    $edu
  </div>
  $cta
</div></section>
"@ $calc

Write-Page 'guides-1031.html' '1031 Exchange Basics' 'guides-1031' @"
<section class="page-hero"><div class="container">
  <span class="badge">Investor guides</span>
  <h1>1031 exchange basics</h1>
  <p class="lead">A high-level overview of like-kind exchanges for investment real estate. Not tax advice.</p>
  <p><a class="btn btn-ghost" href="tools.html#investors">All investor tools</a></p>
</div></section>
<section><div class="container prose">
  <h2>What people mean by "1031"</h2>
  <p>Under Internal Revenue Code Section 1031, investors may defer certain capital gains taxes when exchanging qualifying investment/business real property for other qualifying real property - if strict rules are met.</p>
  <h2>Typical (simplified) requirements people discuss</h2>
  <ul>
    <li>Property held for investment or productive use in a trade/business (not your personal residence in most cases)</li>
    <li>Like-kind real property (rules tightened for personal property years ago - real property focus now)</li>
    <li>Strict timelines (commonly discussed: 45-day identification / 180-day close - confirm current law)</li>
    <li>Often uses a qualified intermediary - you generally cannot touch the funds casually</li>
  </ul>
  <h2>Common misconceptions</h2>
  <ul>
    <li>"I can 1031 my primary home" - usually not without complex planning</li>
    <li>"Any swap counts" - timelines and identification rules kill many DIY attempts</li>
    <li>"It eliminates tax forever" - often a deferral, not permanent erasure</li>
  </ul>
  <p>Work with a CPA and qualified intermediary before you list or contract. Tudy can help with market inventory and timing conversations.</p>
  $edu
  $cta
</div></section>
"@

Write-Page 'guides-multifamily.html' 'Duplex & Multifamily Guide' 'guides-multifamily' @"
<section class="page-hero"><div class="container">
  <span class="badge">Investor guides</span>
  <h1>Duplex &amp; small multifamily guide</h1>
  <p class="lead">House-hacking and small multis can accelerate net worth - with landlord realities attached.</p>
  <p><a class="btn btn-ghost" href="tools.html#investors">All investor tools</a> <a class="btn btn-ghost" href="tools-cash-flow.html">Cash-flow calculator</a></p>
</div></section>
<section><div class="container prose">
  <h2>Why buyers like duplex / 2–4 units</h2>
  <ul>
    <li>Possible owner-occupant financing on 2–4 units (program rules apply)</li>
    <li>Rent from other units may offset the payment</li>
    <li>Scalable first step before larger multifamily</li>
  </ul>
  <h2>Underwrite like a business</h2>
  <ul>
    <li>Use realistic rents and vacancy - not best-case Instagram numbers</li>
    <li>Budget repairs, turnover, and management (even if self-managing)</li>
    <li>Check zoning, parking, utilities, and separate meters</li>
    <li>Read leases if tenant-occupied; know notice rules</li>
  </ul>
  <h2>Lifestyle fit</h2>
  <p>Living next to tenants is not for everyone. Be honest about noise, privacy, and maintenance bandwidth.</p>
  $edu
  $cta
</div></section>
"@

Write-Page 'guides-str.html' 'Short-Term Rental Reality Check' 'guides-str' @"
<section class="page-hero"><div class="container">
  <span class="badge">Investor guides</span>
  <h1>Short-term rental (STR) reality check</h1>
  <p class="lead">Airbnb-style income can look amazing in a screenshot. Diligence decides whether it works in real life.</p>
  <p><a class="btn btn-ghost" href="tools.html#investors">All investor tools</a></p>
</div></section>
<section><div class="container prose">
  <h2>Check these before you buy for STR</h2>
  <ul>
    <li><strong>City / county rules</strong> - permits, caps, occupancy taxes, prohibited zones</li>
    <li><strong>HOA / covenants</strong> - many ban or limit short-term rentals</li>
    <li><strong>Insurance</strong> - standard HO-3 may not cover STR use</li>
    <li><strong>True expenses</strong> - cleaning, supplies, platform fees, utilities, furnishing, turnover</li>
    <li><strong>Seasonality</strong> - Tulsa demand is not coastal beach math</li>
    <li><strong>Neighbor risk</strong> - noise complaints can end a business model</li>
  </ul>
  <h2>Long-term vs short-term</h2>
  <p>Model both. Sometimes a solid long-term tenant beats an optimistic STR projection after fees and vacancies.</p>
  <p>Start with city and county websites for the address you are considering, then stress-test numbers with the <a href="tools-cash-flow.html">cash-flow calculator</a>.</p>
  $edu
  $cta
</div></section>
"@

# ========== GENERAL ==========
Write-Page 'glossary.html' 'Real Estate Glossary' 'glossary' @"
<section class="page-hero"><div class="container">
  <span class="badge">Reference</span>
  <h1>Real estate glossary (A–Z)</h1>
  <p class="lead">Clear definitions for common terms. Not legal definitions - contracts and statutes control.</p>
  <p><a class="btn btn-ghost" href="tools.html#general">All guides</a></p>
</div></section>
<section><div class="container prose">
  <p><strong>Amortization</strong> - Paying a loan down over time with scheduled payments of principal and interest.</p>
  <p><strong>Appraisal</strong> - A licensed appraiser's opinion of value, often required by lenders.</p>
  <p><strong>APR</strong> - Annual Percentage Rate; aims to reflect loan cost beyond the note rate alone.</p>
  <p><strong>ARM</strong> - Adjustable-rate mortgage; rate can change after a fixed period.</p>
  <p><strong>Basis</strong> - Generally your cost in a property for tax purposes (ask a CPA).</p>
  <p><strong>Buyer Broker agreement</strong> - Agreement describing how a buyer's agent is engaged and compensated.</p>
  <p><strong>Cap rate</strong> - NOI divided by price; a rough yield measure ignoring financing.</p>
  <p><strong>CMA</strong> - Comparative market analysis; agent estimate using comps (not an appraisal).</p>
  <p><strong>Contingency</strong> - Contract condition that must be met (inspection, financing, appraisal, etc.).</p>
  <p><strong>Conventional loan</strong> - Mortgage not insured/guaranteed by FHA, VA, or USDA.</p>
  <p><strong>Days on market (DOM)</strong> - How long a listing has been active (definitions vary by MLS).</p>
  <p><strong>Deed</strong> - Written instrument transferring ownership interest in real property.</p>
  <p><strong>DTI</strong> - Debt-to-income ratio used in underwriting.</p>
  <p><strong>Earnest money</strong> - Good-faith deposit with an offer.</p>
  <p><strong>Equity</strong> - Value minus what you owe (simplified).</p>
  <p><strong>Escrow</strong> - Neutral holding of funds/documents; also lender-held tax/insurance accounts.</p>
  <p><strong>FHA loan</strong> - Federal Housing Administration-insured mortgage program.</p>
  <p><strong>HOA</strong> - Homeowners association; dues and rules may apply.</p>
  <p><strong>Homestead exemption</strong> - Possible property tax relief for primary residences (county rules).</p>
  <p><strong>Inspection</strong> - Professional evaluation of property condition (not a code certification).</p>
  <p><strong>Interest rate</strong> - Cost of borrowing expressed as a percentage.</p>
  <p><strong>Lien</strong> - Legal claim against property (mortgage, tax, judgment, etc.).</p>
  <p><strong>LTV</strong> - Loan-to-value ratio.</p>
  <p><strong>MLS</strong> - Multiple Listing Service used by brokers to share listings.</p>
  <p><strong>NOI</strong> - Net operating income; income after operating expenses, before debt service.</p>
  <p><strong>PMI</strong> - Private mortgage insurance (often when conventional down payment is under 20%).</p>
  <p><strong>Pre-approval</strong> - Lender conditional approval based on documented finances (stronger than pre-qual).</p>
  <p><strong>Proration</strong> - Split of taxes/HOA/rents between buyer and seller at closing.</p>
  <p><strong>Title insurance</strong> - Policy protecting against certain title defects (read the policy).</p>
  <p><strong>Underwriting</strong> - Lender's process of evaluating risk and clearing a loan to close.</p>
  <p><strong>USDA loan</strong> - Rural development loan program with location/income rules.</p>
  <p><strong>VA loan</strong> - Loan program for eligible veterans/service members (and some surviving spouses).</p>
  $cta
</div></section>
"@

Write-Page 'documents.html' 'Document Vault' 'documents' @"
<section class="page-hero"><div class="container">
  <span class="badge">Reference</span>
  <h1>Document vault - what you may need</h1>
  <p class="lead">Checklists by role. Your lender, title company, or CPA may ask for more.</p>
  <p><a class="btn btn-ghost" href="tools.html#general">All guides</a></p>
</div></section>
<section><div class="container">
  <div class="grid-2">
    <div class="card">
      <h3>Buyers</h3>
      <div class="checklist">
        <label><input type="checkbox" /> ID + Social Security info for lender</label>
        <label><input type="checkbox" /> Income docs (W-2, paystubs, returns)</label>
        <label><input type="checkbox" /> Bank statements / asset docs</label>
        <label><input type="checkbox" /> Gift letter if applicable</label>
        <label><input type="checkbox" /> Proof of homeowners insurance binder</label>
        <label><input type="checkbox" /> Earnest money funds ready</label>
      </div>
    </div>
    <div class="card">
      <h3>Sellers</h3>
      <div class="checklist">
        <label><input type="checkbox" /> Mortgage statement / payoff info</label>
        <label><input type="checkbox" /> HOA docs / resale package if any</label>
        <label><input type="checkbox" /> Survey / previous title policy if available</label>
        <label><input type="checkbox" /> Repair receipts / warranties</label>
        <label><input type="checkbox" /> Keys, remotes, codes, manuals</label>
        <label><input type="checkbox" /> Utility account info for transfers</label>
      </div>
    </div>
    <div class="card">
      <h3>Investors</h3>
      <div class="checklist">
        <label><input type="checkbox" /> Rent roll / existing leases</label>
        <label><input type="checkbox" /> Expense history / tax bills</label>
        <label><input type="checkbox" /> Entity docs (LLC) if buying in entity</label>
        <label><input type="checkbox" /> Insurance quotes for intended use</label>
        <label><input type="checkbox" /> Capex list and contractor bids</label>
      </div>
    </div>
    <div class="card">
      <h3>Everyone</h3>
      <div class="checklist">
        <label><input type="checkbox" /> Never wire funds from email alone - call title at a known number</label>
        <label><input type="checkbox" /> Keep digital copies of everything you sign</label>
      </div>
    </div>
  </div>
  $cta
</div></section>
"@

Write-Page 'fair-housing.html' 'Fair Housing Basics' 'fair-housing' @"
<section class="page-hero"><div class="container">
  <span class="badge">Compliance</span>
  <h1>Fair housing basics</h1>
  <p class="lead">Equal opportunity in housing is the law - and the right way to do business.</p>
  <p><a class="btn btn-ghost" href="tools.html#general">All guides</a></p>
</div></section>
<section><div class="container prose">
  <h2>Protected classes (federal Fair Housing Act - overview)</h2>
  <p>Federal law prohibits housing discrimination based on race, color, national origin, religion, sex (including gender identity and sexual orientation per federal guidance/case law context), familial status, and disability. State and local laws may add protections.</p>
  <h2>What agents should not do</h2>
  <ul>
    <li>Steer buyers toward or away from neighborhoods based on protected characteristics</li>
    <li>Refuse to show or negotiate housing for discriminatory reasons</li>
    <li>Use discriminatory language in ads or conversations</li>
    <li>Misrepresent availability because of who someone is</li>
  </ul>
  <h2>What clients can expect from Tudy</h2>
  <p>Homes and areas are discussed based on budget, commute, features, and your stated needs - not stereotypes. Questions about schools and amenities are answered with sources you can verify.</p>
  <p>Learn more: <a href="https://www.hud.gov/program_offices/fair_housing_equal_opp" target="_blank" rel="noopener">HUD Fair Housing</a></p>
  $cta
</div></section>
"@

Write-Page 'resources-oklahoma.html' 'Oklahoma Resource Hub' 'resources-oklahoma' @"
<section class="page-hero"><div class="container">
  <span class="badge">Oklahoma</span>
  <h1>Oklahoma resource hub</h1>
  <p class="lead">Official and practical starting points for Tulsa metro buyers, sellers, and homeowners.</p>
  <p><a class="btn btn-ghost" href="tools.html#general">All guides</a> <a class="btn btn-ghost" href="homestead.html">Homestead page</a></p>
</div></section>
<section><div class="container prose">
  <h2>Property tax &amp; assessors (start here)</h2>
  <ul>
    <li><a href="https://www.assessor.tulsacounty.org/" target="_blank" rel="noopener">Tulsa County Assessor</a></li>
    <li><a href="https://www.creekcountyonline.com/" target="_blank" rel="noopener">Creek County</a> (verify assessor pages on county site)</li>
    <li><a href="https://www.wagonercounty.ok.gov/" target="_blank" rel="noopener">Wagoner County</a></li>
    <li><a href="https://www.rogerscounty.org/" target="_blank" rel="noopener">Rogers County</a></li>
    <li>Also see: <a href="homestead.html">Homestead exemption how-to + links</a></li>
  </ul>
  <h2>State &amp; consumer</h2>
  <ul>
    <li><a href="https://www.oid.ok.gov/" target="_blank" rel="noopener">Oklahoma Insurance Department</a></li>
    <li><a href="https://www.ok.gov/orec/" target="_blank" rel="noopener">Oklahoma Real Estate Commission (OREC)</a></li>
    <li><a href="https://www.ok.gov/" target="_blank" rel="noopener">Oklahoma.gov</a> portal</li>
  </ul>
  <h2>On this site</h2>
  <ul>
    <li><a href="resources-flood.html">Flood maps &amp; insurance</a></li>
    <li><a href="resources-utilities.html">Tulsa utility cost guide</a></li>
    <li><a href="resources-schools.html">Schools hub</a></li>
    <li><a href="relocating.html">Relocating to Oklahoma</a></li>
  </ul>
  $edu
  $cta
</div></section>
"@

Write-Page 'resources-flood.html' 'Flood Maps & Insurance' 'resources-flood' @"
<section class="page-hero"><div class="container">
  <span class="badge">Risk &amp; insurance</span>
  <h1>Flood maps &amp; home insurance basics</h1>
  <p class="lead">Water risk and insurance are part of smart buying - not afterthoughts.</p>
  <p><a class="btn btn-ghost" href="tools.html#general">All guides</a></p>
</div></section>
<section><div class="container prose">
  <h2>Flood maps</h2>
  <p>Check official maps for any address you are serious about:</p>
  <p><a class="btn btn-primary" href="https://msc.fema.gov/portal/home" target="_blank" rel="noopener">FEMA Flood Map Service Center</a></p>
  <ul>
    <li>Flood zone designation can affect insurance requirements and cost</li>
    <li>Being "outside a high-risk zone" does not mean zero flood risk</li>
    <li>Ask about drainage, sump pumps, and neighborhood history during tours</li>
  </ul>
  <h2>Homeowners insurance (high level)</h2>
  <ul>
    <li>Budget insurance early - it affects cash-to-close and monthly payment</li>
    <li>Shop multiple carriers; roof age and claims history matter</li>
    <li>STR / rental use may need different coverage than owner-occupied</li>
  </ul>
  <p>Oklahoma consumers: <a href="https://www.oid.ok.gov/" target="_blank" rel="noopener">Oklahoma Insurance Department</a></p>
  $edu
  $cta
</div></section>
"@

Write-Page 'resources-utilities.html' 'Tulsa Utility Cost Guide' 'resources-utilities' @"
<section class="page-hero"><div class="container">
  <span class="badge">Relocating</span>
  <h1>Tulsa-area utility cost guide</h1>
  <p class="lead">Rough ranges to help relocators budget. Your home size, efficiency, and season change everything - verify with providers.</p>
  <p><a class="btn btn-ghost" href="tools.html#general">All guides</a> <a class="btn btn-ghost" href="relocating.html">Relocating guide</a></p>
</div></section>
<section><div class="container prose">
  <h2>Ballpark monthly ranges (illustrative only)</h2>
  <div class="table-wrap"><table>
    <thead><tr><th>Category</th><th>Rough monthly range</th><th>Notes</th></tr></thead>
    <tbody>
      <tr><td>Electric</td><td>`$80 – `$250+</td><td>Higher in summer with AC; home size matters</td></tr>
      <tr><td>Gas</td><td>`$30 – `$150+</td><td>Higher in winter if gas heat</td></tr>
      <tr><td>Water / sewer / trash</td><td>`$50 – `$120+</td><td>City/utility specific</td></tr>
      <tr><td>Internet</td><td>`$50 – `$100+</td><td>Speed tier and promotions vary</td></tr>
      <tr><td>HOA (if any)</td><td>`$0 – `$200+</td><td>Condos/townhomes can be higher</td></tr>
    </tbody>
  </table></div>
  <h2>Provider starting points</h2>
  <ul>
    <li><a href="https://www.pso.com/" target="_blank" rel="noopener">PSO (Public Service Company of Oklahoma)</a> - electric for much of the area</li>
    <li><a href="https://www.ong.com/" target="_blank" rel="noopener">Oklahoma Natural Gas</a></li>
    <li>City of Tulsa utilities / your suburb utility department for water/trash</li>
  </ul>
  <p>Ask the listing agent for 12 months of utility averages when possible - real bills beat guesses.</p>
  $edu
  $cta
</div></section>
"@

Write-Page 'espanol.html' 'Espanol' 'espanol' @"
<section class="page-hero"><div class="container">
  <span class="badge">Espanol</span>
  <h1>Resumen en español</h1>
  <p class="lead">Enlaces rápidos al sitio de Tudy Valdez - Your Pathway Home | AXEN Realty. Puedo ayudarte a comprar o vender en Oklahoma.</p>
</div></section>
<section><div class="container prose">
  <h2>Contacto</h2>
  <p>Teléfono / texto: <a href="tel:9188133771">918-813-3771</a><br/>
  Email: <a href="mailto:tvaldez@axenrealty.com">tvaldez@axenrealty.com</a><br/>
  Formulario seguro (Lofty): <a href="https://tudyvaldez.axenrealty.com/contact-lead" target="_blank" rel="noopener">Enviar mensaje</a></p>
  <h2>Páginas útiles</h2>
  <ul>
    <li><a href="search.html">Buscar casas</a></li>
    <li><a href="buy.html">Proceso de compra</a></li>
    <li><a href="sell.html">Proceso de venta</a></li>
    <li><a href="tools.html">Herramientas gratis</a></li>
    <li><a href="tools-mortgage.html">Calculadora de hipoteca</a></li>
    <li><a href="first-time-buyers.html">Compradores primerizos</a></li>
    <li><a href="homestead.html">Exención homestead</a></li>
    <li><a href="about.html">Sobre Tudy</a></li>
  </ul>
  <p class="muted">Si necesitas servicio completo en español, avísame por mensaje de texto y coordinamos la mejor forma de ayudarte.</p>
  <p><a class="btn btn-primary" href="sms:9188133771">Text / SMS 918-813-3771</a> <a class="btn btn-ghost" href="tools.html">Tools hub</a></p>
</div></section>
"@

Write-Page 'guides-loan-programs.html' 'VA FHA USDA Loans' 'guides-loan-programs' @"
<section class="page-hero"><div class="container">
  <span class="badge">Buyer guides</span>
  <h1>VA, FHA &amp; USDA loans</h1>
  <p class="lead">Government-backed options many Oklahoma buyers use. Product rules, fees, and overlays change - always confirm with a licensed lender.</p>
  <p><a class="btn btn-ghost" href="tools.html#buyers">All buyer tools</a> <a class="btn btn-ghost" href="tools-mortgage.html">Mortgage calculator</a></p>
</div></section>
<section><div class="container prose">
  <h2>FHA loans</h2>
  <p><strong>What it is:</strong> A mortgage insured by the Federal Housing Administration. Lenders take less risk, so guidelines can be more flexible for many first-time and credit-rebuilding buyers.</p>
  <p><strong>Often a fit when:</strong></p>
  <ul>
    <li>You need a lower down payment than many conventional programs</li>
    <li>Credit or recent financial history is not perfect, but you can document income and reserves</li>
    <li>You will occupy the home as a primary residence (investment use is restricted)</li>
  </ul>
  <p><strong>Key costs &amp; rules to understand:</strong></p>
  <ul>
    <li><strong>Upfront and monthly mortgage insurance (MIP)</strong> - budget for this; it is not the same as homeowners insurance</li>
    <li><strong>Minimum down payment</strong> - commonly discussed around 3.5% for many borrowers (confirm current rules and your credit tier)</li>
    <li><strong>Property condition</strong> - appraisals can require repairs; fixer-uppers may not pass easily</li>
    <li><strong>Debt-to-income and credit</strong> - more flexible than some conventional options, but still underwritten carefully</li>
    <li><strong>Loan limits</strong> - FHA has area loan limits; higher-priced homes may need another product</li>
  </ul>
  <p><strong>Seller / offer notes:</strong> Some sellers worry about FHA appraisals and timelines. A strong pre-approval, clean offer terms, and realistic inspection expectations help.</p>

  <h2>VA loans</h2>
  <p><strong>What it is:</strong> A loan program for eligible veterans, active-duty service members, and some surviving spouses. The Department of Veterans Affairs guarantees a portion of the loan for the lender.</p>
  <p><strong>Often a fit when:</strong></p>
  <ul>
    <li>You have VA eligibility / entitlement (Certificate of Eligibility)</li>
    <li>You want the option of <strong>`$0` down</strong> on a primary residence (when entitlement and price allow)</li>
    <li>You want competitive rates and <strong>no monthly PMI</strong></li>
  </ul>
  <p><strong>Key costs &amp; rules to understand:</strong></p>
  <ul>
    <li><strong>VA funding fee</strong> - often financed into the loan; amount depends on down payment, first-use vs subsequent use, and disability exemption status</li>
    <li><strong>Residual income and underwriting</strong> - VA looks at remaining income after debts and living expenses, not only DTI</li>
    <li><strong>VA Minimum Property Requirements (MPRs)</strong> - safety/soundness items can require repairs before closing</li>
    <li><strong>Occupancy</strong> - generally primary residence; rules differ from pure investment purchases</li>
    <li><strong>Entitlement / restoration</strong> - prior VA loans can affect how much entitlement is available for the next purchase</li>
  </ul>
  <p><strong>Seller / offer notes:</strong> VA is a strong buyer tool. Educate listing agents who are less familiar - funding fee and MPRs are normal, not automatic deal-killers.</p>

  <h2>USDA loans</h2>
  <p><strong>What it is:</strong> A USDA Rural Development program designed for eligible buyers in qualifying geographic areas, often with `$0` down when income and property rules are met.</p>
  <p><strong>Often a fit when:</strong></p>
  <ul>
    <li>The property maps inside a <strong>USDA-eligible area</strong> (many suburban/rural edges; fewer dense urban cores)</li>
    <li>Household income is within program limits for the county and household size</li>
    <li>You want a low or zero down-payment path as a primary-residence buyer</li>
  </ul>
  <p><strong>Key costs &amp; rules to understand:</strong></p>
  <ul>
    <li><strong>Geographic eligibility first</strong> - if the address does not qualify, the program is off the table</li>
    <li><strong>Income limits</strong> - moderate-income focused; higher earners may not qualify even with great credit</li>
    <li><strong>Guarantee fees</strong> - USDA has its own fee structure (not the same as FHA MIP or conventional PMI)</li>
    <li><strong>Property type &amp; condition</strong> - typically modest residential properties; unique/complex properties can be harder</li>
    <li><strong>Timelines</strong> - additional program steps can make closings longer than a simple conventional file</li>
  </ul>
  <p><strong>Seller / offer notes:</strong> Confirm map eligibility early so you do not write an offer that cannot fund under USDA.</p>

  <h2>Conventional loans (quick contrast)</h2>
  <p>Conventional loans are not insured by FHA/VA/USDA the same way. They often fit buyers with stronger credit, stable documentation, and enough down payment. <strong>PMI usually applies under 20% down</strong> and can often be removed later when equity and loan rules allow. HomeReady / Home Possible and similar products can help lower-down conventional buyers with education/income guidelines.</p>

  <h2>How to choose</h2>
  <ul>
    <li>Start with eligibility: VA service history? USDA map + income? Or conventional/FHA credit and down payment?</li>
    <li>Compare <strong>cash to close</strong>, <strong>monthly payment including MI/MIP/fees</strong>, and <strong>property condition</strong> risk</li>
    <li>Get a full pre-approval before touring seriously - program choice can change what you can buy</li>
  </ul>
  <h2>Next step</h2>
  <p>Text Tudy for local lender introductions that fit your profile. Bring income docs and a target price range for a faster answer.</p>
  $edu
  $cta
</div></section>
"@

Write-Host 'Extra tools pages written.'
