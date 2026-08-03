# Pathway / Tudy Valdez — Website requirements

**Captured:** 2026-07-29  
**Status:** Discovery complete · Build pending budget/IDX path  
**Existing site to replace:** https://tudyvaldez.axenrealty.com  

---

## Brand & positioning

| Item | Decision |
|------|----------|
| Brand | **Your Pathway Home** + **Tudy Valdez** |
| Domain | Not owned yet · prefer free options |
| Replace brokerage mini-site | **Yes** (link-in-bio destination) |
| Visual | Current brand — luxury dark magenta |
| Assets | Project logo + headshots |
| Contact | 918-813-3771 · tvaldez@axenrealty.com · OK #170566 · AXEN Realty |
| Broker | AXEN Realty · show office/address (see compliance) |

### Brokerage contact block (from client)

- **AXEN Realty** · +1 (509) 443-4103 · info@axenrealty.com  
- 5719 W John Gay Dr, Spokane, WA 99224  
- **Tudy Valdez** · +1 (918) 813-3771 · tvaldez@axenrealty.com · DRE 01997200  
- AZ: 5559 S Sossaman Rd 1-101, Mesa, AZ 85212  
- TN: 222 2nd Ave S, Nashville, TN 37201  
- TX: 20333 S Hwy 249, Houston, TX 77070 · Sonny Walton  

---

## Goals (priority order)

1. Buyer leads  
2. Seller leads  
3. Listings traffic  
4. Recruiting  
5. Personal brand  

**Service area:** Tulsa County + all of Oklahoma  
**Primary visitor:** TBD (site should serve both buyers & sellers)  
**Launch:** ASAP  
**Budget:** **$0 / month** preferred  

---

## IDX / MLS

| Item | Decision |
|------|----------|
| MLS | **MLSOK** (Multiple Listing Service of Oklahoma) |
| MLS Agent ID (for IDX setup only — not public footer) | **OKCIMTuVa202407241706002** |
| OK real estate license (public) | **#170566** |
| IDX rights | Yes |
| Provider preference | None |
| Features | Map, schools, saved search, alerts, open houses, VT |
| Branding | Tudy / Pathway + AXEN co-brand |

**Constraint:** Licensed IDX feeds almost always require a **paid** vendor (even with free MLS rights). At $0 we use a **Search homes** CTA + partner path until a free/included feed exists (e.g. Lofty-included IDX).

When configuring IDX with a vendor, use Agent ID `OKCIMTuVa202407241706002` for MLSOK. Do **not** display the Agent ID in the public site footer.

---

## Lofty CRM

| Item | Decision |
|------|----------|
| Product | Lofty (confirm) |
| Account email | **Missing — need from client** |
| Lead types | All (forms, IDX, chat, valuation) |
| Existing Lofty pages | No |
| Integration style | **Direct to Lofty** (embed or deep-link forms) |
| Extra notifications | No |

---

## Site map (all confirmed yes)

1. Home  
2. Buy (process + search CTA)  
3. Sell (process + consult / net-sheet CTA)  
4. Home search (IDX)  
5. Resources / tools  
6. Homestead (Tulsa County + other OK counties: guide + official links)  
7. About Tudy  
8. Contact  
9. Testimonials / reviews  
10. Neighborhoods / local guides  
11. Blog / market updates (v1: static or light; no self-serve CMS required)  
12. Privacy / fair housing / licensing footer  

### Tools (all yes)

- Affordability / mortgage calculator  
- Buyer readiness checklist  
- Seller net sheet (educational disclaimer)  
- Closing cost explainer  
- School / neighborhood links  
- Home valuation (prefer Lofty when available)  

### Homestead

- Short how-to apply  
- Official links: Tulsa County + Creek, Rogers, Wagoner, etc. as available  

---

## Leads & spam

- CTA: **text · form · call** (no calendar yet)  
- Thank-you page + auto-email after submit  
- **No reCAPTCHA preference** → use honeypot + Cloudflare Turnstile (free) or hCaptcha  

---

## Tech (given $0)

| Layer | Choice |
|-------|--------|
| Stack | Static or Next.js (free host) |
| Host | Cloudflare Pages / GitHub Pages / Vercel free |
| Domain | Free subdomain first; paid `.com` later (~$12/yr) |
| CMS | Not required v1 |
| Blog | Static pages or Markdown in repo |

---

## Compliance

- Fair housing language: yes  
- IDX disclaimer: when feed live  
- Broker of record / AXEN + agent license in footer  

---

## Decisions locked 2026-07-30

1. Lofty email: **tvaldez@axenrealty.com** (confirm product = Lofty/Chime in-app)  
2. Lofty Website/IDX/forms: client checking — guide at `lofty-setup.html`  
3. Primary OK display address: **phone-first**; AXEN HQ Spokane in footer (no Tulsa street on file)  
4. Review URLs: none yet  
5. Free subdomain launch: **yes**  
6. Paid IDX later: **no — $0 forever** → search page uses request form until free/included feed exists

---

## Suggested extras (not in original list)

See conversation notes / ROADMAP for ideas (market snapshot, first-time buyer hub, FAQ, Spanish toggle, etc.).
