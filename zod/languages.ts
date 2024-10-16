import { z } from 'zod';

export const Languages = z.object({
  language_iso_639_3: z.string(),
  language_name_english: z.string(),
});

export type LanguagesT = z.infer<typeof Languages>;
