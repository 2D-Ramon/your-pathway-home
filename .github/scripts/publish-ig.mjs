/**
 * Publish today's Week 2 Instagram feed or story.
 * KIND=feed|story|auto  (auto: UTC 16h = feed, 17h = story)
 * DATE=YYYY-MM-DD      (optional; default is today in America/Chicago)
 * Secrets: META_PAGE_TOKEN, META_IG_ID
 */
const TOKEN = process.env.META_PAGE_TOKEN;
const IG = process.env.META_IG_ID;
const KIND_IN = (process.env.KIND || "auto").toLowerCase();
const BASE = "https://2d-ramon.github.io/your-pathway-home/social/w2";
const API = "https://graph.facebook.com/v21.0";

if (!TOKEN || !IG) {
  console.error("Missing META_PAGE_TOKEN or META_IG_ID");
  process.exit(1);
}

const MAP = {
  "2026-09-24": { id: "W2-01", img: "W2-01-fb.png", story: "W2-S01.png" },
  "2026-09-25": { id: "W2-02", img: "W2-02-fb.png", story: "W2-S02.png" },
  "2026-09-26": { id: "W2-03", img: "W2-03-fb.png", story: "W2-S03.png" },
  "2026-09-27": { id: "W2-04", img: "W2-04-fb.png", story: "W2-S04.png" },
  "2026-09-28": { id: "W2-05", img: "W2-05-fb.png", story: "W2-S05.png" },
  "2026-09-29": {
    id: "W2-06",
    img: "W2-06-fb.png",
    story: "W2-S06.png",
    slides: [
      "W2-06-slide-01-fb.png",
      "W2-06-slide-02-fb.png",
      "W2-06-slide-03-fb.png",
      "W2-06-slide-04-fb.png",
    ],
  },
  "2026-09-30": { id: "W2-07", img: "W2-07-fb.png", story: "W2-S07.png" },
  "2026-10-01": { id: "W2-08", img: "W2-08-fb.png", story: "W2-S08.png" },
  "2026-10-02": { id: "W2-09", img: "W2-09-fb.png", story: "W2-S09.png" },
  "2026-10-03": { id: "W2-10", img: "W2-10-fb.png", story: "W2-S10.png" },
};

function chicagoDate() {
  return new Intl.DateTimeFormat("en-CA", {
    timeZone: "America/Chicago",
    year: "numeric",
    month: "2-digit",
    day: "2-digit",
  }).format(new Date());
}

function kindNow() {
  if (KIND_IN === "feed" || KIND_IN === "story") return KIND_IN;
  const hour = Number(
    new Intl.DateTimeFormat("en-US", {
      timeZone: "UTC",
      hour: "numeric",
      hour12: false,
    }).format(new Date())
  );
  if (hour === 16) return "feed";
  if (hour === 17) return "story";
  return "feed";
}

function igCaption(md, id) {
  const re = new RegExp(
    `##[^\\n]*${id}[^\\n]*\\n[\\s\\S]*?### Instagram\\n([\\s\\S]*?)(?=\\n---|\\n## |$)`
  );
  const m = md.match(re);
  if (!m) throw new Error("No IG caption for " + id);
  return m[1].replace(/\*\*/g, "").trim();
}

async function graph(path, body) {
  const url = `${API}/${path}`;
  const res = await fetch(url, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ ...body, access_token: TOKEN }),
  });
  const json = await res.json();
  if (json.error) {
    throw new Error(json.error.message + " code=" + json.error.code);
  }
  return json;
}

async function waitContainer(id) {
  for (let i = 0; i < 20; i++) {
    const res = await fetch(
      `${API}/${id}?fields=status_code&access_token=${encodeURIComponent(TOKEN)}`
    );
    const json = await res.json();
    if (json.status_code === "FINISHED") return;
    if (json.status_code === "ERROR") throw new Error("container error " + id);
    await new Promise((r) => setTimeout(r, 3000));
  }
  throw new Error("container not ready " + id);
}

async function main() {
  const requested = (process.env.DATE || "").trim();
  const dateKey = requested || chicagoDate();
  if (requested && !/^\d{4}-\d{2}-\d{2}$/.test(requested)) {
    throw new Error("DATE must be YYYY-MM-DD");
  }
  const post = MAP[dateKey];
  if (!post) {
    console.log("SKIP " + dateKey + " not in Week 2 window");
    return;
  }
  const kind = kindNow();
  const fs = await import("node:fs/promises");
  const md = await fs.readFile("social/w2/CAPTIONS.md", "utf8");

  if (kind === "story") {
    const c = await graph(`${IG}/media`, {
      image_url: `${BASE}/${post.story}`,
      media_type: "STORIES",
    });
    await waitContainer(c.id);
    const pub = await graph(`${IG}/media_publish`, { creation_id: c.id });
    console.log("OK story " + post.id + " " + pub.id);
    return;
  }

  if (post.slides) {
    const children = [];
    for (const s of post.slides) {
      const c = await graph(`${IG}/media`, {
        image_url: `${BASE}/${s}`,
        is_carousel_item: true,
      });
      await waitContainer(c.id);
      children.push(c.id);
    }
    const car = await graph(`${IG}/media`, {
      media_type: "CAROUSEL",
      children: children.join(","),
      caption: igCaption(md, post.id),
    });
    await waitContainer(car.id);
    const pub = await graph(`${IG}/media_publish`, { creation_id: car.id });
    console.log("OK carousel " + post.id + " " + pub.id);
    return;
  }

  const c = await graph(`${IG}/media`, {
    image_url: `${BASE}/${post.img}`,
    caption: igCaption(md, post.id),
  });
  await waitContainer(c.id);
  const pub = await graph(`${IG}/media_publish`, { creation_id: c.id });
  console.log("OK feed " + post.id + " " + pub.id);
}

main().catch((e) => {
  console.error("FAIL " + e.message);
  process.exit(1);
});
