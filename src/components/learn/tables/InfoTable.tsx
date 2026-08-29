import { LEARN_LAW_NOTE } from "@/lib/data/learn-content";

type InfoTableProps = {
  caption: string;
  headers: string[];
  rows: string[][];
};

export function InfoTable({ caption, headers, rows }: InfoTableProps) {
  return (
    <figure className="overflow-hidden rounded-lg border border-gray-200 bg-white">
      <figcaption className="border-b border-gray-100 px-3 py-2 text-sm font-medium text-gray-800">
        {caption}
      </figcaption>
      <div className="overflow-x-auto">
        <table className="min-w-full text-left text-sm">
          <thead>
            <tr className="bg-teal-50">
              {headers.map((header) => (
                <th
                  key={header}
                  className="whitespace-nowrap px-3 py-2 font-medium text-teal-900"
                >
                  {header}
                </th>
              ))}
            </tr>
          </thead>
          <tbody>
            {rows.map((row) => (
              <tr key={row.join("\t")} className="border-t border-gray-100">
                {row.map((cell, index) => (
                  <td
                    key={`${row[0]}-${index}`}
                    className="whitespace-nowrap px-3 py-2 text-gray-800"
                  >
                    {cell}
                  </td>
                ))}
              </tr>
            ))}
          </tbody>
        </table>
      </div>
      <p className="border-t border-gray-100 px-3 py-2 text-xs text-gray-500">
        {LEARN_LAW_NOTE}
      </p>
    </figure>
  );
}
