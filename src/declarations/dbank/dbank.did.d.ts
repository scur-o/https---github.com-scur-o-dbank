import type { Principal } from '@dfinity/principal';
export interface _SERVICE {
  'checkBalance' : () => Promise<bigint>,
  'depositFunds' : (arg_0: bigint) => Promise<undefined>,
  'withdrawFunds' : (arg_0: bigint) => Promise<undefined>,
}
