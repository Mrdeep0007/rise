module MyModule::DecentralizedLottery {

    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;
    use std::vector;

    struct Lottery has store, key {
        ticket_price: u64,
        participants: vector<address>,
        prize_pool: u64,
    }

    public fun create_lottery(owner: &signer, ticket_price: u64) {
        let lottery = Lottery {
            ticket_price,
            participants: vector::empty<address>(),
            prize_pool: 0,
        };
        move_to(owner, lottery);
    }
}
