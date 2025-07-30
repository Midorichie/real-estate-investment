import { Clarinet, Tx, Chain, Account, types } from "clarinet-sdk";

Clarinet.test({
  name: "Investor adds funds and updates pool",
  async fn(chain: Chain, accounts: Map<string, Account>) {
    const wallet1 = accounts.get("wallet_1")!;

    let block = chain.mineBlock([
      Tx.contractCall("pool", "add-investment", [types.uint(100_000_000)], wallet1.address),
    ]);
    block.receipts[0].result.expectOk().expectBool(true);

    let total = chain.callReadOnlyFn("pool", "get-total-pool", [], wallet1.address);
    total.result.expectOk().expectUint(100_000_000);

    let contrib = chain.callReadOnlyFn("pool", "get-contribution", [types.principal(wallet1.address)], wallet1.address);
    contrib.result.expectOk().expectUint(100_000_000);
  },
});
