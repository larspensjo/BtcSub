library BtcSub;

import 'dart:html';

class BitcoinTransactionSubscription {
  WebSocket _ws;
  BitcoinTransactionSubscription() {
    _ws = new WebSocket('ws://ws.blockchain.info/inv');
    _ws.onOpen.listen(onOpen);
    _ws.onMessage.listen(onData);
    _ws.onClose.listen(onClose);
  }

  void onOpen(Event e) {
    print('BitcoinTransactionSubscription:onOpen $e');
    _ws.send('{"op":"unconfirmed_sub"}');
  }

  void onData(MessageEvent e) {
    print('BitcoinTransactionSubscription:onData ${e.data}');
  }

  void onClose(Event e) {
    print('BitcoinTransactionSubscription:onClose $e');
  }
}