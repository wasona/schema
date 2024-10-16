import { z } from 'zod';

export const Languages = z.object({
});

export type LanguagesT = z.infer<typeof Languages>;
