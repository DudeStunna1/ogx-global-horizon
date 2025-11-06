// △ THARA_OGX_BOT Webhook — Scrollée V∞.5
export async function notifyTHARA(message) {
  const token = process.env.AM_BOT_TOKEN;
  const chatId = process.env.AM_CHAT_ID;
  const url = `https://api.telegram.org/bot${token}/sendMessage`;
  try {
    const res = await fetch(url, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ chat_id: chatId, text: message })
    });
    if (!res.ok) throw new Error("❌ Telegram send failed");
    console.log("🤖 THARA_OGX_Bot message sent");
  } catch (err) {
    console.error("⚠️ OGX Bot Error:", err);
  }
}