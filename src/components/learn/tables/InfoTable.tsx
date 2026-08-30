import { PlateFrame } from "@/components/learn/PlateFrame";
import { LEARN_LAW_NOTE } from "@/lib/data/learn-content";

type InfoTableProps = {
  plateNumber: number;
  caption: string;
  headers: string[];
  rows: string[][];
};

function looksNumeric(value: string): boolean {
  return /[0-9０-９]/.test(value);
}

export function InfoTable({ plateNumber, caption, headers, rows }: InfoTableProps) {
  return (
    <PlateFrame kind="TABLE" number={plateNumber} caption={caption} footnote={LEARN_LAW_NOTE}>
      <div className="overflow-x-auto">
        <table className="plate-table">
          <thead>
            <tr>
              {headers.map((header) => (
                <th key={header}>{header}</th>
              ))}
            </tr>
          </thead>
          <tbody>
            {rows.map((row) => (
              <tr key={row.join("\t")}>
                {row.map((cell, index) => (
                  <td
                    key={`${row[0]}-${index}`}
                    className={looksNumeric(cell) ? "font-mono" : undefined}
                  >
                    {cell}
                  </td>
                ))}
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </PlateFrame>
  );
}
