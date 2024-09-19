import { z } from 'zod';

export const Iso_639 = z.object({
  iso_639_2: z.string(),
  iso_639_english_name: z.string(),
  iso_639_korean_name: z.string(),
  iso_639_1: z.string().nullable().optional(),
});

export type Iso_639T = z.infer<typeof Iso_639>;
