
let key = "";

export default function handler(req, res) {
  key = "OMEGA-" + Math.random().toString(36).substr(2, 6).toUpperCase();
  res.status(200).json({ key });
  globalThis.latestKey = key;
}
