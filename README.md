# ConsumerX Ventures — Website

Single-page marketing site for **ConsumerX Ventures**, an operator-led early-stage
venture fund backing the next generation of consumer brands in India.

Live: https://consumerx.vc

## What's here

| File | Purpose |
|------|---------|
| `index.html` | The entire site (self-contained: CSS, JS, logos & favicon are embedded). |
| `og-image.png` | Social-share / link-preview image (1200×630). **Must stay at site root.** |
| `favicon.png` | Browser tab / Apple touch icon (also embedded in `index.html`). |
| `consumerx-logo-horizontal-white.png` | Standalone horizontal lockup (white, transparent). |
| `consumerx-monogram-white.png` | Standalone CK monogram (white, transparent). |
| `netlify.toml` | Netlify config — serves the repo root, sets cache/security headers. |

The site is **static** — there is no build step.

## Deploy (Netlify + GitHub)

1. Push this repo to GitHub (see below).
2. In Netlify: **Add new site → Import an existing project → GitHub →** pick this repo.
3. Build settings: **Build command:** _(leave empty)_ · **Publish directory:** `.`
4. Deploy. Every `git push` to the default branch now auto-deploys.
5. Point the `consumerx.vc` domain at the Netlify site (Domain settings → add custom domain).

## Application form

All "Apply / Pitch us" buttons open the Typeform: https://d2ci.typeform.com/consumerx

## Link previews (WhatsApp / LinkedIn / etc.)

The preview image is referenced in `index.html` as:

```
https://consumerx.vc/og-image.png?v=2
```

For the preview to work, **`og-image.png` must be reachable at the site root** —
it ships in this repo, so a normal deploy covers it.

If you ever change the share image, bump the version in `index.html`
(`?v=2` → `?v=3`) so chat apps refresh their cache, then re-scrape:

- Facebook / WhatsApp: https://developers.facebook.com/tools/debug/ → paste URL → **Scrape Again**
- LinkedIn: https://www.linkedin.com/post-inspector/

## Editing copy

Open `index.html` — content sections are clearly marked with HTML comments
(`OPENING`, `THESIS`, `FIRM`, `APPLY`, `FOOTER`).
