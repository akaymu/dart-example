void main () {
  var deck = new Deck();
  
  // Shuffle
  deck.shuffle();
  
  // Player 1
  var player1 = deck.deal(5);
  print('Player 1: $player1');
  
  // Player 2
  var player2 = deck.deal(5);
  print('Player 2: $player2');
}

class Deck {
  List<Card> cards = [];
  
  Deck () {
    var ranks = ['As', 'İki', 'Üç', 'Dört', 'Beş', 'Altı', 'Yedi', 'Sekiz', 'Dokuz', 'On',
                 'Bacak', 'Kız', 'Papaz'];
    
    var suits = ['Karo', 'Kupa', 'Sinek', 'Maça'];
    
    for (var suit in suits) {
      for (var rank in ranks) {
        var card = new Card(rank: rank, suit: suit);
        cards.add(card);
      }
    }
  }
  
  toString () {
    return this.cards.toString();
  }
  
  shuffle () {
    this.cards.shuffle();
  }
  
  cardsWithSuit (String suit) {
    return this.cards.where((card) => card.suit == suit).toList();
  }
  
  deal (int handSize) {
    var hand = cards.sublist(0, handSize);
    this.cards = this.cards.sublist(handSize);
    
    return hand;
  }
  
  removeCard (String suit, String rank) {
    this.cards.removeWhere((card) => ((card.suit == suit) && (card.rank == rank)));
  }
}

class Card {
  String suit;
  String rank;
  
  Card({this.rank, this.suit});
  
  toString () {
    return '$suit $rank';
  }
}
