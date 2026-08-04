# Generates all static HTML pages with shared header/footer
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$utf8 = New-Object System.Text.UTF8Encoding $true

function Get-Header([string]$active) {
  function Cur([string]$id) {
    if ($active -eq $id -or ($id -eq 'tools' -and $active -like 'tools*')) { return ' aria-current="page"' }
    return ''
  }
  $toolsOpen = if ($active -like 'tools*') { ' is-open' } else { '' }
@"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta name="description" content="Your Pathway Home - Tudy Valdez, Realtor(R) with AXEN Realty. Buy and sell homes across Tulsa County and Oklahoma." />
  <title>TITLE_PLACEHOLDER | Your Pathway Home | Tudy Valdez</title>
  <link rel="stylesheet" href="css/styles.css" />
  <link rel="icon" href="assets/logo-dark.png" />
</head>
<body>
  <a class="skip-link" href="#main">Skip to content</a>
  <header class="site-header">
    <div class="container header-inner">
      <a class="brand" href="index.html">
        <img class="brand-photo" src="assets/headshot.jpg" alt="Tudy Valdez" width="48" height="48" />
        <span class="brand-text">
          <strong>Your Pathway Home</strong>
          <span>Tudy Valdez | Realtor(R) | AXEN Realty</span>
        </span>
      </a>
      <div class="header-actions">
        <div class="header-cta">
          <a class="btn btn-ghost" href="sms:9188133771">Text</a>
          <a class="btn btn-primary" href="tel:9188133771">Call</a>
        </div>
        <button class="nav-toggle" type="button" aria-expanded="false" aria-controls="site-nav" aria-label="Open menu">
          <span class="nav-toggle-bars" aria-hidden="true"><span></span><span></span><span></span></span>
          <span class="nav-toggle-label">Menu</span>
        </button>
      </div>
      <nav class="nav" id="site-nav">
        <a href="index.html"$(Cur 'index')>Home</a>
        <a href="buy.html"$(Cur 'buy')>Buy</a>
        <a href="sell.html"$(Cur 'sell')>Sell</a>
        <a href="search.html"$(Cur 'search')>Search</a>
        <div class="nav-drop$toolsOpen">
          <button type="button" class="nav-drop-btn" aria-expanded="$(if ($toolsOpen) { 'true' } else { 'false' })" aria-haspopup="true">Tools</button>
          <div class="nav-drop-menu" role="menu">
            <a href="tools.html"$(Cur 'tools') role="menuitem">All tools</a>
            <a href="tools-mortgage.html"$(Cur 'tools-mortgage') role="menuitem">Mortgage calculator</a>
            <a href="tools-net-sheet.html"$(Cur 'tools-net-sheet') role="menuitem">Seller net sheet</a>
            <a href="tools-buyer-checklist.html"$(Cur 'tools-buyer-checklist') role="menuitem">Buyer checklist</a>
            <a href="tools-seller-checklist.html"$(Cur 'tools-seller-checklist') role="menuitem">Seller checklist</a>
            <a href="tools-closing-costs.html"$(Cur 'tools-closing-costs') role="menuitem">Closing costs</a>
          </div>
        </div>
        <a href="homestead.html"$(Cur 'homestead')>Homestead</a>
        <a href="neighborhoods.html"$(Cur 'neighborhoods')>Neighborhoods</a>
        <a href="about.html"$(Cur 'about')>About</a>
        <a href="contact.html"$(Cur 'contact')>Contact</a>
      </nav>
    </div>
  </header>
  <main id="main">
"@
}

function Get-Footer {
@"
  </main>
  <footer class="site-footer">
    <div class="container footer-grid">
      <div>
        <h4>Your Pathway Home</h4>
        <p>Tudy Valdez, Realtor(R)</p>
        <a href="tel:9188133771">918-813-3771</a>
        <a href="mailto:tvaldez@axenrealty.com">tvaldez@axenrealty.com</a>
        <p>OK License #170566</p>
        <p>Serving Tulsa County &amp; all of Oklahoma</p>
      </div>
      <div>
        <h4>Explore</h4>
        <a href="buy.html">Buy a home</a>
        <a href="sell.html">Sell a home</a>
        <a href="search.html">Home search</a>
        <a href="tools.html">All tools</a>
        <a href="tools-mortgage.html">Mortgage calculator</a>
        <a href="tools-net-sheet.html">Seller net sheet</a>
        <a href="homestead.html">Homestead exemption</a>
        <a href="faq.html">FAQ</a>
      </div>
      <div>
        <h4>Resources</h4>
        <a href="first-time-buyers.html">First-time buyers</a>
        <a href="relocating.html">Relocating to Oklahoma</a>
        <a href="neighborhoods.html">Neighborhoods</a>
        <a href="market.html">Market snapshot</a>
        <a href="recruiting.html">Careers / recruiting</a>
        <a href="bio.html">Link-in-bio</a>
      </div>
      <div>
        <h4>Oklahoma office</h4>
        <p>AXEN Realty, LLC</p>
        <p>110 S Hartford Ave, Suite 100<br/>Tulsa, OK 74120</p>
        <a href="tel:9188133771">+1 (918) 813-3771</a>
        <a href="mailto:tvaldez@axenrealty.com">tvaldez@axenrealty.com</a>
        <p>Tudy Valdez, Realtor(R) | OK #170566</p>
      </div>
    </div>
    <div class="container footer-bottom">
      <p>© <span id="year"></span> Tudy Valdez | Your Pathway Home | AXEN Realty. All rights reserved.</p>
      <p class="fair-housing">
        We are committed to the letter and spirit of the Fair Housing Act and Equal Opportunity in housing.
        All real estate information is believed accurate but is not guaranteed - verify independently.
        IDX / MLS content, when shown, is subject to applicable MLS rules and disclaimers.
      </p>
      <p>
        <a href="privacy.html">Privacy</a> |
        <a href="contact.html">Contact</a> |
        <a href="testimonials.html">Reviews</a>
      </p>
    </div>
  </footer>
  <div class="sticky-cta" aria-label="Quick contact">
    <a class="btn btn-ghost" href="sms:9188133771">Text Tudy</a>
    <a class="btn btn-primary" href="tel:9188133771">Call</a>
    <a class="btn btn-ghost" href="contact.html">Form</a>
  </div>
  <script src="js/main.js"></script>
  EXTRA_SCRIPTS
</body>
</html>
"@
}

function Write-Page([string]$file, [string]$title, [string]$active, [string]$body, [string]$extraScripts = '') {
  $html = (Get-Header $active) + $body + (Get-Footer)
  $html = $html.Replace('TITLE_PLACEHOLDER', $title)
  $html = $html.Replace('EXTRA_SCRIPTS', $extraScripts)
  [IO.File]::WriteAllText((Join-Path $root $file), $html, $utf8)
  Write-Host "Wrote $file"
}

# --- Page bodies ---

$homeBody = @'
<section class="hero">
  <div class="container hero-grid">
    <div>
      <p class="kicker">Tulsa | Oklahoma | Your Pathway Home</p>
      <h1>Find your next home - or sell with <em>clarity</em></h1>
      <p class="lead">I'm Tudy Valdez, Realtor(R) with AXEN Realty. Whether you're buying, selling, or just exploring, you get straight answers, local guidance, and a calm plan - not pressure.</p>
      <div class="hero-actions">
        <a class="btn btn-primary btn-lg" href="search.html">Search homes</a>
        <a class="btn btn-ghost btn-lg" href="sell.html">What's my home worth?</a>
        <a class="btn btn-ghost btn-lg" href="sms:9188133771">Text 918-813-3771</a>
      </div>
      <div class="trust-row">
        <span>Buyer &amp; seller focused</span>
        <span>Tulsa County + all of Oklahoma</span>
        <span>AXEN Realty</span>
      </div>
    </div>
    <aside class="hero-card hero-card--logo">
      <img src="assets/logo-dark.png" alt="Your Pathway Home logo" width="400" height="400" />
      <h2>Tudy Valdez</h2>
      <p>Realtor(R) | OK #170566 | Helping people buy and sell with clarity - residential, commercial, and land.</p>
      <a class="btn btn-primary" href="about.html">About Tudy</a>
    </aside>
  </div>
</section>

<section>
  <div class="container">
    <h2 class="section-title">How can I help?</h2>
    <p class="section-sub">Start where you are. Every path leads to a real conversation - call, text, or form.</p>
    <div class="grid-3">
      <a class="card" href="buy.html"><h3>Buy a home</h3><p>Process guide, pre-approval tips, and a path from first search to closing keys.</p></a>
      <a class="card" href="sell.html"><h3>Sell a home</h3><p>Pricing strategy, net-sheet education, and a calm plan for Oklahoma sellers.</p></a>
      <a class="card" href="search.html"><h3>Home search</h3><p>Browse homes for sale via Lofty / MLSOK-powered search, or send Tudy your criteria.</p></a>
      <a class="card" href="tools.html"><h3>Free tools</h3><p>Mortgage calculator, checklists, seller net sheet estimator, and more.</p></a>
      <a class="card" href="homestead.html"><h3>Homestead</h3><p>How to apply + official county links (Tulsa and neighboring counties).</p></a>
      <a class="card" href="first-time-buyers.html"><h3>First-time buyers</h3><p>Plain-English hub: glossary, readiness checklist, and next steps.</p></a>
    </div>
  </div>
</section>

<section style="background:#0d0a0d;border-top:1px solid rgba(230,0,126,.25);border-bottom:1px solid rgba(230,0,126,.25)">
  <div class="container">
    <h2 class="section-title">Popular resources</h2>
    <div class="grid-3">
      <a class="card" href="faq.html"><h3>FAQ</h3><p>For Sale By Owner, timelines, closing, and commissions - straight answers.</p></a>
      <a class="card" href="relocating.html"><h3>Relocating to Oklahoma</h3><p>Out-of-state buyers: what to know before you visit or write an offer.</p></a>
      <a class="card" href="recruiting.html"><h3>Agents &amp; lenders</h3><p>Building with AXEN - conversations welcome from any state.</p></a>
    </div>
  </div>
</section>

<section>
  <div class="container grid-2">
    <div>
      <h2 class="section-title">Let's talk</h2>
      <p class="section-sub">No calendar required. Text, call, or send a note - I'll follow up personally.</p>
      <p><a class="btn btn-primary" href="sms:9188133771">Text Tudy</a>
      <a class="btn btn-ghost" href="tel:9188133771">Call 918-813-3771</a>
      <a class="btn btn-ghost" href="contact.html">Contact form</a></p>
    </div>
    <div class="card">
      <h3>Quick lead form</h3>
      <form class="form lead-form" data-thanks="thank-you.html">
        <label>Name<input name="name" required autocomplete="name" /></label>
        <label>Phone<input name="phone" type="tel" required autocomplete="tel" /></label>
        <label>Email<input name="email" type="email" required autocomplete="email" /></label>
        <label>I'm interested in
          <select name="interest">
            <option>Buying</option>
            <option>Selling</option>
            <option>Both</option>
            <option>Home valuation</option>
            <option>Recruiting / career</option>
            <option>Other</option>
          </select>
        </label>
        <label>Message<textarea name="message" rows="3" placeholder="Area, budget, timing..."></textarea></label>
        <div class="hp" aria-hidden="true"><label>Company website<input name="company_website" tabindex="-1" autocomplete="off" /></label></div>
        <button class="btn btn-primary" type="submit">Send to Tudy</button>
        <p class="muted">By submitting, you agree we may contact you about real estate services. No spam.</p>
      </form>
    </div>
  </div>
</section>
'@

Write-Page 'index.html' 'Home' 'index' $homeBody

$buy = @'
<section class="page-hero"><div class="container">
  <span class="badge">Buyers</span>
  <h1>Your home purchase process</h1>
  <p class="lead">A clear path from "just looking" to keys in hand - built for Tulsa County and Oklahoma buyers.</p>
  <p><a class="btn btn-primary" href="search.html">Search homes</a> <a class="btn btn-ghost" href="first-time-buyers.html">First-time buyer hub</a></p>
</div></section>
<section><div class="container prose">
  <h2>Step-by-step</h2>
  <ol class="steps">
    <li><strong>Get clear on goals.</strong> Area, budget, must-haves, timeline. We'll talk tradeoffs early.</li>
    <li><strong>Talk to a lender about pre-approval.</strong> Usually yes before serious touring - sellers take you more seriously and you waste less time.</li>
    <li><strong>Search with a plan.</strong> Map, schools, commute, HOA - filter what actually fits your life.</li>
    <li><strong>Tour &amp; compare.</strong> Look past staging. Condition, comps, and future resale matter.</li>
    <li><strong>Write a strong offer.</strong> Price, terms, contingencies, timelines - strategy, not guesswork.</li>
    <li><strong>Inspections &amp; diligence.</strong> Know what you're buying; negotiate repairs or credits when it makes sense.</li>
    <li><strong>Appraisal &amp; underwriting.</strong> Stay responsive; I'll help keep the file moving.</li>
    <li><strong>Clear to close.</strong> Final walkthrough, signing, funding - then keys.</li>
  </ol>
  <div class="alert"><strong>Ready to start?</strong> Text <a href="sms:9188133771">918-813-3771</a> or <a href="contact.html">send a form</a>. Prefer tools first? Try the <a href="tools.html">buyer checklist &amp; calculator</a>.</div>
  <h2>Helpful next pages</h2>
  <p><a href="tools.html">Tools</a> | <a href="faq.html">FAQ</a> | <a href="relocating.html">Relocating to OK</a> | <a href="neighborhoods.html">Neighborhoods</a></p>
</div></section>
'@
Write-Page 'buy.html' 'Buy a Home' 'buy' $buy

$sell = @'
<section class="page-hero"><div class="container">
  <span class="badge">Sellers</span>
  <h1>Your home selling process</h1>
  <p class="lead">Pricing for the market you have, marketing beyond a yard sign, and negotiation when it counts - with a calm plan.</p>
  <p><a class="btn btn-primary" href="contact.html?interest=Selling">Request a consult</a> <a class="btn btn-ghost" href="tools.html#net-sheet">Net sheet tool</a></p>
</div></section>
<section><div class="container prose">
  <h2>How selling usually works</h2>
  <ol class="steps">
    <li><strong>Goals &amp; timing.</strong> What does a successful sale look like for you?</li>
    <li><strong>Pricing strategy.</strong> Comps, condition, and this week's market - not last year's hopes.</li>
    <li><strong>Prep &amp; presentation.</strong> Declutter, repairs that pay off, photos that sell.</li>
    <li><strong>Go live.</strong> Marketing to serious buyers, showings, feedback.</li>
    <li><strong>Offers &amp; negotiation.</strong> Terms matter as much as price.</li>
    <li><strong>Under contract.</strong> Inspections, appraisal, deadlines - managed, not chaotic.</li>
    <li><strong>Closing.</strong> Paperwork, payoff, keys - with clear net expectations.</li>
  </ol>
  <h2>Seller net sheet (education)</h2>
  <p>List price is a headline. A <strong>net sheet</strong> estimates what you might walk away with after costs and payoffs. Use the free estimator on the <a href="tools.html#net-sheet">Tools page</a>, then text me for a real walkthrough: <a href="sms:9188133771">918-813-3771</a>.</p>
  <div class="disclaimer">Educational only - not a guarantee of sale price, speed, or net proceeds.</div>
  <h2>For Sale By Owner?</h2>
  <p>If you're exploring for-sale-by-owner, read the <a href="faq.html">FAQ</a> and know limited / a la carte support may be available. No judgment - just eyes open.</p>
</div></section>
'@
Write-Page 'sell.html' 'Sell a Home' 'sell' $sell

$search = @'
<section class="page-hero"><div class="container">
  <span class="badge">Listings</span>
  <h1>Home search</h1>
  <p class="lead">Browse homes for sale through Tudy Valdez and AXEN Realty (Lofty / MLSOK-powered search). Prefer full screen? Use the button below.</p>
  <p>
    <a class="btn btn-primary btn-lg" href="https://tudyvaldez.axenrealty.com/homes-for-sale" target="_blank" rel="noopener">Open full home search</a>
    <a class="btn btn-ghost btn-lg" href="sms:9188133771">Text your criteria</a>
  </p>
</div></section>
<section><div class="container">
  <div class="alert">
    <strong>Connected:</strong> Live search is provided by your Lofty site at
    <a href="https://tudyvaldez.axenrealty.com/homes-for-sale" target="_blank" rel="noopener">tudyvaldez.axenrealty.com/homes-for-sale</a>.
    Leads from that search flow through your brokerage/Lofty setup. If the frame below is blank, Lofty may block embedding - use <strong>Open full home search</strong>.
  </div>

  <div class="tool-panel" style="padding:0;overflow:hidden">
    <div style="display:flex;flex-wrap:wrap;justify-content:space-between;align-items:center;gap:0.75rem;padding:0.85rem 1rem;border-bottom:1px solid rgba(230,0,126,0.35)">
      <strong>Search homes (Lofty)</strong>
      <a class="btn btn-primary" href="https://tudyvaldez.axenrealty.com/homes-for-sale" target="_blank" rel="noopener">Open in new tab</a>
    </div>
    <iframe
      class="idx-frame"
      title="Homes for sale - Tudy Valdez AXEN Realty"
      src="https://tudyvaldez.axenrealty.com/homes-for-sale"
      loading="lazy"
      referrerpolicy="no-referrer-when-downgrade"></iframe>
  </div>

  <div class="tool-panel" style="margin-top:1.5rem">
    <h3>Prefer a personal match?</h3>
    <p class="muted" style="margin-bottom:1rem">Send your must-haves and Tudy will pull options and follow up - great if you want guidance, not only a map.</p>
    <form class="form lead-form" data-thanks="thank-you.html">
      <label>Name<input name="name" required /></label>
      <label>Phone<input name="phone" type="tel" required /></label>
      <label>Email<input name="email" type="email" required /></label>
      <input type="hidden" name="interest" value="Home search / listings" />
      <label>Areas / cities<textarea name="message" rows="4" required placeholder="e.g. Midtown Tulsa, Bixby, under $350k, 3+ bed, garage..."></textarea></label>
      <div class="hp" aria-hidden="true"><label>Company website<input name="company_website" tabindex="-1" autocomplete="off" /></label></div>
      <button class="btn btn-primary" type="submit">Send my search request</button>
    </form>
  </div>
  <div class="grid-2">
    <div class="card"><h3>Buyer tools</h3><p>Use the <a href="tools.html">mortgage calculator</a> and <a href="buy.html">buyer process</a> page. Pre-approval questions? <a href="first-time-buyers.html">First-time buyer hub</a>.</p></div>
    <div class="card"><h3>Prefer text?</h3><p>Text <a href="sms:9188133771">918-813-3771</a> with city, beds, budget, and must-haves.</p></div>
  </div>
  <p class="disclaimer" style="margin-top:1.5rem">Listing data is provided through AXEN Realty / Lofty and the applicable MLS (including MLSOK where shown). Information is believed accurate but is not guaranteed - verify independently. All real estate services provided by Tudy Valdez, Realtor(R), AXEN Realty, OK #170566.</p>
</div></section>
'@
Write-Page 'search.html' 'Home Search' 'search' $search

$tools = @'
<section class="page-hero"><div class="container">
  <span class="badge">Free tools</span>
  <h1>Buyer and seller tools</h1>
  <p class="lead">Pick a tool below - also available from the Tools menu in the header. Educational only - not lender quotes or guarantees.</p>
</div></section>
<section><div class="container">
  <div class="grid-3">
    <a class="card" href="tools-mortgage.html"><div class="icon">$</div><h3>Mortgage calculator</h3><p>Estimate principal, interest, taxes, insurance, and HOA.</p></a>
    <a class="card" href="tools-net-sheet.html"><div class="icon">N</div><h3>Seller net sheet</h3><p>Rough walk-away estimate including taxes and insurance.</p></a>
    <a class="card" href="tools-buyer-checklist.html"><div class="icon">B</div><h3>Buyer checklist</h3><p>Readiness list including Buyer Broker agreement.</p></a>
    <a class="card" href="tools-seller-checklist.html"><div class="icon">S</div><h3>Seller checklist</h3><p>Prep list before you list.</p></a>
    <a class="card" href="tools-closing-costs.html"><div class="icon">C</div><h3>Closing costs</h3><p>Plain-English explainer of common fees.</p></a>
  </div>
</div></section>
'@
Write-Page 'tools.html' 'Tools' 'tools' $tools

$toolMortgage = @'
<section class="page-hero"><div class="container">
  <span class="badge">Tools</span>
  <h1>Mortgage / payment estimator</h1>
  <p class="lead">Educational estimate only - not a lender quote. Compare common loan types below.</p>
  <p><a class="btn btn-ghost" href="tools.html">All tools</a></p>
</div></section>
<section><div class="container">
  <div class="tool-panel" id="mortgage">
    <form id="mortgage-form" class="form">
      <div class="grid-2">
        <label>Home price ($)<input id="home-price" type="number" value="300000" min="0" step="1000" /></label>
        <label>Down payment (%)<input id="down-pct" type="number" value="5" min="0" max="100" step="0.5" /></label>
        <label>Interest rate (%)<input id="rate" type="number" value="6.5" min="0" step="0.125" /></label>
        <label>Term (years)<input id="years" type="number" value="30" min="1" max="40" /></label>
        <label>Property tax / mo ($)<input id="tax-mo" type="number" value="250" min="0" /></label>
        <label>Insurance / mo ($)<input id="ins-mo" type="number" value="150" min="0" /></label>
        <label>HOA / mo ($)<input id="hoa-mo" type="number" value="0" min="0" /></label>
      </div>
      <button class="btn btn-primary" type="submit">Calculate</button>
    </form>
    <div class="tool-result" id="mortgage-result">Enter numbers and calculate.</div>
  </div>

  <h2 class="section-title" style="margin-top:2rem">Top 10 popular home loans</h2>
  <p class="section-sub">General education for buyers. Product rules and pricing change - always confirm with a licensed lender.</p>
  <div class="grid-2">
    <div class="card"><h3>1. Conventional 30-year fixed</h3><p><strong>Pros:</strong> Stable payment; widely available; builds equity predictably.<br/><strong>Cons:</strong> Stricter credit/down-payment standards than some government loans; PMI if down payment is under 20%.</p></div>
    <div class="card"><h3>2. Conventional 15-year fixed</h3><p><strong>Pros:</strong> Lower total interest; often lower rate; debt-free faster.<br/><strong>Cons:</strong> Higher monthly payment; less cash-flow flexibility.</p></div>
    <div class="card"><h3>3. FHA loan</h3><p><strong>Pros:</strong> Lower down payment and more flexible credit guidelines for many buyers.<br/><strong>Cons:</strong> Mortgage insurance is required (often for a long time); property condition standards apply.</p></div>
    <div class="card"><h3>4. VA loan</h3><p><strong>Pros:</strong> Often $0 down for eligible veterans/service members; competitive rates; no monthly PMI.<br/><strong>Cons:</strong> Funding fee may apply; eligibility required; some sellers less familiar with process.</p></div>
    <div class="card"><h3>5. USDA loan</h3><p><strong>Pros:</strong> $0 down in eligible rural/suburban areas; designed for moderate incomes.<br/><strong>Cons:</strong> Location and income limits; not available in many city cores.</p></div>
    <div class="card"><h3>6. Adjustable-rate mortgage (ARM)</h3><p><strong>Pros:</strong> Lower initial rate/payment; can help short-term owners or refinancers.<br/><strong>Cons:</strong> Payment can rise after the fixed period; harder to budget long term.</p></div>
    <div class="card"><h3>7. Jumbo loan</h3><p><strong>Pros:</strong> Finances higher-priced homes above conforming limits.<br/><strong>Cons:</strong> Larger down payment and stronger credit/reserves usually required; tighter underwriting.</p></div>
    <div class="card"><h3>8. HomeReady / Home Possible (low down conventional)</h3><p><strong>Pros:</strong> Lower down payment options with education/income-friendly guidelines.<br/><strong>Cons:</strong> Program rules and occupancy limits; PMI typically required until equity builds.</p></div>
    <div class="card"><h3>9. Bank statement / non-QM loan</h3><p><strong>Pros:</strong> Helps self-employed buyers who do not document income with W-2s alone.<br/><strong>Cons:</strong> Higher rates/fees; larger down payment common; fewer lenders.</p></div>
    <div class="card"><h3>10. Bridge / temporary financing</h3><p><strong>Pros:</strong> Can help buy before a current home sells.<br/><strong>Cons:</strong> Higher cost and risk if the sale is delayed; short-term only.</p></div>
  </div>
  <p class="disclaimer" style="margin-top:1.25rem">Not a commitment to lend. Loan availability depends on credit, income, property, and lender overlays. Text Tudy at 918-813-3771 for local lender introductions.</p>
</div></section>
'@
Write-Page 'tools-mortgage.html' 'Mortgage Calculator' 'tools-mortgage' $toolMortgage '<script src="js/calculators.js"></script>'

$toolNet = @'
<section class="page-hero"><div class="container">
  <span class="badge">Tools</span>
  <h1>Seller net sheet estimator</h1>
  <p class="lead">Rough estimate of what you might walk away with - for conversation only. Includes taxes and insurance.</p>
  <p><a class="btn btn-ghost" href="tools.html">All tools</a></p>
</div></section>
<section><div class="container">
  <div class="tool-panel" id="net-sheet">
    <form id="net-form" class="form">
      <div class="grid-2">
        <label>Expected sale price ($)<input id="sale-price" type="number" value="300000" min="0" step="1000" /></label>
        <label>Commission total (%)<input id="commission" type="number" value="5" min="0" step="0.1" /></label>
        <label>Closing costs / fees ($)<input id="closing-costs" type="number" value="3000" min="0" /></label>
        <label>Repairs / concessions ($)<input id="repairs" type="number" value="0" min="0" /></label>
        <label>Mortgage payoff ($)<input id="mortgage-balance" type="number" value="150000" min="0" /></label>
        <label>Property taxes due / prorations ($)<input id="seller-taxes" type="number" value="0" min="0" step="100" /></label>
        <label>Insurance due / prorations ($)<input id="seller-insurance" type="number" value="0" min="0" step="50" /></label>
        <label>Other costs ($)<input id="other-costs" type="number" value="0" min="0" /></label>
      </div>
      <button class="btn btn-primary" type="submit">Estimate net</button>
    </form>
    <div class="tool-result" id="net-result">Enter numbers and estimate.</div>
    <div class="disclaimer">Not a guarantee of net proceeds. Title, taxes, insurance prorations, concessions, and actual fees vary. Text Tudy at 918-813-3771 for a real walkthrough.</div>
  </div>

  <h2 class="section-title" style="margin-top:2rem">Top 5 buyer loan types sellers often see</h2>
  <p class="section-sub">From a seller point of view: why you might accept this financing - and what to watch for. Every offer is unique; this is general education only.</p>
  <div class="grid-2">
    <div class="card"><h3>1. Conventional financing</h3><p><strong>Pros for sellers:</strong> Familiar process; often smoother underwriting for well-qualified buyers; fewer property condition surprises than some government loans.<br/><strong>Cons for sellers:</strong> Appraisal still required; if the buyer has low reserves or borderline credit, the loan can still fall through.</p></div>
    <div class="card"><h3>2. FHA financing</h3><p><strong>Pros for sellers:</strong> Expands the buyer pool; more buyers can qualify with lower down payments.<br/><strong>Cons for sellers:</strong> Stricter property condition expectations; appraisals can be pickier; timelines can stretch if repairs are required.</p></div>
    <div class="card"><h3>3. VA financing</h3><p><strong>Pros for sellers:</strong> Strong buyers with $0-down capability; competitive rates can support solid offers; no monthly PMI for the buyer can help affordability.<br/><strong>Cons for sellers:</strong> VA appraisal/Minimum Property Requirements can require repairs; some sellers are less familiar with the process (Tudy can guide you).</p></div>
    <div class="card"><h3>4. USDA financing</h3><p><strong>Pros for sellers:</strong> $0-down buyers in eligible areas can make competitive offers on the right properties.<br/><strong>Cons for sellers:</strong> Property must be in a USDA-eligible location; income limits and program rules can slow or kill a deal if the property or buyer does not fit.</p></div>
    <div class="card"><h3>5. Cash (or cash-like) offers</h3><p><strong>Pros for sellers:</strong> Often fewer financing contingencies; faster close possible; less appraisal risk (if truly cash).<br/><strong>Cons for sellers:</strong> Still verify proof of funds; not always the highest price; "cash" still needs a clean title and solid contract terms.</p></div>
  </div>
  <p class="disclaimer" style="margin-top:1.25rem">Accepting an offer is a legal and financial decision. Loan type is only one factor next to price, earnest money, contingencies, and closing date. Ask Tudy before you choose.</p>
</div></section>
'@
Write-Page 'tools-net-sheet.html' 'Seller Net Sheet' 'tools-net-sheet' $toolNet '<script src="js/calculators.js"></script>'

$toolBuyer = @'
<section class="page-hero"><div class="container">
  <span class="badge">Tools</span>
  <h1>Buyer readiness checklist</h1>
  <p class="lead">Check items off as you prepare to tour and write offers.</p>
  <p><a class="btn btn-ghost" href="tools.html">All tools</a> <a class="btn btn-primary" href="buy.html">Buy process</a></p>
</div></section>
<section><div class="container">
  <div class="tool-panel">
    <div class="checklist">
      <label><input type="checkbox" /> I know my must-have vs nice-to-have list</label>
      <label><input type="checkbox" /> I have talked to a lender about pre-approval</label>
      <label><input type="checkbox" /> I have a realistic monthly budget (including taxes/insurance)</label>
      <label><input type="checkbox" /> I have listed target cities / school needs</label>
      <label><input type="checkbox" /> I have gone over, understand, and signed the Buyer Broker agreement to view homes</label>
      <label><input type="checkbox" /> I am ready to tour and respond quickly on strong homes</label>
      <label><input type="checkbox" /> I have texted Tudy my criteria</label>
    </div>
    <p style="margin-top:1rem"><a class="btn btn-primary" href="sms:9188133771">Text Tudy 918-813-3771</a></p>
  </div>
</div></section>
'@
Write-Page 'tools-buyer-checklist.html' 'Buyer Checklist' 'tools-buyer-checklist' $toolBuyer

$toolSeller = @'
<section class="page-hero"><div class="container">
  <span class="badge">Tools</span>
  <h1>Seller prep checklist</h1>
  <p class="lead">Simple prep before you list.</p>
  <p><a class="btn btn-ghost" href="tools.html">All tools</a> <a class="btn btn-primary" href="sell.html">Sell process</a></p>
</div></section>
<section><div class="container">
  <div class="tool-panel">
    <div class="checklist">
      <label><input type="checkbox" /> Declutter high-traffic rooms</label>
      <label><input type="checkbox" /> Fix "cheap ugly" items buyers obsess over</label>
      <label><input type="checkbox" /> Deep clean (kitchen + baths)</label>
      <label><input type="checkbox" /> Curb appeal weekend plan</label>
      <label><input type="checkbox" /> Gather repair receipts / HOA docs if any</label>
      <label><input type="checkbox" /> Reviewed rough net with Tudy</label>
    </div>
    <p style="margin-top:1rem"><a class="btn btn-primary" href="tools-net-sheet.html">Open net sheet tool</a></p>
  </div>
</div></section>
'@
Write-Page 'tools-seller-checklist.html' 'Seller Checklist' 'tools-seller-checklist' $toolSeller

$toolClosing = @'
<section class="page-hero"><div class="container">
  <span class="badge">Tools</span>
  <h1>Closing cost explainer</h1>
  <p class="lead">Plain English - not a quote. Exact numbers depend on your contract, loan, and title company.</p>
  <p><a class="btn btn-ghost" href="tools.html">All tools</a></p>
</div></section>
<section><div class="container prose">
  <p>Buyers and sellers often pay different items. Common categories include:</p>
  <ul>
    <li>Lender fees (origination, appraisal, credit report)</li>
    <li>Title and escrow / closing fees</li>
    <li>Prepaid taxes and insurance</li>
    <li>Commissions (negotiated)</li>
    <li>Prorations (taxes, HOA, rents when applicable)</li>
  </ul>
  <p>Always verify with your title company and lender. For a walkthrough of your scenario, text or call Tudy.</p>
  <p><a class="btn btn-primary" href="sms:9188133771">Text 918-813-3771</a> <a class="btn btn-ghost" href="contact.html">Contact form</a></p>
</div></section>
'@
Write-Page 'tools-closing-costs.html' 'Closing Costs' 'tools-closing-costs' $toolClosing

$homestead = @'
<section class="page-hero"><div class="container">
  <span class="badge">Homeowners</span>
  <h1>Homestead exemption</h1>
  <p class="lead">A short how-to plus official county links. Registering can help with property taxes - always confirm with the county assessor.</p>
</div></section>
<section><div class="container prose">
  <h2>What is a homestead exemption?</h2>
  <p>In Oklahoma, a homestead exemption may reduce the taxable value of your primary residence if you qualify and file with your county. Rules, deadlines, and forms change - use official county sources as the source of truth.</p>
  <h2>How to apply (general steps)</h2>
  <ol>
    <li>Confirm the property is your primary residence and that you meet county requirements.</li>
    <li>Find your county assessor / treasurer homestead page (links below).</li>
    <li>Download or request the application and gather ID / ownership proof as required.</li>
    <li>File by the county deadline (often early in the year for the tax year - verify annually).</li>
    <li>Keep a copy of what you filed and any confirmation.</li>
  </ol>
  <div class="disclaimer">This page is educational only - not tax, legal, or financial advice. Contact your county assessor for eligibility and deadlines.</div>

  <h2>Official links (start here)</h2>
  <div class="table-wrap"><table>
    <thead><tr><th>County</th><th>Resource</th></tr></thead>
    <tbody>
      <tr><td>Tulsa County</td><td><a href="https://www.assessor.tulsacounty.org/" target="_blank" rel="noopener">Tulsa County Assessor</a> - search homestead / exemption info on their site</td></tr>
      <tr><td>Creek County</td><td><a href="https://www.creekcountyonline.com/" target="_blank" rel="noopener">Creek County</a> - assessor / homestead pages</td></tr>
      <tr><td>Rogers County</td><td><a href="https://www.rogerscounty.org/" target="_blank" rel="noopener">Rogers County</a></td></tr>
      <tr><td>Wagoner County</td><td><a href="https://www.okwagoner.com/" target="_blank" rel="noopener">Wagoner County</a></td></tr>
      <tr><td>Oklahoma statewide</td><td><a href="https://oklahoma.gov/" target="_blank" rel="noopener">Oklahoma.gov</a> - search "homestead exemption"</td></tr>
    </tbody>
  </table></div>
  <p>Need help finding the right form for your address? <a href="sms:9188133771">Text Tudy</a> your county and city - I'll point you to the official page.</p>
</div></section>
'@
Write-Page 'homestead.html' 'Homestead Exemption' 'homestead' $homestead

$about = @'
<section class="page-hero"><div class="container">
  <span class="badge">About</span>
  <h1>Tudy Valdez</h1>
  <p class="lead">Realtor(R) with AXEN Realty | Your Pathway Home | Oklahoma</p>
</div></section>
<section><div class="container grid-2">
  <div><img src="assets/headshot.jpg" alt="Tudy Valdez" style="border-radius:12px;border:2px solid var(--magenta);max-width:420px" /></div>
  <div class="prose">
    <h2>Your pathway, clearly marked</h2>
    <p>I'm Tudy Valdez - a Realtor(R) with AXEN Realty helping people buy and sell with clarity across Tulsa County and throughout Oklahoma. Residential, commercial, and land: if it's a real estate decision that shapes your life or balance sheet, I want the plan to make sense.</p>
    <p>Clients come to me for straight talk: pricing that matches the market you actually have, buyer strategy without chaos, and seller prep that protects your net. You'll always know the next step - and you can reach me by text or call, not a maze of gatekeepers.</p>
    <p>Online you'll also find me as <strong>@tulsamonopolymogul</strong> - market tips, seller education, and a little local energy. Offline, it's simple: <strong>Your Pathway Home</strong>.</p>
    <div class="social-links">
      <a href="https://www.instagram.com/tulsamonopolymogul/" target="_blank" rel="noopener">Instagram</a>
      <a href="https://www.facebook.com/willworkforhomes" target="_blank" rel="noopener">Facebook</a>
      <a href="https://www.linkedin.com/in/tudy-valdez-681132a4" target="_blank" rel="noopener">LinkedIn</a>
    </div>
    <p><strong>918-813-3771</strong> | <a href="mailto:tvaldez@axenrealty.com">tvaldez@axenrealty.com</a><br/>OK License #170566 | AXEN Realty, LLC | 110 S Hartford Ave, Suite 100, Tulsa, OK 74120</p>
    <p><a class="btn btn-primary" href="contact.html">Work with Tudy</a> <a class="btn btn-ghost" href="recruiting.html">Agents and lenders</a></p>
  </div>
</div></section>
'@
Write-Page 'about.html' 'About Tudy' 'about' $about

$contact = @'
<section class="page-hero"><div class="container">
  <span class="badge">Contact</span>
  <h1>Let's talk</h1>
  <p class="lead">Text, call, or form. No booking link required - you'll hear back from me.</p>
</div></section>
<section><div class="container grid-2">
  <div class="card">
    <h3>Contact Tudy</h3>
    <p><a href="tel:9188133771">918-813-3771</a></p>
    <p><a href="sms:9188133771">Text message</a></p>
    <p><a href="mailto:tvaldez@axenrealty.com">tvaldez@axenrealty.com</a></p>
    <p class="muted">Tudy Valdez, Realtor(R) | OK #170566 | AXEN Realty<br/>Serving Tulsa County &amp; all of Oklahoma</p>
    <h3 style="margin-top:1.25rem">Brokerage</h3>
    <p class="muted">AXEN Realty, LLC<br/>110 S Hartford Ave, Suite 100<br/>Tulsa, OK 74120<br/>OK License #170566</p>
  </div>
  <div class="card">
    <h3>Send a message</h3>
    <form class="form lead-form" data-thanks="thank-you.html">
      <label>Name<input name="name" required autocomplete="name" /></label>
      <label>Phone<input name="phone" type="tel" required autocomplete="tel" /></label>
      <label>Email<input name="email" type="email" required autocomplete="email" /></label>
      <label>I'm interested in
        <select name="interest" id="interest">
          <option>Buying</option>
          <option>Selling</option>
          <option>Both</option>
          <option>Home valuation</option>
          <option>Homestead / tax questions</option>
          <option>Recruiting / career</option>
          <option>Other</option>
        </select>
      </label>
      <label>Message<textarea name="message" rows="4" required></textarea></label>
      <div class="hp" aria-hidden="true"><label>Company website<input name="company_website" tabindex="-1" autocomplete="off" /></label></div>
      <button class="btn btn-primary" type="submit">Submit</button>
      <p class="muted">Spam protection: honeypot field (no reCAPTCHA). Forms open your email client to tvaldez@axenrealty.com until Lofty form URLs are connected - see lofty-setup.html.</p>
    </form>
  </div>
</div></section>
<script>
(function(){
  var q = new URLSearchParams(location.search).get("interest");
  if (q) {
    var s = document.getElementById("interest");
    if (s) {
      for (var i=0;i<s.options.length;i++) {
        if (s.options[i].text.toLowerCase().indexOf(q.toLowerCase()) >= 0) { s.selectedIndex = i; break; }
      }
    }
  }
})();
</script>
'@
Write-Page 'contact.html' 'Contact' 'contact' $contact

$thanks = @'
<section class="page-hero"><div class="container">
  <h1>Thank you</h1>
  <p class="lead">Your message is on its way. If your email client opened, hit send - or text me at <a href="sms:9188133771">918-813-3771</a> anytime.</p>
  <p><a class="btn btn-primary" href="index.html">Back to home</a> <a class="btn btn-ghost" href="tools.html">Explore tools</a></p>
</div></section>
'@
Write-Page 'thank-you.html' 'Thank You' 'contact' $thanks

# Additional pages (shorter)
Write-Page 'faq.html' 'FAQ' 'index' @'
<section class="page-hero"><div class="container"><h1>FAQ</h1><p class="lead">Straight answers. Not legal or tax advice - verify for your situation.</p></div></section>
<section><div class="container prose">
  <h2>Do I need to be pre-approved before looking?</h2>
  <p>Usually yes. You know a realistic budget, sellers take you more seriously, and you spend less time on homes that won't finance.</p>
  <h2>What's a seller net sheet?</h2>
  <p>An estimate of sale price minus costs and payoffs ~ what you might walk away with. List price is only a headline. Try the <a href="tools.html#net-sheet">net tool</a>.</p>
  <h2>Can I really save money as a For Sale By Owner?</h2>
  <p>Sometimes - and sometimes "savings" get eaten by price, time, or contract risk. Limited / a la carte help may be available. Ask me anything: <a href="sms:9188133771">text</a>.</p>
  <h2>How long does buying or selling take?</h2>
  <p>It depends on price point, condition, financing, and negotiation. I'll give you a realistic timeline for your property or search - not a one-size answer.</p>
  <h2>What areas do you serve?</h2>
  <p>Tulsa County and all of Oklahoma. Relocating from out of state? Start with <a href="relocating.html">relocating guide</a>.</p>
</div></section>
'@

Write-Page 'first-time-buyers.html' 'First-Time Buyers' 'buy' @'
<section class="page-hero"><div class="container"><span class="badge">Buyers</span><h1>First-time buyer hub</h1><p class="lead">Plain English. No mystery jargon.</p></div></section>
<section><div class="container prose">
  <h2>Glossary (quick)</h2>
  <p><strong>Pre-approval</strong> - lender's early green light based on your finances.<br/>
  <strong>Earnest money</strong> - good-faith deposit with an offer.<br/>
  <strong>Contingency</strong> - a condition that must be met (inspection, financing, appraisal).<br/>
  <strong>Closing</strong> - signing, funding, and recording - then keys.</p>
  <h2>Readiness</h2>
  <p>Use the <a href="tools.html">buyer checklist</a> and payment estimator. When you're ready to talk strategy, <a href="sms:9188133771">text 918-813-3771</a>.</p>
  <h2>Next steps</h2>
  <p><a href="buy.html">Purchase process</a> | <a href="search.html">Start a search request</a> | <a href="contact.html">Contact form</a></p>
</div></section>
'@

Write-Page 'neighborhoods.html' 'Neighborhoods' 'neighborhoods' @'
<section class="page-hero"><div class="container"><h1>Neighborhoods and local guides</h1><p class="lead">Tulsa metro and nearby cities - tell me where life actually happens for you (work, schools, family).</p></div></section>
<section><div class="container grid-3">
  <div class="card"><h3>Tulsa</h3><p>City living, character neighborhoods, culture, and a wide mix of price points.</p></div>
  <div class="card"><h3>Broken Arrow</h3><p>Popular suburban option - parks, schools, growth.</p></div>
  <div class="card"><h3>Bixby</h3><p>River corridor energy and family-focused neighborhoods.</p></div>
  <div class="card"><h3>Jenks</h3><p>Riverwalk vibe and strong community identity.</p></div>
  <div class="card"><h3>Owasso</h3><p>North metro convenience and suburban inventory.</p></div>
  <div class="card"><h3>Glenpool</h3><p>South metro community with growing residential options.</p></div>
  <div class="card"><h3>Coweta</h3><p>East-side living with small-town feel and room to grow.</p></div>
  <div class="card"><h3>Sand Springs</h3><p>West metro access with established neighborhoods.</p></div>
  <div class="card"><h3>Sapulpa</h3><p>Historic downtown energy and value-focused housing options.</p></div>
  <div class="card"><h3>Catoosa</h3><p>Convenient to highways and the port area - practical for many commuters.</p></div>
  <div class="card"><h3>Claremore</h3><p>Rogers County hub with hometown character.</p></div>
  <div class="card"><h3>Collinsville</h3><p>North metro growth and suburban convenience.</p></div>
  <div class="card"><h3>Skiatook</h3><p>Lake-area lifestyle with a smaller-town pace.</p></div>
  <div class="card"><h3>Bartlesville</h3><p>Northeast Oklahoma city living with a strong local identity.</p></div>
  <div class="card"><h3>Oklahoma City</h3><p>Statewide moves and OKC metro searches - I work across Oklahoma.</p></div>
</div>
<div class="container" style="margin-top:1.5rem">
  <p><a class="btn btn-primary" href="contact.html">Tell me your target areas</a></p>
  <p class="muted">School info: always verify on official district sites. I can help you compare locations - not replace district data.</p>
</div></section>
'@

Write-Page 'testimonials.html' 'Reviews' 'about' @'
<section class="page-hero"><div class="container"><h1>Reviews &amp; testimonials</h1><p class="lead">Public review profiles coming soon. For now, ask me for recent client references or search my name on major platforms.</p></div></section>
<section><div class="container">
  <div class="alert"><strong>No public review URLs on file yet.</strong> When you have Google Business, Zillow, or Facebook review links, send them and we'll feature them here.</div>
  <div class="card"><h3>Worked with Tudy?</h3><p>I'd love your feedback - text <a href="sms:9188133771">918-813-3771</a> and I'll send the best place to leave a review.</p></div>
</div></section>
'@

Write-Page 'blog.html' 'Market Updates' 'index' @'
<section class="page-hero"><div class="container"><h1>Market updates</h1><p class="lead">Light blog - manual posts as needed. No complicated CMS on the free plan.</p></div></section>
<section><div class="container">
  <div class="card"><h3>Welcome to the Pathway site</h3><p class="muted">2026</p><p>This site is launching with buyer/seller guides, tools, and homestead resources. Listing search connects when a free IDX/Lofty feed is available.</p></div>
  <p style="margin-top:1rem"><a href="market.html">Market snapshot page -></a></p>
</div></section>
'@

Write-Page 'market.html' 'Market Snapshot' 'index' @'
<section class="page-hero"><div class="container"><h1>Market snapshot</h1><p class="lead">A simple place for local context. Stats change - ask for a custom pull on your property or search.</p></div></section>
<section><div class="container prose">
  <p>Instead of recycled national headlines, I prefer <strong>your</strong> micro-market: price point, condition, and days-on-market for similar homes. Text me a city and price range and I'll interpret what buyers and sellers are actually doing right now.</p>
  <p><a class="btn btn-primary" href="sms:9188133771">Text for a local read</a></p>
</div></section>
'@

Write-Page 'recruiting.html' 'Recruiting' 'about' @'
<section class="page-hero"><div class="container"><span class="badge">Careers</span><h1>Agents &amp; lenders - any state</h1><p class="lead">Building with AXEN Realty. Open to candid conversations - no hard sell.</p></div></section>
<section><div class="container prose">
  <p>If you're an agent or loan officer wondering whether your current setup still fits - training, leads, culture, split clarity - I'm happy to talk. Same for people exploring the industry for the first time.</p>
  <p><strong>Any state</strong> conversations welcome for recruiting / partnership topics.</p>
  <p><a class="btn btn-primary" href="sms:9188133771">Text Tudy</a> <a class="btn btn-ghost" href="mailto:tvaldez@axenrealty.com">Email</a></p>
</div></section>
'@

Write-Page 'relocating.html' 'Relocating to Oklahoma' 'buy' @'
<section class="page-hero"><div class="container"><h1>Relocating to Oklahoma</h1><p class="lead">Out-of-state buyers: you don't need to figure out Tulsa (or beyond) alone.</p></div></section>
<section><div class="container prose">
  <h2>What we'll cover</h2>
  <ul>
    <li>Areas that match commute, schools, and lifestyle</li>
    <li>Virtual tours and efficient in-person trip planning</li>
    <li>Offer strategy when you're competing from afar</li>
    <li>Local professionals (lenders, inspectors) introductions as needed</li>
  </ul>
  <p><a class="btn btn-primary" href="contact.html">Start a relocation conversation</a></p>
</div></section>
'@

Write-Page 'privacy.html' 'Privacy' 'contact' @'
<section class="page-hero"><div class="container"><h1>Privacy</h1></div></section>
<section><div class="container prose">
  <p>We collect contact information you submit (name, phone, email, message) to respond to real estate inquiries. We do not sell your information. Data may be stored in our CRM (Lofty) when connected. For questions: <a href="mailto:tvaldez@axenrealty.com">tvaldez@axenrealty.com</a>.</p>
  <p>Third-party sites (county assessors, social platforms) have their own policies.</p>
</div></section>
'@

Write-Page 'bio.html' 'Link in Bio' 'index' @'
<section class="page-hero"><div class="container"><h1>@tulsamonopolymogul</h1><p class="lead">Quick links</p></div></section>
<section><div class="container" style="max-width:28rem;display:grid;gap:0.75rem">
  <a class="btn btn-primary btn-lg" href="search.html">Search homes</a>
  <a class="btn btn-ghost btn-lg" href="sell.html">Sell / home value</a>
  <a class="btn btn-ghost btn-lg" href="buy.html">Buy process</a>
  <a class="btn btn-ghost btn-lg" href="tools.html">Free tools</a>
  <a class="btn btn-ghost btn-lg" href="homestead.html">Homestead help</a>
  <a class="btn btn-ghost btn-lg" href="sms:9188133771">Text Tudy</a>
  <a class="btn btn-ghost btn-lg" href="tel:9188133771">Call 918-813-3771</a>
  <a class="btn btn-ghost btn-lg" href="about.html">About</a>
</div></section>
'@

Write-Page 'lofty-setup.html' 'Lofty Setup' 'contact' @'
<section class="page-hero"><div class="container"><h1>Where to look in Lofty</h1><p class="lead">Find Website / IDX / Lead forms / Home valuation so we can wire this free site to your CRM.</p></div></section>
<section><div class="container prose">
  <h2>Log in</h2>
  <p>Go to <a href="https://lofty.com/" target="_blank" rel="noopener">lofty.com</a> (or your brokerage's Lofty URL) with <strong>tvaldez@axenrealty.com</strong>.</p>
  <h2>Typical places to check</h2>
  <ol>
    <li><strong>Left sidebar / app switcher</strong> - look for <em>Website</em>, <em>IDX</em>, <em>Marketing</em>, <em>Lead Routes</em>, or <em>Capture</em>.</li>
    <li><strong>Settings -> Lead Capture / Forms</strong> - create or copy a form share link / embed code.</li>
    <li><strong>Settings -> Integrations</strong> - webhooks or website widgets.</li>
    <li><strong>Marketing -> Landing pages</strong> - valuation ("What's my home worth?") pages with a public URL.</li>
    <li><strong>Website builder</strong> (if enabled) - sometimes IDX search is under a Website product your brokerage must enable.</li>
  </ol>
  <h2>What to send me</h2>
  <ul>
    <li>Any <strong>form link</strong> or embed snippet</li>
    <li>Any <strong>home valuation</strong> page URL</li>
    <li>Whether you see <strong>IDX / listings search</strong> (yes/no + screenshot if possible)</li>
  </ul>
  <p>Until those exist, forms on this site use a <strong>mailto</strong> to tvaldez@axenrealty.com (and you can always get texts at 918-813-3771).</p>
  <div class="alert"><strong>Broker tip:</strong> Some AXEN agents only get Lofty CRM - not the full website/IDX package. If menus are missing, ask your broker or Lofty support: "Do I have lead forms and IDX on my seat?"</div>
</div></section>
'@

Write-Page 'open-houses.html' 'Open Houses' 'search' @'
<section class="page-hero"><div class="container"><h1>Open houses</h1><p class="lead">Calendar connects when IDX is live. For this weekend's tours, text Tudy.</p></div></section>
<section><div class="container"><div class="alert">No automated open-house feed on the free plan yet. <a href="sms:9188133771">Text 918-813-3771</a> for current open houses in your area.</div></div></section>
'@

# README
$readme = @'
# Your Pathway Home - website (static, $0 hostable)

## Preview locally
Double-click `index.html` or run:

```powershell
cd C:\Users\2D\Projects\Project-1-Real-Estate\website
Start-Process index.html
```

## Free deploy (subdomain)
1. Create a free Cloudflare or GitHub account
2. Deploy this `website` folder to Cloudflare Pages or GitHub Pages
3. You get a free `*.pages.dev` or `*.github.io` URL
4. Point Instagram link-in-bio to that URL (or to `bio.html`)

## Rebuild pages after edits
```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\_build-pages.ps1
```

## Lofty
See `lofty-setup.html` for where to find forms/IDX in the CRM UI.
'@
[IO.File]::WriteAllText((Join-Path $root 'README.md'), $readme, $utf8)
Write-Host 'Done.'
