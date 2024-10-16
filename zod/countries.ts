import { z } from 'zod';

export const Countries = z.object({
  country_iso_3166_1_alpha3: z.string(),
  country_iso_3166_1_alpha2: z.string(),
  country_iso_3166_1_numeric: z.int2(),
  country_name_toki_pona: z.string().nullable().optional(),
  country_name_english: z.string().nullable().optional(),
  country_name_native: z.string().nullable().optional(),
  country_e_164: z.int2().nullable().optional(),
  country_language: z.string().nullable().optional(),
  country_flag_url: z.string().nullable().optional(),
  country_is_independent: z.boolean(),
});

export type CountriesT = z.infer<typeof Countries>;
