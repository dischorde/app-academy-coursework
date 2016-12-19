class View {
  constructor(game, $el) {
    this.game = game;
    $el.append(this.setupBoard());
  }

  bindEvents() {
    let $listitems = $('li');
    $listitems.on('click', (event) => {
      this.makeMove($(event.currentTarget));
      if (this.game.isOver()) {
        let curGame = this.game;
        setTimeout(() => {
          alert(`${curGame.winner()} won!`);
        }, 500 );
      }
    });
  }

  makeMove($square) {
    let pos = $square.data('pos');
    let player = this.game.currentPlayer;
    try {
      this.game.playMove(pos);
    }
    catch (MoveError) {
      alert(MoveError.msg);
    }

    let $marker = $("<span class='marked'>");
    $marker.text(player);
    $square.append($marker);
    $square.addClass(player);
  }

  setupBoard() {
    let $grid = $('<ul>');
    for(let i = 0; i < 9; i++) {
      let $li = $('<li>');
      let rowIdx = Math.floor(i / 3);
      let colIdx = i % 3;
      $li.data('pos', [rowIdx, colIdx]);
      $grid.append($li);
    }

    return $grid;
  }
}

module.exports = View;
