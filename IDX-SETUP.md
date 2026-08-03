# MLSOK IDX connection checklist

**Goal:** Live home search on `search.html`  
**MLS:** MLSOK (Multiple Listing Service of Oklahoma)  
**Agent ID (for vendor/MLS paperwork only):** `OKCIMTuVa202407241706002`  
**License (public site footer):** OK #170566  
**Agent email:** tvaldez@axenrealty.com  
**Broker:** AXEN Realty  

## Status (2026-08-03)

**Lofty search URL found and wired:**  
https://tudyvaldez.axenrealty.com/homes-for-sale  

`search.html` now embeds that page in an iframe (when allowed) and always offers **Open full home search**.  
Leads from Lofty search stay on the brokerage Lofty site/CRM.

Still useful later: native widget embed code (if Lofty provides one) for cleaner branding than a full-page iframe.

---

## Why Agent ID alone is not enough

An Agent ID alone cannot pull MLS listings into a website. IDX requires:

1. **You** (or broker) authorized with MLSOK for IDX display  
2. An **approved IDX vendor** that has a data agreement with MLSOK  
3. **Embed code or widget URL** from that vendor (or Lofty if included)  
4. Usually a **monthly fee** (vendor + sometimes MLS data fee)  
5. **Website domain** approved/registered for IDX display  

We cannot scrape MLSOK or invent a free feed. Your $0 budget means we wait for a free/included option (Lofty) or a paid vendor decision.

---

## What I need from you to wire Search

### Path A - Lofty (try first, may be $0)

In Lofty (`tvaldez@axenrealty.com`), look for **Website / IDX / Listings / Lead Capture**.

Send me any of:
- [ ] IDX search **page URL** or **embed/script code**  
- [ ] Home valuation / search widget HTML  
- [ ] Confirmation from Lofty support: "IDX included on my seat?" yes/no  

If you get embed code, I paste it into `search.html` the same day.

### Path B - Standalone IDX vendor (usually paid)

Examples that list MLSOK / Oklahoma coverage:
- **IDX Broker** - MLSOK listed as approved; setup + monthly data fees typical  
- **iHomefinder** - OKC metro / OK MLS coverage; setup fees common  
- Others: Buying Buddy, Realtyna, etc.

I need from the vendor after you sign up:
- [ ] Search results embed code (or iframe URL)  
- [ ] Map search page URL  
- [ ] Required MLS disclaimer text (if not in the widget)  
- [ ] Live domain URL of this website for approval  

### Path C - MLSOK direct request

Per OKCMAR / MLSOK data pages:
1. Agent/broker emails **data@okcmar.org** requesting IDX data access  
2. State purpose (agent website IDX search for Tudy Valdez / Pathway)  
3. **Broker must approve** agent access  
4. MLSOK reviews (often ~5 business days)  
5. Questions: **405-841-5353 option 6** (IDX Services)  

Reference: https://okcmar.org/mlsok-data/  

This still usually pairs with a **vendor**, not a raw free API for our static site.

---

## After you send embed code

I will:
1. Place the widget on `search.html`  
2. Keep lead form as backup  
3. Add required disclaimers  
4. Test map/search on mobile  

---

## Cost note (your earlier answer)

You said **$0 forever** for IDX.  
If Lofty does **not** include search for free, live IDX will require either:
- Changing budget for a vendor, **or**  
- Keeping the current "request a search / text Tudy" page  

No illegal free scrape options.
