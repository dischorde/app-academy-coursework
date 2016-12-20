class View {
  constructor(game, $figure) {
    this.game = game;
    this.figure = $figure;
    this.setupTowers();
    this.setListeners();
    this.fromPile = null;
    this.toPile = null;
  }

  setupTowers () {
    let $first = $("<ul id='first'>").data('value', 0);
    for (let i = 0; i < 3; i++) {
      console.log(i);
      let $li = $("<li>");
      let size = this.game.towers[0][i];
      $($li).data('val', size);
      $($li).css('width', `${(size) * 30}%`);
      $first.append($li);
    }

    this.figure.append($first);

    let $second = $("<ul id='second'></ul>").data('value', 1);
    this.figure.append($second);

    let $third = $("<ul id='third'></ul>").data('value', 2);
    this.figure.append($third);
  }

  render() {
    if (this.toPile !== null) {
      if (this.game.move(this.fromPile.data('value'), this.toPile.data('value')) === true) {
        console.log(this.fromPile.data('value'));
        let $currListItem = $(':last-child', this.fromPile).detach();
        this.toPile.append($currListItem);
      }
      this.fromPile = null;
      this.toPile = null;
    }
  }

  setListeners() {
    $('ul').on('click', (event) => {
      if (this.fromPile === null) {
        this.fromPile = $(event.currentTarget);
      } else {
        this.toPile = $(event.currentTarget);
      }
      this.render();
      if (this.game.isWon()) {
        setTimeout(() => {
          alert("You Won!!!!");
        }, 500 );
      }
    });
  }
}

module.exports = View;
