const ADS_TXT_CERTIFICATION_AUTHORITY_ID = "f08c47fec0942fa0";

function getPublisherId(): string | null {
  const publisherId = process.env.ADSENSE_PUBLISHER_ID?.trim();

  if (!publisherId || !/^pub-\d{16}$/.test(publisherId)) {
    return null;
  }

  return publisherId;
}

export function GET() {
  const publisherId = getPublisherId();

  if (!publisherId) {
    return new Response("ads.txt is not configured.\n", {
      status: 404,
      headers: {
        "Content-Type": "text/plain; charset=utf-8",
        "Cache-Control": "public, max-age=300",
      },
    });
  }

  return new Response(
    `google.com, ${publisherId}, DIRECT, ${ADS_TXT_CERTIFICATION_AUTHORITY_ID}\n`,
    {
      headers: {
        "Content-Type": "text/plain; charset=utf-8",
        "Cache-Control": "public, max-age=3600",
      },
    }
  );
}
