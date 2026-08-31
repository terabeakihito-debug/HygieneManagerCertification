import { ImageResponse } from "next/og";

export const alt = "衛生管理者試験対策｜第一種・第二種の過去問演習と模試";
export const size = { width: 1200, height: 630 };
export const contentType = "image/png";

const TITLE = "衛生管理者試験対策";
const SUB = "第一種・第二種対応｜過去問演習・模試・学習コンテンツ";
const FONT_URL =
  "https://github.com/google/fonts/raw/main/ofl/zenkakugothicnew/ZenKakuGothicNew-Black.ttf";

async function loadDisplayFont(): Promise<ArrayBuffer | null> {
  const response = await fetch(FONT_URL);
  if (!response.ok) {
    return null;
  }
  return response.arrayBuffer();
}

export default async function OpenGraphImage() {
  const fontData = await loadDisplayFont().catch(() => null);

  return new ImageResponse(
    (
      <div
        style={{
          position: "relative",
          width: "100%",
          height: "100%",
          display: "flex",
          flexDirection: "column",
          justifyContent: "space-between",
          background: "#14211A",
          color: "#F1F1EC",
          padding: "64px 72px",
          fontFamily: fontData ? "Zen Kaku Gothic New" : "sans-serif",
        }}
      >
        <div
          style={{
            position: "absolute",
            top: "-32px",
            right: "40px",
            display: "flex",
            fontSize: 240,
            fontWeight: 800,
            color: "rgba(241, 241, 236, 0.06)",
            lineHeight: 1,
          }}
        >
          01
        </div>
        <div style={{ display: "flex", alignItems: "center", gap: 16 }}>
          <div
            style={{
              width: 44,
              height: 44,
              background: "#1F6E45",
              display: "flex",
              alignItems: "center",
              justifyContent: "center",
              position: "relative",
            }}
          >
            <div
              style={{
                position: "absolute",
                width: 22,
                height: 6,
                background: "#ffffff",
              }}
            />
            <div
              style={{
                position: "absolute",
                width: 6,
                height: 22,
                background: "#ffffff",
              }}
            />
          </div>
          <div
            style={{
              display: "flex",
              fontSize: 18,
              letterSpacing: "0.14em",
              color: "#C9932B",
            }}
          >
            CERTIFICATION EXAM PREP
          </div>
        </div>
        <div style={{ display: "flex", flexDirection: "column", gap: 20 }}>
          <div
            style={{
              display: "flex",
              fontSize: 68,
              fontWeight: 900,
              lineHeight: 1.15,
              letterSpacing: "-0.02em",
            }}
          >
            {TITLE}
          </div>
          <div
            style={{
              display: "flex",
              fontSize: 26,
              color: "rgba(241, 241, 236, 0.75)",
            }}
          >
            {SUB}
          </div>
        </div>
      </div>
    ),
    {
      ...size,
      fonts: fontData
        ? [
            {
              name: "Zen Kaku Gothic New",
              data: fontData,
              weight: 900,
              style: "normal",
            },
          ]
        : [],
    }
  );
}
