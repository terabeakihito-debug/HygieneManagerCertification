import type { Metadata } from "next";
import { NoIndexLayout } from "@/components/seo/NoIndexLayout";
import { noIndexMetadata } from "@/lib/seo";

export const metadata: Metadata = noIndexMetadata;

export default NoIndexLayout;
