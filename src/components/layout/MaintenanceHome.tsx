import { CrossMark } from "@/components/ui/CrossMark";
import { currentExam } from "@/config/exams";

export function MaintenanceHome() {
  return (
    <main>
      <section className="editorial-hero">
        <div className="eh-bgnum" aria-hidden>
          --
        </div>

        <div className="eh-top">
          <span className="eh-mark">
            <CrossMark size={28} />
            EXAMSTUDYCOACH
          </span>
          <span className="eh-nav">MAINTENANCE</span>
        </div>

        <div className="eh-mid">
          <div className="eh-eyebrow">TEMPORARY SERVICE PAUSE</div>
          <h1 className="eh-title">
            メンテナンス中です
          </h1>
        </div>

        <div className="eh-bottom">
          <div className="eh-bottom-copy">
            <p className="eh-desc">
              {currentExam.siteName}は、ただいま一時的にサービスを停止しています。
              <br />
              再開まで、しばらくお待ちください。
            </p>
          </div>
        </div>
      </section>
    </main>
  );
}
