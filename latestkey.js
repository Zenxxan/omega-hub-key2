
export default function handler(req, res) {
  const key = globalThis.latestKey || "NO-KEY-GENERATED";
  res.status(200).json({ key });
}
